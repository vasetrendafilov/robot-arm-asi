import io
from numpy.core.records import array
import sympy as sp
import numpy as np
import pandas as pd
import ipywidgets as widgets
import plotly.graph_objects as go
#import pyswarms as ps

def hpose3(x=(1, 0, 0), y=(0, 1, 0), z=(0, 0, 1), t=(0, 0, 0)):
    """Return a pose in 3D homogeneous coordinates where the arguments are the new frame's axes and translation vector."""
    return sp.Matrix.vstack(sp.Matrix([tuple(x), tuple(y), tuple(z), tuple(t)]).T, sp.Matrix([0, 0, 0, 1]).T)

def htranslation3(x=0, y=0, z=0):
    """Return transformation matrix in 3D homogeneous coordinates with embedded translation."""
    return sp.Matrix([[1, 0, 0, x],
                      [0, 1, 0, y],
                      [0, 0, 1, z],
                      [0, 0, 0, 1]])

def hrotation3(axis, angle):
    if axis in ['x', 'n']:
        return sp.Matrix([
            [1, 0, 0, 0],
            [0, sp.cos(angle), -sp.sin(angle), 0], 
            [0, sp.sin(angle), sp.cos(angle), 0],
            [0, 0, 0, 1]
        ])
    elif axis in ['y', 'o']:
        return sp.Matrix([
            [sp.cos(angle), 0, sp.sin(angle), 0],
            [0, 1, 0, 0],
            [-sp.sin(angle), 0, sp.cos(angle), 0],
            [0, 0, 0, 1]
        ])
    elif axis in ['z', 'a']:
        return sp.Matrix([
            [sp.cos(angle), -sp.sin(angle), 0, 0], 
            [sp.sin(angle), sp.cos(angle), 0, 0], 
            [0, 0, 1, 0],
            [0, 0, 0, 1]
        ])
    else:
        raise ValueError(f'Expected one of [x, y, z, n, o, a] but received {axis}.')

def euler_angles(pose, sequence):
    """
    Return the euler angles for the given rotation.
    
    :param pose: is a rotation or transformation matrix.
    :type pose: Matrix
    ...
    :param sequence: is the euler angles configuration.
    :type sequence: string 
    ...
    raise ValueError: if an invalid or unsupported euler angle sequence is received.
    ...
    :return: the euler angles.
    """
#     Ова се дел од Ојлеровите агли.
#     За останатите оди на https://www.geometrictools.com/Documentation/EulerAngles.pdf
    sequence = sequence.lower()
    if sequence == 'zyz':
        if pose[2, 2] == 1:
            theta_1, theta_2, theta_3 = sp.atan2(pose[1, 0], pose[1, 1]), 0, 0
        elif pose[2, 2] == -1:
            theta_1, theta_2, theta_3 = -sp.atan2(pose[1, 0], pose[1, 1]), sp.pi, 0
        else:
            theta_1 = sp.atan2(pose[1, 2], pose[0, 2])
            theta_2 = sp.acos(pose[2, 2])
            theta_3 = sp.atan2(pose[2, 1], -pose[2, 0])
        return sp.Matrix([theta_1, theta_2, theta_3])
    elif sequence == 'zyx':
        if pose[2, 0] == 1:
            theta_1, theta_2, theta_3 = sp.atan2(-pose[1, 2], pose[1, 1]), -sp.pi/2, 0
        elif pose[2, 0] == -1:
            theta_1, theta_2, theta_3 = -sp.atan2(-pose[1, 2], pose[1, 1]), sp.pi/2, 0
        else:
            theta_1 = sp.atan2(pose[1, 0], pose[0, 0])
            theta_2 = sp.asin(-pose[2, 0])
            theta_3 = sp.atan2(pose[2, 1], pose[2, 2])
        return sp.Matrix([theta_1, theta_2, theta_3])
    elif sequence == 'xyz':
        if pose[0, 2] == 1:
            theta_1, theta_2, theta_3 = sp.atan2(pose[1, 0], pose[1, 1]), sp.pi/2, 0
        elif pose[0, 2] == -1:
            theta_1, theta_2, theta_3 = -sp.atan2(pose[1, 0], pose[1, 1]), -sp.pi/2, 0
        else:
            theta_1 = sp.atan2(-pose[1, 2], pose[2, 2])
            theta_2 = sp.asin(pose[0, 2])
            theta_3 = sp.atan2(-pose[0, 1], pose[0, 0])
        return sp.Matrix([theta_1, theta_2, theta_3])
    elif sequence == 'xzy':
        if pose[0, 1] == 1:
            theta_1, theta_2, theta_3 = sp.atan2(-pose[2, 0], pose[2, 2]), -sp.pi/2, 0
        elif pose[0, 1] == -1:
            theta_1, theta_2, theta_3 = -sp.atan2(-pose[2, 0], pose[2, 2]), sp.pi/2, 0
        else:
            theta_1 = sp.atan2(pose[2, 1], pose[1, 1])
            theta_2 = sp.asin(-pose[0, 1])
            theta_3 = sp.atan2(pose[0, 2], pose[0, 0])
        return sp.Matrix([theta_1, theta_2, theta_3])
    raise ValueError(f'Invalid or unsupported euler angle sequence {sequence}.')

def rotation_matrix_from_euler_angles(euler_angles, sequence):
    """
    Return a transformation matrix for the given euler angles.
    
    :param euler_angles: are the euler angles.
    :type euler_angles: Matrix
    ...
    :param sequence: is the euler angles configuration.
    :type sequence: string 
    ...
    raise ValueError: if an invalid or unsupported euler angle sequence is received.
    ...
    :return: a transformation matrix for the given euler angles.
    """
    sequence = sequence.lower()
    if not all([char in 'xyz' for char in sequence]) or len(sequence) != 3:
        raise ValueError(f'Invalid or unsupported euler angle sequence {sequence}.')
    T1 = hrotation3(sequence[0], euler_angles[0])
    T2 = hrotation3(sequence[1], euler_angles[1])
    T3 = hrotation3(sequence[2], euler_angles[2])
    return T1 * T2 * T3

