using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using csDmc5480;

namespace CardInfo
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ushort c, d, f;
            UInt32 a = Dmc5480.d5480_get_lib_version();
            Dmc5480.d5480_board_reset(1);
            Dmc5480.d5480_get_card_version(1);
            UInt32 h = Dmc5480.d5480_get_card_soft_version(1, ref c, ref d);

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            int n;
            n = Dmc5480.d5480_board_init();
            MessageBox.Show(n.ToString());
            if (n < 0 || n > 7)
            {
                MessageBox.Show(n.ToString());
            }
            else
            {
                MessageBox.Show("Nema karti");
            }
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            Dmc5480.d5480_board_close();
        }
    }
}
