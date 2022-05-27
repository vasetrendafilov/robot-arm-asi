import math
import sympy as sp
import numpy as np
import ipywidgets as widgets
import plotly.graph_objects as go
import pyswarms as ps

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
    """
    Return a transformation matrix in 3D homogeneous coordinates that represents the rotation by `angle` around `axis`.
    
    :param axis: is the axis of rotation. It should be one of ['x', 'y', 'z', 'n', 'o', 'a'].
    :type axis: string
    ...
    :param angle: is the angle of rotation.
    :type angle: sympy expression, sympy symbol or a number
    ...
    raise ValueError: if an invalid axis value is received.
    ...
    :return: the rotation matrix
    """
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

def frame_lines(pose, line_length=1):
    pose = pose.evalf()
    t = pose[:3, -1]
    line_n = sp.Matrix.hstack(t, t + line_length * pose[:3, 0])
    line_o = sp.Matrix.hstack(t, t + line_length * pose[:3, 1])
    line_a = sp.Matrix.hstack(t, t + line_length * pose[:3, 2])
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
        self.stop_update_for_slider_joint = False
        self.trail_color_index = 1
        self.trail_color_list = []
   
    def add_dead_joint(self, theta, d, a, alpha):
        temp = sp.symbols('temp'+str(np.random.random(1)[0]*100))
        self.links.append(('revolute', theta, d, a, alpha))
        self.joint_variables.append(temp)
        self.subs_joints.append((temp, theta))   

    def add_revolute_joint(self, theta, d, a, alpha):
        """
        Add a revolute joint to the robotic arm according to the DH convention.
    
        :param theta: is the angle of rotation around z-axis.
        :type theta: Symbol
        ...
        :param d: is the displacement along z-axis.
        :type d: number or Symbol
        ...
        :param a: the displacement along x-axis.
        :type a: number or Symbol
        ...
        :param alpha: the angle of rotation around x-axis.
        :type alpha: number or Symbol
        """
        self.links.append(('revolute', theta, d, a, alpha))
        self.joint_variables.append(theta)
        self.subs_joints.append((theta, 0))

    def add_prismatic_joint(self, theta, d, a, alpha):
        """
        Add a prismatic joint to the robotic arm according to the DH convention.
    
        :param theta: is the angle of rotation around z-axis.
        :type theta: number or Symbol
        ...
        :param d: is the displacement along z-axis.
        :type d: Symbol
        ...
        :param a: the displacement along x-axis.
        :type a: number or Symbol
        ...
        :param alpha: the angle of rotation around x-axis.
        :type alpha: number or Symbol
        """
        self.links.append(('prismatic', theta, d, a, alpha))
        self.joint_variables.append(d)
        self.subs_joints.append((d, 1))
    
    def add_subs(self, subs):
        """
        Add the symbol values for plotting purposes.
        
        :param subs: is a list of tuples, each consisted of a symbol and its value.
        :type subs: [(symbol1, value1), (symbol2, value2), ... (symbol3, value3)]
        """
        self.subs_additional = subs
    
    def get_dh_joint_to_joint(self, start_joint, end_joint):
        """
        Get the DH model subsection transformation matrix for the joint id range(start_joint, end_joint).
        
        :param start_joint: is the starting joint id of the desired dh model susbsection.
        :type start_joint: integer
        ...
        :param end_joint: is the final joint id of the desired dh model susbsection.
        :type end_joint: integer
        ...
        :return: DH model subsection transformation matrix for joint id range(start_joint, end_joint).
        """
        pose = hpose3()
        for link in self.links[start_joint:end_joint]:
            joint_type, theta, d, a, alpha = link
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
    
    def update_toggle_joint(self, change):
        self.stop_update_for_slider_joint = True
        joint_id = int(change.new.split()[-1]) - 1
        joint_type = self.links[joint_id][0]
        minn, maxx, step = (0, 5, 0.1) if joint_type == 'prismatic' else (-180, 180, 1)
        self.slider_joint.min, self.slider_joint.max, self.slider_joint.step = minn, maxx, step
        joint_value = self.subs_joints[joint_id][1]
        self.slider_joint.value = joint_value if joint_type == 'prismatic' else int(180 * joint_value / sp.pi.evalf())
        self.slider_joint.description = 'Призматичен' if joint_type == 'prismatic' else 'Ротационен'
        self.stop_update_for_slider_joint = False
    
    def update_slider_joint(self, change):
        if self.stop_update_for_slider_joint:
            return
        joint_id = int(self.toggle_joint.value.split()[-1]) - 1
        joint_type = self.links[joint_id][0]
        joint_value = change.new if joint_type == 'prismatic' else change.new * sp.pi / 180
        self.subs_joints[joint_id] = self.subs_joints[joint_id][0], joint_value
        pose = hpose3()
        subs = self.subs_joints + self.subs_additional
        with self.fig.batch_update():
            for index, link in enumerate(self.links):
                index *= 5
                joint_type, theta, d, a, alpha = link
                next_pose = pose * dh_joint_to_joint(theta, d, a, alpha)
                pose_for_rectangluar_robot_shape = pose * htranslation3(z=d)
                pose_numeric = pose.subs(subs).evalf()
                next_pose_numeric = next_pose.subs(subs).evalf()
                pose_for_rectangluar_robot_shape_numeric = pose_for_rectangluar_robot_shape.subs(subs).evalf()
                pose_second_cone_numeric = pose_for_rectangluar_robot_shape_numeric if joint_type =='prismatic' else pose_numeric
                
                line_n, line_o, line_a = frame_lines(pose_numeric, line_length=self.sizeref)
                self.fig.data[index+0].x, self.fig.data[index+0].y, self.fig.data[index+0].z = line_n.tolist()
                self.fig.data[index+1].x, self.fig.data[index+1].y, self.fig.data[index+1].z = line_a.tolist()
                
                cone_xyz = [pose_numeric[0, 3]], [pose_numeric[1, 3]], [pose_numeric[2, 3]]
                self.fig.data[index+2].x, self.fig.data[index+2].y, self.fig.data[index+2].z = cone_xyz
                cone_uvw = [pose_numeric[0, 2]], [pose_numeric[1, 2]], [pose_numeric[2, 2]]
                self.fig.data[index+2].u, self.fig.data[index+2].v, self.fig.data[index+2].w = cone_uvw
                
                cone_xyz = [pose_second_cone_numeric[0, 3]], [pose_second_cone_numeric[1, 3]], [pose_second_cone_numeric[2, 3]]
                self.fig.data[index+3].x, self.fig.data[index+3].y, self.fig.data[index+3].z = cone_xyz
                cone_uvw = [-pose_numeric[0, 2]], [-pose_numeric[1, 2]], [-pose_numeric[2, 2]]
                self.fig.data[index+3].u, self.fig.data[index+3].v, self.fig.data[index+3].w = cone_uvw
                
                self.fig.data[index+4].x = [pose_numeric[0, 3], pose_for_rectangluar_robot_shape_numeric[0, 3], next_pose_numeric[0, 3]]
                self.fig.data[index+4].y = [pose_numeric[1, 3], pose_for_rectangluar_robot_shape_numeric[1, 3], next_pose_numeric[1, 3]]
                self.fig.data[index+4].z = [pose_numeric[2, 3], pose_for_rectangluar_robot_shape_numeric[2, 3], next_pose_numeric[2, 3]]
                pose = next_pose
            
            line_n, line_o, line_a = frame_lines(pose.subs(subs).evalf(), line_length=self.sizeref)
            self.fig.data[-3].x, self.fig.data[-3].y, self.fig.data[-3].z = line_n.tolist()
            self.fig.data[-2].x, self.fig.data[-2].y, self.fig.data[-2].z = line_a.tolist()
            
            if self.toggle_trail.value:
                self.fig.data[-1].x = self.fig.data[-1].x + (line_n.tolist()[0][0],)
                self.fig.data[-1].y = self.fig.data[-1].y + (line_n.tolist()[1][0],)
                self.fig.data[-1].z = self.fig.data[-1].z + (line_n.tolist()[2][0],)
                self.trail_color_list += [self.trail_color_index]
                self.fig.data[-1].marker['color'] = self.trail_color_list
                     
    def update_button_trail_color(self, button):
        self.trail_color_index += 1
    
    def update_toggle_trail(self, change):
        change.owner.description = 'Вклучи цртање' if change.new == False else 'Исклучи цртање'
    
    def update_button_remove_trail(self, button):
        self.trail_color_index = 1
        self.trail_color_list = []
        with self.fig.batch_update():
            self.fig.data[-1].x,  self.fig.data[-1].y,  self.fig.data[-1].z = [], [], []

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
        t_23 = self.getTransformMatrix(params[2], 0.19,   0,     np.pi/2)
        t_34 = self.getTransformMatrix(np.pi/2,   0,      0,     np.pi/2)
        t_45 = self.getTransformMatrix(params[3], 0.52,   0,     np.pi/2)
        t_56 = self.getTransformMatrix(params[4], 0,      0.2,   0) 
        return  t_00.dot(t_01).dot(t_12).dot(t_23).dot(t_34).dot(t_45).dot(t_56)

    def distance(self, query, target):
        q_nx,q_ox,q_ax,q_px,q_ny,q_oy,q_ay,q_py,q_nz,q_oz,q_az,q_pz = self.get_end_tip(query)[:3,:4].flatten()
        t_nx,t_ox,t_ax,t_px,t_ny,t_oy,t_ay,t_py,t_nz,t_oz,t_az,t_pz = target[:3,:4].flatten()
        c_theta1, c_theta2, c_theta3, c_theta4, c_theta5 = [ x[1] for i,x in enumerate(self.subs_joints) if i != 3]        
        q_theta1, q_theta2, q_theta3, q_theta4, q_theta5 = query      
        x_dist = (t_px - q_px)**2
        y_dist = (t_py - q_py)**2
        z_dist = (t_pz - q_pz)**2
        p_dist = np.sqrt(x_dist + y_dist + z_dist)
        a_dist = abs(c_theta1-q_theta1)+abs(c_theta2-q_theta2)+abs(c_theta3-q_theta3)+abs(c_theta4-q_theta4)+ abs(c_theta5-q_theta5)

        return self.alpha*p_dist + (1-self.alpha)*a_dist

    def opt_func(self,X):
        n_particles = X.shape[0]  # number of particles
        dist = [self.distance(X[i], self.target) for i in range(n_particles)]
        return np.array(dist)
        
    def IKsolver(self,target,iterations):
        swarm_size = 20
        dim = 5        # Dimension of X
        options = {'c1': 1.5, 'c2':1.5, 'w':0.5}
        self.alpha = 0.9
        self.target = target

        constraints = (np.array([-np.pi , -np.pi , -np.pi , -np.pi , -np.pi]),
                       np.array([ np.pi ,  np.pi ,  np.pi ,  np.pi ,  np.pi]))
     
        optimizer = ps.single.GlobalBestPSO(n_particles=swarm_size,
                                            dimensions=dim,
                                            options=options,
                                            bounds=constraints)

        return optimizer.optimize(self.opt_func, iters=iterations)

    def move(self, button):
        if self.pozx.value**2 + self.pozy.value**2 + self.pozz.value**2 > 1.51**2:
            self.costwidget.value = "Nadvor od dofat na rakata!!"  
            return
        target = np.array([[0, 0, 0, self.pozx.value],
                    [0, 0, 0, self.pozy.value],
                    [0, 0, 0, self.pozz.value],
                    [0, 0, 0, 1]])
        cost, joint_vars = self.IKsolver(target,300)
        self.costwidget.value = "Cost: "+ str(cost)

        self.subs_joints[0] = self.subs_joints[0][0], joint_vars[0]
        self.subs_joints[1] = self.subs_joints[1][0], joint_vars[1]
        self.subs_joints[2] = self.subs_joints[2][0], joint_vars[2]
        self.subs_joints[4] = self.subs_joints[4][0], joint_vars[3]
        self.subs_joints[5] = self.subs_joints[5][0], joint_vars[4]
        pose = hpose3()
        subs = self.subs_joints + self.subs_additional
        with self.fig.batch_update():
            for index, link in enumerate(self.links):
                index *= 5
                joint_type, theta, d, a, alpha = link
                next_pose = pose * dh_joint_to_joint(theta, d, a, alpha)
                pose_for_rectangluar_robot_shape = pose * htranslation3(z=d)
                pose_numeric = pose.subs(subs).evalf()
                next_pose_numeric = next_pose.subs(subs).evalf()
                pose_for_rectangluar_robot_shape_numeric = pose_for_rectangluar_robot_shape.subs(subs).evalf()
                pose_second_cone_numeric = pose_for_rectangluar_robot_shape_numeric if joint_type =='prismatic' else pose_numeric
                
                line_n, line_o, line_a = frame_lines(pose_numeric, line_length=self.sizeref)
                self.fig.data[index+0].x, self.fig.data[index+0].y, self.fig.data[index+0].z = line_n.tolist()
                self.fig.data[index+1].x, self.fig.data[index+1].y, self.fig.data[index+1].z = line_a.tolist()
                
                cone_xyz = [pose_numeric[0, 3]], [pose_numeric[1, 3]], [pose_numeric[2, 3]]
                self.fig.data[index+2].x, self.fig.data[index+2].y, self.fig.data[index+2].z = cone_xyz
                cone_uvw = [pose_numeric[0, 2]], [pose_numeric[1, 2]], [pose_numeric[2, 2]]
                self.fig.data[index+2].u, self.fig.data[index+2].v, self.fig.data[index+2].w = cone_uvw
                
                cone_xyz = [pose_second_cone_numeric[0, 3]], [pose_second_cone_numeric[1, 3]], [pose_second_cone_numeric[2, 3]]
                self.fig.data[index+3].x, self.fig.data[index+3].y, self.fig.data[index+3].z = cone_xyz
                cone_uvw = [-pose_numeric[0, 2]], [-pose_numeric[1, 2]], [-pose_numeric[2, 2]]
                self.fig.data[index+3].u, self.fig.data[index+3].v, self.fig.data[index+3].w = cone_uvw
                
                self.fig.data[index+4].x = [pose_numeric[0, 3], pose_for_rectangluar_robot_shape_numeric[0, 3], next_pose_numeric[0, 3]]
                self.fig.data[index+4].y = [pose_numeric[1, 3], pose_for_rectangluar_robot_shape_numeric[1, 3], next_pose_numeric[1, 3]]
                self.fig.data[index+4].z = [pose_numeric[2, 3], pose_for_rectangluar_robot_shape_numeric[2, 3], next_pose_numeric[2, 3]]
                pose = next_pose
            
            line_n, line_o, line_a = frame_lines(pose.subs(subs).evalf(), line_length=self.sizeref)
            self.fig.data[-3].x, self.fig.data[-3].y, self.fig.data[-3].z = line_n.tolist()
            self.fig.data[-2].x, self.fig.data[-2].y, self.fig.data[-2].z = line_a.tolist()
            
            if self.toggle_trail.value:
                self.fig.data[-1].x = self.fig.data[-1].x + (line_n.tolist()[0][0],)
                self.fig.data[-1].y = self.fig.data[-1].y + (line_n.tolist()[1][0],)
                self.fig.data[-1].z = self.fig.data[-1].z + (line_n.tolist()[2][0],)
                self.trail_color_list += [self.trail_color_index]
                self.fig.data[-1].marker['color'] = self.trail_color_list
            
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

        self.movexyz = widgets.Button(description='Podvizi')
        self.movexyz.on_click(self.move)

        self.pozx = widgets.FloatText(value=1,layout=widgets.Layout(width='10%'))
        self.pozy = widgets.FloatText(value=0.6,layout=widgets.Layout(width='10%'))
        self.pozz = widgets.FloatText(value=0.4,layout=widgets.Layout(width='10%'))

        self.costwidget = widgets.Label(value="Cost: NaN")

        self.toggle_joint = widgets.ToggleButtons(options=[f'Зглоб {x+1}' for x in range(len(self.links)) if x != 3 ])
        self.toggle_joint.observe(self.update_toggle_joint, 'value')
        joint_value = self.subs_joints[0][1]
        value, minn, maxx, step = (joint_value, 0, 5, 0.1) if self.links[0][0] == 'prismatic' else (joint_value, -180, 180, 1)
        decription = 'Призматичен' if self.links[0][0] == 'prismatic' else 'Ротационен'
        self.slider_joint = widgets.FloatSlider(value=value, min=minn, max=maxx,
            step=step, continuous_update=True, description=decription)
        self.slider_joint.observe(self.update_slider_joint, 'value')

        fig = self.plot(figure_width, figure_height)
        trail_buttons = widgets.HBox([self.toggle_trail, self.button_trail_color, self.button_remove_trail])
        pos_buttons = widgets.HBox([self.pozx, self.pozy, self.pozz, self.movexyz,self.costwidget])
        widget_box = widgets.VBox([trail_buttons, pos_buttons, self.toggle_joint, self.slider_joint, fig])
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
            pose_for_rectangluar_robot_shape_numeric = pose_for_rectangluar_robot_shape.subs(subs).evalf()
            pose_second_cone_numeric = pose_for_rectangluar_robot_shape_numeric if joint_type =='prismatic' else pose_numeric
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
                x=[pose_numeric[0, 3], pose_for_rectangluar_robot_shape_numeric[0, 3], next_pose_numeric[0, 3]], 
                y=[pose_numeric[1, 3], pose_for_rectangluar_robot_shape_numeric[1, 3], next_pose_numeric[1, 3]],
                z=[pose_numeric[2, 3], pose_for_rectangluar_robot_shape_numeric[2, 3], next_pose_numeric[2, 3]],
                mode='lines', name='', line=dict(color='black',width=3))
            scatter_data += scatter_pose[:1] + scatter_pose[2:] + (joint_1, joint_2, line_link)
            pose = next_pose
            
        scatter_pose = draw_frame(
            pose.subs(subs).evalf(), labels=f'x{index+1}-y{index+1}-z{index+1}', colors=('cyan', 'magenta', 'yellow'), 
            line_width=5, line_length=self.sizeref)
        scatter_data += scatter_pose[:1] + scatter_pose[2:]
        x, y, z = scatter_pose[0].x[0], scatter_pose[0].y[0], scatter_pose[0].z[0]
        scatter_data += (go.Scatter3d(x=[x], y=[y], z=[z], mode='markers', name='', marker_size=5, marker_cmin=0),)
        return scatter_data