def frame_lines(pose, line_length=1):
    t = np.reshape(pose[:3, -1], (3,1))
    line_n = np.hstack((t, t + line_length * np.reshape(pose[:3, 0], (3,1))))
    line_o = np.hstack((t, t + line_length * np.reshape(pose[:3, 1], (3,1))))
    line_a = np.hstack((t, t + line_length * np.reshape(pose[:3, 2], (3,1))))
    return line_n, line_o, line_a

def draw_frame(pose, labels='x-y-z', colors=('red', 'green', 'blue'), line_width=3, line_length=1):
    def go_scatter(x, y, z, name, color, width):
        return go.Scatter3d(
            x=x, y=y, z=z,
            marker=dict(size=2),
            line=dict(color=color, width=width),
            name=name)
    
    labels = labels.split('-')
    line_n, line_o, line_a = frame_lines(pose, line_length)
    scatter_n = go_scatter(*line_n.tolist(), labels[0], colors[0], line_width)
    scatter_o = go_scatter(*line_o.tolist(), labels[1], colors[1], line_width)
    scatter_a = go_scatter(*line_a.tolist(), labels[2], colors[2], line_width)
    return scatter_n, scatter_o, scatter_a

def dh_joint_to_joint(theta, d, a, alpha):
    """ Get the DH model elementary matrix consisted of theta, d, a, apha parameters. """
    return hrotation3('z', theta) * htranslation3(x=a, z=d) * hrotation3('x', alpha)

