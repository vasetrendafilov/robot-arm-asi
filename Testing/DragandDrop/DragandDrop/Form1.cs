using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;


namespace DragandDrop
{
    public partial class Form1 : Form
    {
        List<RobotArm> robotArms = new List<RobotArm>();
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            foreach (string file in Directory.EnumerateFiles(Directory.GetCurrentDirectory(), "*.csv"))
            {
                RobotArm robotArm = new RobotArm(file);
                program_list.Items.Add(robotArm.FileName());
                robotArms.Add(robotArm);
            }
            
        }

        private void listBox1_DragDrop(object sender, DragEventArgs e)
        {
            string[] dropped_files = (string[])e.Data.GetData(DataFormats.FileDrop);
            foreach(string file in dropped_files)
            {
                if (file.Substring(file.Length - 3) != "csv")
                {
                    MessageBox.Show("Погрешна екстензија на податокот","Грешка");
                    return;
                }

                RobotArm robotArm = new RobotArm(Path.Combine(Directory.GetCurrentDirectory(), file.Split('\\').Last()));
                program_list.Items.Add(robotArm.FileName());
                robotArms.Add(robotArm);
            }
        }

        private void listBox1_DragEnter(object sender, DragEventArgs e)
        {
            if(e.Data.GetDataPresent(DataFormats.FileDrop,false) == true)
            {
                e.Effect = DragDropEffects.All;
            }
        }

        private void upload_file_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Title = "Прикачи Датотека";
            openFileDialog.Filter = "CSV File (*.csv)|*.csv";
            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                string file = openFileDialog.FileName;
                // copy file
                string destFile = Path.Combine(Directory.GetCurrentDirectory(), openFileDialog.SafeFileName);
                File.Copy(file, destFile, true);

                RobotArm robotArm = new RobotArm(Path.Combine(Directory.GetCurrentDirectory(), openFileDialog.SafeFileName));
                program_list.Items.Add(robotArm.FileName());
                robotArms.Add(robotArm);

            }
        }

        private void delete_file_Click(object sender, EventArgs e)
        {
            if (program_list.SelectedIndex != -1)
            {
                string name = robotArms[program_list.SelectedIndex].FileName();
                 if (File.Exists(robotArms[program_list.SelectedIndex].file))
                 {
                    File.Delete(robotArms[program_list.SelectedIndex].file);
                    robotArms.RemoveAt(program_list.SelectedIndex);
                    program_list.Items.RemoveAt(program_list.SelectedIndex);
                    MessageBox.Show("Програмата " + name + " е избришана");
                 }
            }


        }

        private void options_Click(object sender, EventArgs e)
        {
            if (program_list.SelectedIndex != -1)
            {
                robotArms[program_list.SelectedIndex].Print();
            }
        }

        private void start_Click(object sender, EventArgs e)
        {
            if (program_list.SelectedIndex != -1)
            {
                MessageBox.Show(robotArms[program_list.SelectedIndex].FileName());
            }
        }
    }   
}
