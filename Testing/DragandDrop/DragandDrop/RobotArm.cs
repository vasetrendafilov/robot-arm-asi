using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace DragandDrop
{

    public class RobotArm
    {
        public double[,] joints;
        public double[] delays;
        public readonly string file;
        private int row;
        private const int col = 6;
 
        public RobotArm(string file)
        {
            this.file = file;
            string [] filelines = File.ReadAllLines(file);
            this.row = filelines.Length-1;
            this.joints = new double[filelines.Length, col];
            this.delays = new double[filelines.Length];

            for (int i = 0; i < row; i++)
            {
                string[] states = filelines[i+1].Split(',');
                for (int j = 0; j < 6; j++)
                {
                    this.joints[i, j] = double.Parse(states[j]);
                }
                this.delays[i] = double.Parse(states[6]);
            }
        }
        public string FileName()
        {
            string filename = file.Split('\\').Last();
            return filename.Substring(0, filename.Length - 4);
        }
        public void Print()
        {
            for (int i = 0; i < row; i++)
            {
                for (int j = 0; j < col; j++)
                {
                    Console.Write(this.joints[i, j]);
                    Console.Write(" ");
                }
                Console.WriteLine();
            }
      
        }

    }
}