class SerialLinkRobot:
    """
    A class to easily create and interact with robotic arm.
    """
    
    def __init__(self, sizeref=0.2):
        self.sizeref = sizeref
        self.reset()
    
    def reset(self):
        """ Reset the robotic arm data. """
        self.links = []
        self.joint_variables = []
        self.subs_joints = []
        self.subs_additional = []
        self.ofsets = (0,0,0)
        self.stop_update_for_slider_joint = False
        self.trail_color_index = 1
        self.trail_color_list = []
        self.constraints = (np.array([-np.pi*7/18 , -np.pi*2/9 , -np.pi*8/9 , -np.pi , -np.pi, -np.pi]),
                            np.array([ np.pi*7/18 ,  np.pi*11/18 ,  np.pi*8/9 ,  np.pi ,  np.pi,  np.pi]))
   
    def add_dead_joint(self, theta, d, a, alpha):
        temp = sp.symbols('temp'+str(np.random.random(1)[0]*100))
        self.links.append(('revolute', theta, d, a, alpha))
        self.joint_variables.append(temp)
        self.subs_joints.append((temp, theta))   

    def add_revolute_joint(self, theta, d, a, alpha):
        self.links.append(('revolute', theta, d, a, alpha))
        self.joint_variables.append(theta)
        self.subs_joints.append((theta, 0))

    def add_prismatic_joint(self, theta, d, a, alpha):
        self.links.append(('prismatic', theta, d, a, alpha))
        self.joint_variables.append(d)
        self.subs_joints.append((d, 1))
    
    def add_subs(self, subs):
        self.subs_additional = subs

    def add_ofsets(self,ofsets):
        self.ofsets = ofsets
        self.links[-1] = (self.links[-1][0],self.links[-1][1],abs(ofsets[2]),abs(ofsets[0]),self.links[-1][4])
    
    def get_dh_joint_to_joint(self, start_joint, end_joint):
        pose = hpose3()
        for link in self.links[start_joint:end_joint]:
            _, theta, d, a, alpha = link
            pose = pose * dh_joint_to_joint(theta, d, a, alpha)
        pose.simplify()
        return pose

    def get_dh_matrix(self):
        """ Get the DH model transformation matrix for the whole robotic arm. """
        return self.get_dh_joint_to_joint(start_joint=0, end_joint=len(self.links))
    
    def get_dh_table(self):
        """ Return the DH table intended for visual purposes only. """
        return sp.Matrix(self.links)[:, 1:]
    
    def linear_jacobian(self):
        """ Return the linear jacobian for this robotic arm. """
        linear_jacobian = self.get_dh_matrix()[:3, 3].jacobian(self.joint_variables)
        linear_jacobian.simplify()
        return linear_jacobian
    
    def angular_jacobian(self):
        """ Return the angular jacobian for this robotic arm. """
        pose = hpose3()
        angular_jacobian = sp.Matrix([[], [], []])
        for link in self.links:
            joint_type, theta, d, a, alpha = link
            z_i_m1 = sp.Matrix([0, 0, 0]) if joint_type == 'prismatic' else pose[:3, 2]
            angular_jacobian = sp.Matrix.hstack(angular_jacobian, z_i_m1)
            pose = pose * dh_joint_to_joint(theta, d, a, alpha)
        
        angular_jacobian.simplify()
        return angular_jacobian
    
    def jacobian(self):
        """ Return the jacobian for this robotic arm. """
        return sp.Matrix.vstack(self.linear_jacobian(), self.angular_jacobian())

    def getTransformMatrix(self, theta, d, a, alpha):
        T = np.array([[np.cos(theta) , -np.sin(theta)*np.cos(alpha) ,  np.sin(theta)*np.sin(alpha) , a*np.cos(theta)],
                    [np.sin(theta) ,  np.cos(theta)*np.cos(alpha) , -np.cos(theta)*np.sin(alpha) , a*np.sin(theta)],
                    [0             ,  np.sin(alpha)               ,  np.cos(alpha)               , d              ],
                    [0             ,  0                           ,  0                           , 1              ]
                    ])
        return T

    def get_end_tip(self,params):
        # Create the transformation matrices for the respective joints
        t_00 = np.array([[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]])
        t_01 = self.getTransformMatrix(params[0], 0.41,   0.20,  np.pi/2)
        t_12 = self.getTransformMatrix(params[1], 0,      0.59,  0)
        t_23 = self.getTransformMatrix(params[2], 0,   0,     np.pi/2)
        t_34 = self.getTransformMatrix(np.pi/2,   0,      0,     np.pi/2)
        t_45 = self.getTransformMatrix(params[3], 0.52,   0,     np.pi/2)
        t_56 = self.getTransformMatrix(params[4], 0,      0,   0) 
        t_67 = self.getTransformMatrix(np.pi/2,   0,      0,     np.pi/2) 
        t_78 = self.getTransformMatrix(params[5], 0,    0,   0) 
        return  t_00.dot(t_01).dot(t_12).dot(t_23).dot(t_34).dot(t_45).dot(t_56).dot(t_67).dot(t_78)

    def distance(self, query, target):
        q_nx,q_ox,q_ax,q_px,q_ny,q_oy,q_ay,q_py,q_nz,q_oz,q_az,q_pz = self.get_end_tip(query)[:3,:4].flatten()
        t_nx,t_ox,t_ax,t_px,t_ny,t_oy,t_ay,t_py,t_nz,t_oz,t_az,t_pz = target[:3,:4].flatten()
        #c_theta1, c_theta2, c_theta3, c_theta4, c_theta5, c_theta6 = [ x[1] for i,x in enumerate(self.subs_joints) if i not in (3,6)]        
        #q_theta1, q_theta2, q_theta3, q_theta4, q_theta5, q_theta6 = query      
        #p_dist = np.sqrt(np.square(t_px - q_px) + np.square(t_py - q_py) + np.square(t_pz - q_pz))
        n_dist = np.sqrt(np.square(t_nx - q_nx) + np.square(t_ny - q_ny) + np.square(t_nz - q_nz))
        o_dist = np.sqrt(np.square(t_ox - q_ox) + np.square(t_oy - q_oy) + np.square(t_oz - q_oz))
        a_dist = np.sqrt(np.square(t_ax - q_ax) + np.square(t_ay - q_ay) + np.square(t_az - q_az))
        #an_dist = np.abs(c_theta1-q_theta1)+np.abs(c_theta2-q_theta2)+np.abs(c_theta3-q_theta3)
        #+np.abs(c_theta4-q_theta4)+ np.abs(c_theta5-q_theta5)+ np.abs(c_theta6-q_theta6)

        return  self.betha*(n_dist+o_dist+a_dist) #+ self.gama*an_dist

    def opt_func(self,X):
        n_particles = X.shape[0]  # number of particles
        dist = [self.distance(X[i], self.target) for i in range(n_particles)]
        return np.array(dist)
        
    def IKsolver(self,target,iterations):
        swarm_size = 15
        dim = 6  # 'c1': 1.3, 'c2':2.5, 'w':0.5 best config so far
        options = {'c1': 1.3, 'c2':3, 'w':0.5}
        self.alpha = 1
        self.betha = 1
        self.gama = 0
        self.target = target

        joint_vars = [0.1,0.1,0.1,0.1,0.1,0.1]
        cost = 1

        while cost > 0.0001:    
            initial_positions = np.random.uniform(-cost,cost,size=(swarm_size,3)) + joint_vars
            initial_positions = np.column_stack(([initial_positions[:,i].clip(self.constraints[0][i],self.constraints[1][i]) for i in range(3)]))
            self.optimizer = ps.single.GlobalBestPSO(n_particles=swarm_size,
                                            dimensions=dim,
                                            options=options,
                                            bounds=self.constraints,
                                            init_pos= np.array(initial_positions).copy())
            cost, joint_vars = self.optimizer.optimize(self.opt_func, iters=iterations)
                            
        return cost, joint_vars
    
    def IK(self,target,up=True):
        d1, a1, a2, d5  = self.links[0][2], self.links[0][3], self.links[1][3], self.links[4][2]
       
        theta1 = np.arctan2(target[1,3],target[0,3])
        r = (target[0,3]-a1*np.cos(theta1))**2 + (target[1,3]-a1*np.sin(theta1))**2 + (target[2,3]-d1)**2
        if up:#za odzgore
            theta3 = -np.arccos(( r - a2**2-d5**2)/(2*a2*d5))
            theta2 = np.arcsin((target[2,3]-d1)/(np.sqrt(r))) - np.arctan2((d5*np.sin(theta3)),(a2+d5*np.cos(theta3)))
        else:
            theta3 = np.arccos(( r - a2**2-d5**2)/(2*a2*d5))
            theta2 = np.arcsin((target[2,3]-d1)/(np.sqrt(r))) - np.arctan2((d5*np.sin(theta3)),(a2+d5*np.cos(theta3)))

        if np.isnan(theta1) or not(self.constraints[0][0] <= theta1 <= self.constraints[1][0]):
            print("Theta1 не е во граници ["+str(self.constraints[0][0]*180/np.pi)+","+str(self.constraints[1][0]*180/np.pi)+"]")
            return None
        if np.isnan(theta2) or not(self.constraints[0][1] <= theta2 <= self.constraints[1][1]):
            print("Theta2 не е во граници ["+str(self.constraints[0][1]*180/np.pi)+","+str(self.constraints[1][1]*180/np.pi)+"]")
            return None
        if np.isnan(theta3) or not(self.constraints[0][2] <= theta3 <= self.constraints[1][2]):
            print("Theta3 не е во граници ["+str(self.constraints[0][2]*180/np.pi)+","+str(self.constraints[1][2]*180/np.pi)+"]")
            return None

        R03 = np.array([[ np.sin(theta1), np.sin(theta2 + theta3)*np.cos(theta1), np.cos(theta1)*np.cos(theta2 + theta3)],
                        [-np.cos(theta1), np.sin(theta1)*np.sin(theta2 + theta3), np.sin(theta1)*np.cos(theta2 + theta3)],
                        [           0,            -np.cos(theta2 + theta3),             np.sin(theta2 + theta3)]])
        R36 = np.linalg.inv(R03).dot(target[:3,:3])

        eq = np.array([
            (-np.arccos(-R36[0,2]/np.sqrt(1 - R36[2,2]**2)) + 2*np.pi,np.pi - np.arcsin(R36[2,2]),np.pi - np.arcsin(R36[2,0]/np.sqrt(1 - R36[2,2]**2))),
            (-np.arccos(-R36[0,2]/np.sqrt(1 - R36[2,2]**2)) + 2*np.pi, np.pi - np.arcsin(R36[2,2]), np.arcsin(R36[2,0]/np.sqrt(1 - R36[2,2]**2))),
            (-np.arccos(R36[0,2]/np.sqrt(1 - R36[2,2]**2)) + 2*np.pi, np.arcsin(R36[2,2]), np.arcsin(R36[2,0]/np.sqrt(1 - R36[2,2]**2)) + np.pi),
            (-np.arccos(R36[0,2]/np.sqrt(1 - R36[2,2]**2)) + 2*np.pi, np.arcsin(R36[2,2]), -np.arcsin(R36[2,0]/np.sqrt(1 - R36[2,2]**2))),
            ( np.arccos(-R36[0,2]/np.sqrt(1 - R36[2,2]**2)), np.pi - np.arcsin(R36[2,2]), np.pi - np.arcsin(R36[2,0]/np.sqrt(1 - R36[2,2]**2))),
            ( np.arccos(-R36[0,2]/np.sqrt(1 - R36[2,2]**2)), np.pi - np.arcsin(R36[2,2]), np.arcsin(R36[2,0]/np.sqrt(1 - R36[2,2]**2))),
            ( np.arccos(R36[0,2]/np.sqrt(1 - R36[2,2]**2)), np.arcsin(R36[2,2]), np.arcsin(R36[2,0]/np.sqrt(1 - R36[2,2]**2)) + np.pi),
            ( np.arccos(R36[0,2]/np.sqrt(1 - R36[2,2]**2)), np.arcsin(R36[2,2]), -np.arcsin(R36[2,0]/np.sqrt(1 - R36[2,2]**2)))
        ],dtype=float)

        for theta4,theta5,theta6 in eq:
            if theta4 < -np.pi or theta4 > np.pi:
                theta4 = theta4 - 2*np.pi  if theta4 > 0 else theta4 + 2*np.pi
            if theta5 < -np.pi or theta5 > np.pi:
                theta5 = theta5 - 2*np.pi  if theta5 > 0 else theta5 + 2*np.pi
            if theta6 < -np.pi or theta6 > np.pi:
                theta6 = theta6 - 2*np.pi  if theta6 > 0 else theta6 + 2*np.pi

            if np.isnan(theta4) or not(self.constraints[0][3] <= theta4 <= self.constraints[1][3]):
                continue
            if np.isnan(theta5) or not(self.constraints[0][4] <= theta5 <= self.constraints[1][4]):
                continue
            if np.isnan(theta6) or not(self.constraints[0][5] <= theta6 <= self.constraints[1][5]):
                continue
            TR36 = np.array([[np.sin(theta4)*np.cos(theta6) + np.sin(theta5)*np.sin(theta6)*np.cos(theta4), -np.sin(theta4)*np.sin(theta6) + np.sin(theta5)*np.cos(theta4)*np.cos(theta6), np.cos(theta4)*np.cos(theta5)],
                            [np.sin(theta4)*np.sin(theta5)*np.sin(theta6) - np.cos(theta4)*np.cos(theta6),  np.sin(theta4)*np.sin(theta5)*np.cos(theta6) + np.sin(theta6)*np.cos(theta4), np.sin(theta4)*np.cos(theta5)],
                            [     -np.sin(theta6)*np.cos(theta5),                                       -np.cos(theta5)*np.cos(theta6),             np.sin(theta5)]])
            if(np.array_equal(np.around(TR36,4),np.around(R36,4))):
                return(theta1,theta2,theta3,theta4,theta5,theta6)

        if np.isnan(theta4) or not(self.constraints[0][3] <= theta4 <= self.constraints[1][3]):
            print("Theta4 не е во граници ["+str(self.constraints[0][3]*180/np.pi)+","+str(self.constraints[1][3]*180/np.pi)+"]")
        if np.isnan(theta5) or not(self.constraints[0][4] <= theta5 <= self.constraints[1][4]):
            print("Theta5 не е во граници ["+str(self.constraints[0][4]*180/np.pi)+","+str(self.constraints[1][4]*180/np.pi)+"]")
        if np.isnan(theta6) or not(self.constraints[0][5] <= theta6 <= self.constraints[1][5]):
            print("Theta6 не е во граници ["+str(self.constraints[0][5]*180/np.pi)+","+str(self.constraints[1][5]*180/np.pi)+"]")
        return None
        
    def move_btn(self, button):
        self.move2point((self.posx_widget.value,self.posy_widget.value,self.posz_widget.value))
        self.update_toggle_joint()

    def iterate_state(self, index):  
        i = 0 if index.old == self.play_widget.max else index.old
        if i < self.df_file.shape[0]:
            self.subs_joints[0] = self.subs_joints[0][0], self.df_file.Theta1[i]
            self.subs_joints[1] = self.subs_joints[1][0], self.df_file.Theta2[i]
            self.subs_joints[2] = self.subs_joints[2][0], self.df_file.Theta3[i]
            self.subs_joints[4] = self.subs_joints[4][0], self.df_file.Theta4[i]
            self.subs_joints[5] = self.subs_joints[5][0], self.df_file.Theta5[i]
            self.subs_joints[7] = self.subs_joints[7][0], self.df_file.Theta6[i]
            self.batch_update()
        else:
            self.play_widget.value = self.play_widget.max

    def write_text(self,text,ofset):
        self.update_button_remove_trail(None)
        for letter in text:
            self.write_letter(letter,ofset)
            ofset[1]-=0.25

    def write_letter(self,letter,ofset):
        # frame of the letter i 1x1 
        if letter == 'T':
            #(pocx, pocy,po so da odi i koja nasoka, kolku da otide)
            comands = [(0,1,'1 0',np.arange(0.0,1.0,0.05)),(0.5,0,'0 1',np.arange(0.0,1.0,0.05))]
        elif letter == 'E':
            comands = [(0,1,'1 0',np.arange(0.0,1.0,0.05)),(0,0.5,'1 0',np.arange(0.0,1.0,0.05)),
            (0,0,'1 0',np.arange(0.0,1.0,0.05)),(0,0,'0 1',np.arange(0.0,1.0,0.05))]
        elif letter == 'I':
            comands = [(0.5,0,'0 1',np.arange(0.0,1.0,0.05)),(0.2,0,'1 0',np.arange(0.0,0.6,0.05)),(0.2,1,'1 0',np.arange(0.0,0.6,0.05))]
        elif letter == 'L':
            comands = [(0,0,'0 1',np.arange(0.0,1.0,0.05)),(0,0,'1 0',np.arange(0.0,1.0,0.05))]
        elif letter == 'H':
            comands = [(0,0,'0 1',np.arange(0.0,1.0,0.05)),(1,0,'0 1',np.arange(0.0,1.0,0.05)),(0,0.5,'1 0',np.arange(0.0,1.0,0.05))]
        elif letter == 'F':
            self.move((ofset[0],    ofset[1],0.2, 0,0,180),(0.2+ofset[0],ofset[1],0.2, 0,0,180),'linear',20,(0.2,0.15,1,1))
            self.move((0.2+ofset[0],ofset[1],0.2, 0,0,180),(0.2+ofset[0],-0.15+ofset[1],0.2, 0,0,180),'linear',15,(0.2,0.15,1,1))
            self.move((0.1+ofset[0],ofset[1],0.2, 0,0,180),(0.1+ofset[0],-0.15+ofset[1],0.2, 0,0,180),'linear',15,(0.2,0.15,1,1))
            return True
        elif letter == 'N':
            comands = [(0,0,'0 1',np.arange(0.0,1.0,0.05)),(1,0,'0 1',np.arange(0.0,1.0,0.05)),(0,1,'1 -1',np.arange(0.0,1.0,0.05))]
        elif letter == 'M':
            comands = [(0,0,'0 1',np.arange(0.0,1.0,0.05)),(1,0,'0 1',np.arange(0.0,1.0,0.05)),
            (0,1,'1 -1',np.arange(0.0,0.5,0.05)),(0.5,0.5,'1 1',np.arange(0.0,0.5,0.05))]
        elif letter == 'X':
            comands = [(0,1,'1 -1',np.arange(0.0,1.0,0.05)),(0,0,'1 1',np.arange(0.0,1.0,0.05))]
        elif letter == 'V':
            comands = [(0,1,'0.5 -1',np.arange(0.0,1,0.05)),(0.5,0,'0.5 1',np.arange(0.0,1,0.05))]
        elif letter == 'A':
            comands = [(0,0,'0.5 1',np.arange(0.0,1,0.05)),(0.5,1,'0.5 -1',np.arange(0.0,1,0.05)),(0.3,0.5,'1 0',np.arange(0.0,0.5,0.05))]
        elif letter == 'D':
            self.move((ofset[0],ofset[1],0.2, 0,0,180),(0.2+ofset[0],ofset[1],0.2, 0,0,180),'linear',20,(0.2,0.15,1,1))
            self.move((0.2+ofset[0],ofset[1],0.2, 0,0,180),(0.2+ofset[0],-0.03+ofset[1],0.2, 0,0,180),'linear',5,(0.2,0.15,1,1))
            self.move((0.2+ofset[0],-0.03+ofset[1],0.2, 0,0,180),(ofset[0],-0.03+ofset[1],0.2, 0,0,180),'circular',40,(0.1,0.1,0,1))
            self.move((ofset[0],-0.03+ofset[1],0.2, 0,0,180),(ofset[0],ofset[1],0.2, 0,0,180),'linear',5,(0.2,0.15,1,1))
            return True
        for comand in comands:
            for i in comand[3]:
                scale = comand[2].split()
                x = (comand[0]+ofset[0])+i*float(scale[0])
                y = (comand[1]+ofset[1])+i*float(scale[1])
                self.move2point((x/5,y/5,ofset[2]))
               
    def move2point(self,position,rotation=None):
        """
        Move to a desired position and rotation of robot. 

        Parameters
        ----------
        position: tuple()
            Set (x,y,z) cordinates.
        rotation: tuple()
            Set (R,P,Y) angles.
        """
        if rotation:
            rotm = rotation_matrix_from_euler_angles(sp.Matrix([
                [rotation[0]*np.pi/180],[rotation[1]*np.pi/180],[rotation[2]*np.pi/180]]),'ZYX')
            posm = htranslation3(position[0],position[1],position[2])
            ofsm = rotm * htranslation3(self.ofsets[0],self.ofsets[1],self.ofsets[2])
            posm[:,3] = posm[:,3] - ofsm[:,3]
        else:
            rotm = rotation_matrix_from_euler_angles(sp.Matrix([
                [self.angr_widget.value*np.pi/180],[self.angp_widget.value*np.pi/180],[self.angy_widget.value*np.pi/180]]),'ZYX')
            posm = htranslation3(position[0],position[1],position[2])
            ofsm = rotm * htranslation3(self.ofsets[0],self.ofsets[1],self.ofsets[2])
            posm[:,3] = posm[:,3] - ofsm[:,3]
            
        target = np.array((posm*rotm).evalf(),dtype=float)
        joint_vars = self.IK(target)

        if joint_vars:
            self.subs_joints[0] = self.subs_joints[0][0], joint_vars[0]
            self.subs_joints[1] = self.subs_joints[1][0], joint_vars[1]
            self.subs_joints[2] = self.subs_joints[2][0], joint_vars[2]
            self.subs_joints[4] = self.subs_joints[4][0], joint_vars[3]
            self.subs_joints[5] = self.subs_joints[5][0], joint_vars[4]
            self.subs_joints[7] = self.subs_joints[7][0], joint_vars[5]
            self.batch_update()
            return True
        else:
            return False

    def move(self,start,end,interpolation='linear',steps=30,param=None,closed=False):
        """
        Move to a desired position and rotation of robot. 

        Parameters
        ----------
        position: tuple()
            Set (x,y,z) cordinates.
        rotation: tuple()
            Set (R,P,Y) angles.
        interpolation: string
            Oprions: linear / circular.
        steps: int
            Number of points generated.
        param: tuple()
            Set (a,b,res_num,side):
            - a,b are aparameters for the elipse
            - res_num is to chose witch solution you like 0 or 1
            - side is to chose witch path to take 0 or 1
        closed: bool
            To draw the whole elipse
        """
        x1,y1,z1,R1,P1,Y1 = start
        x2,y2,z2,R2,P2,Y2 = end
        if interpolation == 'linear':
            for x,y,z,R,P,Y in zip(np.linspace(x1,x2,steps),np.linspace(y1,y2,steps),np.linspace(z1,z2,steps),
                                   np.linspace(R1,R2,steps),np.linspace(P1,P2,steps),np.linspace(Y1,Y2,steps)):
                if not self.move2point((x,y,z),(R,P,Y)):
                    return False
        elif interpolation == 'circular' and param != None:
            xs,ys = sp.symbols('xs,ys')
            a,b,res_num,side = param
    
            eq1 = sp.Eq((xs-x1)**2/a**2+(ys-y1)**2/b**2,1)
            eq2 = sp.Eq((xs-x2)**2/a**2+(ys-y2)**2/b**2,1)
            results = sp.solve([eq1,eq2],(xs,ys))
            if not all(x[0].is_real or x[1].is_real for x in results): 
                print("Нема решение на центарот за тие a,b")
                return False

            x_center,y_center = results[res_num]
            res_t = [-np.arccos(float((x1-x_center)/a)) + 2*np.pi, np.arccos(float((x1-x_center)/a))]
            start_angle = [t for t in res_t if np.around(float(y_center + b*np.sin(t)),3) == np.around(y1,3)][0]
            res_t = [-np.arccos(float((x2-x_center)/a)) + 2*np.pi, np.arccos(float((x2-x_center)/a))]
            end_angle = [t for t in res_t if np.around(float(y_center + b*np.sin(t)),3) == np.around(y2,3)][0]
            
            if side:
                t = np.linspace(start_angle, end_angle, steps)
            else:
                if start_angle < end_angle:
                    t = np.hstack((np.linspace(start_angle, 0,int(steps*start_angle/(2*np.pi-end_angle+start_angle)) ),
                    np.linspace(2*np.pi, end_angle, int(steps*(2*np.pi-end_angle)/(2*np.pi-end_angle+start_angle)) )))
                else:
                    t = np.hstack((np.linspace(start_angle, 2*np.pi, int(steps*(2*np.pi-start_angle)/(2*np.pi-start_angle+end_angle)) ),
                    np.linspace(0, end_angle, int(steps*end_angle/(2*np.pi-start_angle+end_angle)) )))
            
            if closed:
                start_angle, end_angle = (0,2*np.pi) if dir else (2*np.pi,0)

            for x,y,z,R,P,Y in zip(x_center + a*np.cos(t),y_center + b*np.sin(t),np.linspace(z1, z2, steps),
                                np.linspace(R1,R2,steps),np.linspace(P1,P2,steps),np.linspace(Y1,Y2,steps)):
                if not self.move2point((x,y,z),(R,P,Y)):
                    return False
        
    def csv2df(self,file):
        self.df_file = pd.read_csv(io.BytesIO(file['new'][list(file['new'].keys())[0]]['content']))

    def record_state(self, change):
        if change.new:
            data = {'Theta1':[self.subs_joints[0][1]],
                    'Theta2':[self.subs_joints[1][1]],
                    'Theta3':[self.subs_joints[2][1]],
                    'Theta4':[self.subs_joints[4][1]],
                    'Theta5':[self.subs_joints[5][1]],
                    'Theta6':[self.subs_joints[7][1]],
                    'Delay':[1]}
            self.df_states = pd.DataFrame(data)
        else:
            self.df_states.to_csv('states.csv',index=False)
    
    def update_toggle_joint(self, change):
        self.stop_update_for_slider_joint = True
        joint_id = int(change.new.split()[-1]) - 1
        constraint_id = joint_id
        for i,link in enumerate(self.links):
            if not isinstance(link[1], sp.core.symbol.Symbol) and i<=joint_id:
                joint_id +=1

        joint_type = self.links[joint_id][0]
        minn, maxx, step = (0, 5, 0.1) if joint_type == 'prismatic' else (self.constraints[0][constraint_id]*180/np.pi,self.constraints[1][constraint_id]*180/np.pi, 1)
        self.slider_joint.min, self.slider_joint.max, self.slider_joint.step = minn, maxx, step
        joint_value = self.subs_joints[joint_id][1]
        self.slider_joint.value = joint_value if joint_type == 'prismatic' else joint_value*180/np.pi
        self.slider_joint.description = 'Призматичен' if joint_type == 'prismatic' else 'Ротационен'
        self.stop_update_for_slider_joint = False

    def update_slider_joint(self, change):
        if self.stop_update_for_slider_joint:
            return
        joint_id = int(self.toggle_joint.value.split()[-1]) - 1
        for i,link in enumerate(self.links):
            if not isinstance(link[1], sp.core.symbol.Symbol) and i<=joint_id:
                joint_id +=1

        joint_type = self.links[joint_id][0]
        joint_value = change.new if joint_type == 'prismatic' else change.new * np.pi / 180
        self.subs_joints[joint_id] = self.subs_joints[joint_id][0], joint_value
        self.batch_update()
          
    def update_button_trail_color(self, button):
        self.trail_color_index += 1
    
    def update_toggle_trail(self, change):
        change.owner.description = 'Вклучи цртање' if change.new == False else 'Исклучи цртање'
    
    def update_button_remove_trail(self, button):
        self.trail_color_index = 1
        self.trail_color_list = []
        with self.fig.batch_update():
            self.fig.data[-1].x,  self.fig.data[-1].y,  self.fig.data[-1].z = [], [], []
            
    def interact(self, figure_width=800, figure_height=600):
        """ Interact with the constructed robot arm. """
        if not self.links:
            return 'Роботската рака нема зглобови, па нема што да се црта.'
        self.toggle_trail = widgets.ToggleButton(value=True, description='Исклучи цртање')
        self.toggle_trail.observe(self.update_toggle_trail, 'value')
        self.button_trail_color = widgets.Button(description='Промени боја')
        self.button_trail_color.on_click(self.update_button_trail_color)
        self.button_remove_trail = widgets.Button(description='Избриши патека')
        self.button_remove_trail.on_click(self.update_button_remove_trail)

        self.move_widget = widgets.Button(description='Изврши')
        self.move_widget.on_click(self.move_btn)
        self.posx_widget = widgets.FloatText(value=1,layout=widgets.Layout(width='5%'))
        self.posy_widget = widgets.FloatText(value=0.6,layout=widgets.Layout(width='5%'))
        self.posz_widget = widgets.FloatText(value=0.4,layout=widgets.Layout(width='5%'))
        self.angr_widget = widgets.FloatText(value=0,layout=widgets.Layout(width='5%'))
        self.angp_widget = widgets.FloatText(value=0,layout=widgets.Layout(width='5%'))
        self.angy_widget = widgets.FloatText(value=180,layout=widgets.Layout(width='5%'))

        self.play_widget = widgets.Play(value=0, max=1000, interval=50, show_repeat=False)
        self.play_widget.observe(self.iterate_state, 'value')
        self.record_widget = widgets.ToggleButton(value=False,icon='camera',tooltip='Record State',layout=widgets.Layout(width='5%'))
        self.record_widget.observe(self.record_state, 'value')
        self.file_widget = widgets.FileUpload(accept='', multiple=False)
        self.file_widget.observe(self.csv2df,'value')

        dead_joint_count = len([link[0] for link in self.links if not isinstance(link[1], sp.core.symbol.Symbol)])
        self.toggle_joint = widgets.ToggleButtons(options=[f'Зглоб {x+1}' for x in range(len(self.links)-dead_joint_count)])
        self.toggle_joint.observe(self.update_toggle_joint, 'value')
        joint_value = self.subs_joints[0][1]
        value, minn, maxx, step = (joint_value, 0, 5, 0.1) if self.links[0][0] == 'prismatic' else (joint_value, self.constraints[0][0]*180/np.pi,self.constraints[1][0]*180/np.pi, 1)
        decription = 'Призматичен' if self.links[0][0] == 'prismatic' else 'Ротационен'
        self.slider_joint = widgets.FloatSlider(value=value, min=minn, max=maxx,
            step=step, continuous_update=True, description=decription)
        self.slider_joint.observe(self.update_slider_joint, 'value')

        fig = self.plot(figure_width, figure_height)
        trail_buttons = widgets.HBox([self.toggle_trail, self.button_trail_color, self.button_remove_trail])
        IK_buttons = widgets.HBox([self.posx_widget, self.posy_widget, self.posz_widget,
        self.angr_widget,self.angp_widget,self.angy_widget, self.move_widget])
        replay_reocrd = widgets.HBox([self.play_widget,self.record_widget,self.file_widget])
        widget_box = widgets.VBox([trail_buttons,replay_reocrd, IK_buttons, self.toggle_joint, self.slider_joint, fig])
        return widget_box

    def plot(self, figure_width=800, figure_height=600):
        scatter_data = self.get_plot_data()
        self.fig = go.FigureWidget(data=scatter_data)
        self.fig.update_layout(width=figure_width, height=figure_height, showlegend=False, scene=dict(aspectmode='data'))
        return self.fig

    def get_plot_data(self):
        pose = hpose3()
        scatter_data = []
        self.joints_values = []
        subs = self.subs_joints + self.subs_additional
        for index, link in enumerate(self.links):
            joint_type, theta, d, a, alpha = link
            next_pose = pose * dh_joint_to_joint(theta, d, a, alpha)
            pose_for_rectangluar_robot_shape = pose * htranslation3(z=d)
            pose_numeric = pose.subs(subs).evalf()
            next_pose_numeric = next_pose.subs(subs).evalf()
            between_pose_numeric = pose_for_rectangluar_robot_shape.subs(subs).evalf()
            pose_second_cone_numeric = between_pose_numeric if joint_type =='prismatic' else pose_numeric
            colorscales = ['YlGnBu', 'agsunset', 'blues', 'bluered', 'amp']
            colorscale = colorscales[index % len(colorscales)]

            scatter_pose = draw_frame(pose_numeric, labels=f'x{index}-y{index}-z{index}', line_width=5, line_length=self.sizeref)
            
            joint_1 = go.Cone(
                x=[pose_numeric[0, 3]], y=[pose_numeric[1, 3]], z=[pose_numeric[2, 3]],
                u=[pose_numeric[0, 2]], v=[pose_numeric[1, 2]], w=[pose_numeric[2, 2]],
                anchor='center', name=f'J{index}', showscale=False, colorscale=colorscale, sizemode='absolute', sizeref=self.sizeref)
            joint_2 = go.Cone(
                x=[pose_second_cone_numeric[0, 3]], y=[pose_second_cone_numeric[1, 3]], z=[pose_second_cone_numeric[2, 3]],
                u=[-pose_numeric[0, 2]], v=[-pose_numeric[1, 2]], w=[-pose_numeric[2, 2]],
                anchor='center', name='', showscale=False, colorscale=colorscale, sizemode='absolute', sizeref=self.sizeref)
            line_link = go.Scatter3d(
                x=[pose_numeric[0, 3], between_pose_numeric[0, 3], next_pose_numeric[0, 3]], 
                y=[pose_numeric[1, 3], between_pose_numeric[1, 3], next_pose_numeric[1, 3]],
                z=[pose_numeric[2, 3], between_pose_numeric[2, 3], next_pose_numeric[2, 3]],
                mode='lines', name='', line=dict(color='black',width=3))
            square_link = go.Mesh3d(
                # 8 vertices of a cube
                x=[pose_numeric[0, 3]-0.025, pose_numeric[0, 3]-0.025,   pose_numeric[0, 3]+0.05-0.025, pose_numeric[0, 3]+0.05-0.025, between_pose_numeric[0, 3]-0.025, between_pose_numeric[0, 3]-0.025, between_pose_numeric[0, 3]+0.05-0.025, between_pose_numeric[0, 3]+0.05-0.025],
                y=[pose_numeric[1, 3]-0.025, pose_numeric[1, 3]+0.05-0.025, pose_numeric[1, 3]+0.05-0.025, pose_numeric[1, 3]-0.025,   between_pose_numeric[1, 3]-0.025, between_pose_numeric[1, 3]+0.05-0.025, between_pose_numeric[1, 3]+0.05-0.025, between_pose_numeric[1, 3]-0.025],
                z=[pose_numeric[2, 3], pose_numeric[2, 3],   pose_numeric[2, 3],   pose_numeric[2, 3],   between_pose_numeric[2, 3], between_pose_numeric[2, 3], between_pose_numeric[2, 3], between_pose_numeric[2, 3]],
                i = [7, 0, 0, 0, 4, 4, 6, 6, 4, 0, 3, 2],
                j = [3, 4, 1, 2, 5, 6, 5, 2, 0, 1, 6, 3],
                k = [0, 7, 2, 3, 6, 7, 1, 1, 5, 5, 7, 6],
                opacity=1,
                color='#DC143C',
                flatshading = True)  
            scatter_data += scatter_pose[:1] + scatter_pose[2:] + (joint_1, joint_2, line_link)
            pose = next_pose
            
        scatter_pose = draw_frame(
            pose.subs(subs).evalf(), labels=f'x{index+1}-y{index+1}-z{index+1}', colors=('cyan', 'magenta', 'yellow'), 
            line_width=5, line_length=self.sizeref)
        scatter_data += scatter_pose[:1] + scatter_pose[2:]
        x, y, z = scatter_pose[0].x[0], scatter_pose[0].y[0], scatter_pose[0].z[0]
        scatter_data += (go.Scatter3d(x=[x], y=[y], z=[z], mode='markers', name='', marker_size=5, marker_cmin=0),)
        return scatter_data

    def batch_update(self):
        pose = np.array([[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]])
        if self.record_widget.value:
            data = {'Theta1':self.subs_joints[0][1],
                    'Theta2':self.subs_joints[1][1],
                    'Theta3':self.subs_joints[2][1],
                    'Theta4':self.subs_joints[4][1],
                    'Theta5':self.subs_joints[5][1],
                    'Theta6':self.subs_joints[7][1],
                    'Delay':1}
            self.df_states = self.df_states.append(data,ignore_index = True)

        with self.fig.batch_update():
            for index, link in enumerate(self.links):
                index *= 5
                joint_type, theta, d, a, alpha = link
                theta = [x[1] for i,x in enumerate(self.subs_joints) if x[0] == theta][0] if isinstance(theta, sp.core.symbol.Symbol) else theta.evalf()
                alpha = alpha.evalf() if isinstance(alpha, sp.Expr) else alpha
                next_pose = pose.dot(self.getTransformMatrix(float(theta), d, a,float(alpha)))
                pose_for_rectangluar_robot_shape = pose.dot(np.array([[1,0,0,0],[0,1,0,0],[0,0,1,d],[0,0,0,1]]))
                pose_second_cone_numeric = pose_for_rectangluar_robot_shape if joint_type =='prismatic' else pose
                
                line_n, _, line_a = frame_lines(pose, line_length=self.sizeref)
                self.fig.data[index+0].x, self.fig.data[index+0].y, self.fig.data[index+0].z = line_n.tolist()
                self.fig.data[index+1].x, self.fig.data[index+1].y, self.fig.data[index+1].z = line_a.tolist()
                
                cone_xyz = [pose[0, 3]], [pose[1, 3]], [pose[2, 3]]
                self.fig.data[index+2].x, self.fig.data[index+2].y, self.fig.data[index+2].z = cone_xyz
                cone_uvw = [pose[0, 2]], [pose[1, 2]], [pose[2, 2]]
                self.fig.data[index+2].u, self.fig.data[index+2].v, self.fig.data[index+2].w = cone_uvw
                
                cone_xyz = [pose_second_cone_numeric[0, 3]], [pose_second_cone_numeric[1, 3]], [pose_second_cone_numeric[2, 3]]
                self.fig.data[index+3].x, self.fig.data[index+3].y, self.fig.data[index+3].z = cone_xyz
                cone_uvw = [-pose[0, 2]], [-pose[1, 2]], [-pose[2, 2]]
                self.fig.data[index+3].u, self.fig.data[index+3].v, self.fig.data[index+3].w = cone_uvw
                
                self.fig.data[index+4].x = [pose[0, 3], pose_for_rectangluar_robot_shape[0, 3], next_pose[0, 3]]
                self.fig.data[index+4].y = [pose[1, 3], pose_for_rectangluar_robot_shape[1, 3], next_pose[1, 3]]
                self.fig.data[index+4].z = [pose[2, 3], pose_for_rectangluar_robot_shape[2, 3], next_pose[2, 3]]
                pose = next_pose
            
            line_n, _, line_a = frame_lines(pose, line_length=self.sizeref)
            self.fig.data[-3].x, self.fig.data[-3].y, self.fig.data[-3].z = line_n.tolist()
            self.fig.data[-2].x, self.fig.data[-2].y, self.fig.data[-2].z = line_a.tolist()
            
            if self.toggle_trail.value:
                self.fig.data[-1].x = self.fig.data[-1].x + (line_n.tolist()[0][0],)
                self.fig.data[-1].y = self.fig.data[-1].y + (line_n.tolist()[1][0],)
                self.fig.data[-1].z = self.fig.data[-1].z + (line_n.tolist()[2][0],)
                self.trail_color_list += [self.trail_color_index]
                self.fig.data[-1].marker['color'] = self.trail_color_list