using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using csDmc5480;

namespace Target_Positon
{
    public partial class Form1 : Form
    {

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            int n;
            n = Dmc5480.d5480_board_init(); 
            if (n < 1 || n > 7)
            {
                MessageBox.Show("Control card 5480 not found", "Error");
            }
            timer1.Start();
        }
        private ushort GetAxis()
        {
            return decimal.ToUInt16(numericUpDown1.Value);
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            Dmc5480.d5480_board_close();
        }
        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            Dmc5480.d5480_board_close();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            ushort axis = GetAxis(); 
            double dcurrent_speed = 0;
            double dunitPos = 0; 
            double enPos = 0;

            dcurrent_speed = Dmc5480.d5480_read_current_speed(axis); 
            textBox1.Text = dcurrent_speed.ToString();
            dunitPos = Dmc5480.d5480_get_position(axis); 
            textBox2.Text = dunitPos.ToString();
            enPos = Dmc5480.d5480_get_encoder(axis);
            textBox3.Text = enPos.ToString();

            if (Dmc5480.d5480_check_done(axis) == 0) 
            {
                textBox4.Text = "Running";
            }
            else
            {
                textBox4.Text = "Stopping";
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            ushort axis = GetAxis(); 
            double dNewVel;
            double dTaccDec;

            dNewVel = decimal.ToDouble(numericUpDown10.Value);
            dTaccDec = decimal.ToDouble(numericUpDown11.Value);

            Dmc5480.d5480_change_speed(axis, dNewVel);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            ushort axis = GetAxis(); //轴号
            int NewPos;// 新的目标位置

            NewPos = Convert.ToInt32(numericUpDown12.Value);

            Dmc5480.d5480_reset_target_position(axis, NewPos);//在线变位
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ushort axis = GetAxis(); //轴号
            double dMinVel;//起始速度
            double dMaxVel;//运行速度
            double dTacc;//加速时间
            double dTdec;//减速时间
            double dStopVel;//停止速度
            double dS_para;//S段时间
            int Dist;//目标位置
            ushort sPosi_mode; //运动模式0：相对坐标模式，1：绝对坐标模式

            dMinVel = decimal.ToDouble(numericUpDown3.Value);
            dMaxVel = decimal.ToDouble(numericUpDown4.Value);
            dTacc = decimal.ToDouble(numericUpDown5.Value);
            dTdec = decimal.ToDouble(numericUpDown6.Value);
            dStopVel = decimal.ToDouble(numericUpDown8.Value);
            dS_para = decimal.ToDouble(numericUpDown7.Value);
            Dist = Convert.ToInt32(numericUpDown9.Value);
            sPosi_mode = 0;
            Dmc5480.d5480_set_pulse_outmode(axis, 0);
            Dmc5480.d5480_set_profile(axis, dMinVel, dMaxVel, dTacc, dTdec);//设置速度参数
            Dmc5480.d5480_set_s_profile(axis, dS_para);//设置S段速度参数

            Dmc5480.d5480_pmove(axis, Dist, sPosi_mode);//定长运动

        }

        private void button4_Click(object sender, EventArgs e)
        {
            ushort axis = GetAxis(); 
            double dTdec;
            dTdec = decimal.ToDouble(numericUpDown6.Value);
            Dmc5480.d5480_decel_stop(axis, dTdec); 
        }

        private void button5_Click(object sender, EventArgs e)
        {
            ushort axis = GetAxis(); //轴号
            int dpos = 0;// 当前位置

            Dmc5480.d5480_set_position(axis, dpos); //设置指定轴的当前指令位置值
        }

        private void button6_Click(object sender, EventArgs e)
        {
            ushort axis = GetAxis(); //轴号
            Dmc5480.d5480_set_HOME_PIN_logic(axis, 0, 0);
            Dmc5480.d5480_config_home_mode(axis, 2, 2000, 1, 0);
            Dmc5480.d5480_home_move(axis);
            while(Dmc5480.d5480_check_done(axis) == 0) { }
            Dmc5480.d5480_set_position(axis, 0);

           // Dmc5480.set(_CardID, axis, dEquiv);  //设置脉冲当量
        }
    }
}
