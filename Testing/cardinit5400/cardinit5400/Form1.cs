using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using csDmc5400;

namespace cardinit5400
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
            n = Dmc5400.d5400_board_init();
            if (n < 0 || n > 7)
            {
                MessageBox.Show("Nema karti");
            }
            else
            {
                MessageBox.Show(n.ToString());
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Dmc5400.d5400_config_home_mode(1, 1, 0.52, 1, 2);
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            Dmc5400.d5400_board_close();
        }
    }
}
