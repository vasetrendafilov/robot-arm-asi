
namespace DragandDrop
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.program_list = new System.Windows.Forms.ListBox();
            this.upload_file = new System.Windows.Forms.Button();
            this.options = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.start = new System.Windows.Forms.Button();
            this.delete_file = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label31 = new System.Windows.Forms.Label();
            this.label32 = new System.Windows.Forms.Label();
            this.label33 = new System.Windows.Forms.Label();
            this.label34 = new System.Windows.Forms.Label();
            this.label35 = new System.Windows.Forms.Label();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.label36 = new System.Windows.Forms.Label();
            this.label37 = new System.Windows.Forms.Label();
            this.label38 = new System.Windows.Forms.Label();
            this.label39 = new System.Windows.Forms.Label();
            this.label40 = new System.Windows.Forms.Label();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.label41 = new System.Windows.Forms.Label();
            this.label42 = new System.Windows.Forms.Label();
            this.label43 = new System.Windows.Forms.Label();
            this.label44 = new System.Windows.Forms.Label();
            this.label45 = new System.Windows.Forms.Label();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.label46 = new System.Windows.Forms.Label();
            this.label47 = new System.Windows.Forms.Label();
            this.label48 = new System.Windows.Forms.Label();
            this.label49 = new System.Windows.Forms.Label();
            this.label50 = new System.Windows.Forms.Label();
            this.groupBox6 = new System.Windows.Forms.GroupBox();
            this.label51 = new System.Windows.Forms.Label();
            this.label52 = new System.Windows.Forms.Label();
            this.label53 = new System.Windows.Forms.Label();
            this.label54 = new System.Windows.Forms.Label();
            this.label55 = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.groupBox5.SuspendLayout();
            this.groupBox6.SuspendLayout();
            this.SuspendLayout();
            // 
            // program_list
            // 
            this.program_list.AllowDrop = true;
            this.program_list.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(30)))), ((int)(((byte)(30)))), ((int)(((byte)(30)))));
            this.program_list.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.program_list.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.program_list.ForeColor = System.Drawing.Color.White;
            this.program_list.FormattingEnabled = true;
            this.program_list.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.program_list.ItemHeight = 31;
            this.program_list.Location = new System.Drawing.Point(37, 25);
            this.program_list.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.program_list.Name = "program_list";
            this.program_list.Size = new System.Drawing.Size(272, 341);
            this.program_list.TabIndex = 0;
            this.program_list.DragDrop += new System.Windows.Forms.DragEventHandler(this.listBox1_DragDrop);
            this.program_list.DragEnter += new System.Windows.Forms.DragEventHandler(this.listBox1_DragEnter);
            // 
            // upload_file
            // 
            this.upload_file.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(30)))), ((int)(((byte)(30)))), ((int)(((byte)(30)))));
            this.upload_file.FlatAppearance.BorderSize = 0;
            this.upload_file.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.upload_file.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.upload_file.ForeColor = System.Drawing.Color.White;
            this.upload_file.Image = global::DragandDrop.Properties.Resources.baseline_file_upload_white_36dp;
            this.upload_file.ImageAlign = System.Drawing.ContentAlignment.TopLeft;
            this.upload_file.Location = new System.Drawing.Point(337, 245);
            this.upload_file.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.upload_file.Name = "upload_file";
            this.upload_file.Size = new System.Drawing.Size(221, 58);
            this.upload_file.TabIndex = 4;
            this.upload_file.Text = "Прикачи";
            this.upload_file.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.upload_file.UseVisualStyleBackColor = false;
            this.upload_file.Click += new System.EventHandler(this.upload_file_Click);
            // 
            // options
            // 
            this.options.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(30)))), ((int)(((byte)(30)))), ((int)(((byte)(30)))));
            this.options.FlatAppearance.BorderSize = 0;
            this.options.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.options.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.options.ForeColor = System.Drawing.Color.White;
            this.options.Image = global::DragandDrop.Properties.Resources.baseline_settings_white_36dp;
            this.options.ImageAlign = System.Drawing.ContentAlignment.TopLeft;
            this.options.Location = new System.Drawing.Point(337, 170);
            this.options.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.options.Name = "options";
            this.options.Size = new System.Drawing.Size(221, 58);
            this.options.TabIndex = 3;
            this.options.Text = "Опции";
            this.options.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.options.UseVisualStyleBackColor = false;
            this.options.Click += new System.EventHandler(this.options_Click);
            // 
            // button2
            // 
            this.button2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(30)))), ((int)(((byte)(30)))), ((int)(((byte)(30)))));
            this.button2.FlatAppearance.BorderSize = 0;
            this.button2.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button2.ForeColor = System.Drawing.Color.White;
            this.button2.Image = global::DragandDrop.Properties.Resources.baseline_stop_white_36dp;
            this.button2.ImageAlign = System.Drawing.ContentAlignment.TopLeft;
            this.button2.Location = new System.Drawing.Point(337, 97);
            this.button2.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(221, 58);
            this.button2.TabIndex = 2;
            this.button2.Text = "Запри";
            this.button2.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.button2.UseVisualStyleBackColor = false;
            // 
            // start
            // 
            this.start.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(30)))), ((int)(((byte)(30)))), ((int)(((byte)(30)))));
            this.start.FlatAppearance.BorderSize = 0;
            this.start.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.start.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.start.ForeColor = System.Drawing.Color.White;
            this.start.Image = global::DragandDrop.Properties.Resources.baseline_play_arrow_white_36dp;
            this.start.ImageAlign = System.Drawing.ContentAlignment.TopLeft;
            this.start.Location = new System.Drawing.Point(337, 25);
            this.start.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.start.Name = "start";
            this.start.Size = new System.Drawing.Size(221, 58);
            this.start.TabIndex = 1;
            this.start.Text = "Започни";
            this.start.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.start.UseVisualStyleBackColor = false;
            this.start.Click += new System.EventHandler(this.start_Click);
            // 
            // delete_file
            // 
            this.delete_file.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(30)))), ((int)(((byte)(30)))), ((int)(((byte)(30)))));
            this.delete_file.FlatAppearance.BorderSize = 0;
            this.delete_file.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.delete_file.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.delete_file.ForeColor = System.Drawing.Color.White;
            this.delete_file.Image = global::DragandDrop.Properties.Resources.baseline_delete_white_36dp;
            this.delete_file.ImageAlign = System.Drawing.ContentAlignment.TopLeft;
            this.delete_file.Location = new System.Drawing.Point(337, 319);
            this.delete_file.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.delete_file.Name = "delete_file";
            this.delete_file.Size = new System.Drawing.Size(221, 58);
            this.delete_file.TabIndex = 5;
            this.delete_file.Text = "Избриши";
            this.delete_file.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.delete_file.UseVisualStyleBackColor = false;
            this.delete_file.Click += new System.EventHandler(this.delete_file_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.White;
            this.label5.Location = new System.Drawing.Point(48, 53);
            this.label5.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(32, 17);
            this.label5.TabIndex = 4;
            this.label5.Text = "ang";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.ForeColor = System.Drawing.Color.White;
            this.label4.Location = new System.Drawing.Point(48, 84);
            this.label4.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(30, 17);
            this.label4.TabIndex = 3;
            this.label4.Text = "m/s";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.ForeColor = System.Drawing.Color.White;
            this.label3.Location = new System.Drawing.Point(7, 84);
            this.label3.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(24, 17);
            this.label3.TabIndex = 2;
            this.label3.Text = "10";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.ForeColor = System.Drawing.Color.White;
            this.label2.Location = new System.Drawing.Point(7, 53);
            this.label2.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(32, 17);
            this.label2.TabIndex = 1;
            this.label2.Text = "100";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(27, 18);
            this.label1.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(31, 20);
            this.label1.TabIndex = 0;
            this.label1.Text = "Θ1";
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(18)))), ((int)(((byte)(18)))), ((int)(((byte)(18)))));
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Location = new System.Drawing.Point(37, 400);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.groupBox1.Size = new System.Drawing.Size(88, 113);
            this.groupBox1.TabIndex = 7;
            this.groupBox1.TabStop = false;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.label31);
            this.groupBox2.Controls.Add(this.label32);
            this.groupBox2.Controls.Add(this.label33);
            this.groupBox2.Controls.Add(this.label34);
            this.groupBox2.Controls.Add(this.label35);
            this.groupBox2.Location = new System.Drawing.Point(124, 400);
            this.groupBox2.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Padding = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.groupBox2.Size = new System.Drawing.Size(88, 113);
            this.groupBox2.TabIndex = 8;
            this.groupBox2.TabStop = false;
            // 
            // label31
            // 
            this.label31.AutoSize = true;
            this.label31.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label31.ForeColor = System.Drawing.Color.White;
            this.label31.Location = new System.Drawing.Point(27, 18);
            this.label31.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label31.Name = "label31";
            this.label31.Size = new System.Drawing.Size(31, 20);
            this.label31.TabIndex = 0;
            this.label31.Text = "Θ2";
            // 
            // label32
            // 
            this.label32.AutoSize = true;
            this.label32.ForeColor = System.Drawing.Color.White;
            this.label32.Location = new System.Drawing.Point(7, 53);
            this.label32.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label32.Name = "label32";
            this.label32.Size = new System.Drawing.Size(32, 17);
            this.label32.TabIndex = 1;
            this.label32.Text = "100";
            // 
            // label33
            // 
            this.label33.AutoSize = true;
            this.label33.ForeColor = System.Drawing.Color.White;
            this.label33.Location = new System.Drawing.Point(7, 84);
            this.label33.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label33.Name = "label33";
            this.label33.Size = new System.Drawing.Size(24, 17);
            this.label33.TabIndex = 2;
            this.label33.Text = "10";
            // 
            // label34
            // 
            this.label34.AutoSize = true;
            this.label34.ForeColor = System.Drawing.Color.White;
            this.label34.Location = new System.Drawing.Point(48, 84);
            this.label34.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label34.Name = "label34";
            this.label34.Size = new System.Drawing.Size(30, 17);
            this.label34.TabIndex = 3;
            this.label34.Text = "m/s";
            // 
            // label35
            // 
            this.label35.AutoSize = true;
            this.label35.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label35.ForeColor = System.Drawing.Color.White;
            this.label35.Location = new System.Drawing.Point(48, 53);
            this.label35.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label35.Name = "label35";
            this.label35.Size = new System.Drawing.Size(32, 17);
            this.label35.TabIndex = 4;
            this.label35.Text = "ang";
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.label36);
            this.groupBox3.Controls.Add(this.label37);
            this.groupBox3.Controls.Add(this.label38);
            this.groupBox3.Controls.Add(this.label39);
            this.groupBox3.Controls.Add(this.label40);
            this.groupBox3.Location = new System.Drawing.Point(211, 400);
            this.groupBox3.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Padding = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.groupBox3.Size = new System.Drawing.Size(88, 113);
            this.groupBox3.TabIndex = 9;
            this.groupBox3.TabStop = false;
            // 
            // label36
            // 
            this.label36.AutoSize = true;
            this.label36.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label36.ForeColor = System.Drawing.Color.White;
            this.label36.Location = new System.Drawing.Point(27, 18);
            this.label36.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label36.Name = "label36";
            this.label36.Size = new System.Drawing.Size(31, 20);
            this.label36.TabIndex = 0;
            this.label36.Text = "Θ3";
            // 
            // label37
            // 
            this.label37.AutoSize = true;
            this.label37.ForeColor = System.Drawing.Color.White;
            this.label37.Location = new System.Drawing.Point(7, 53);
            this.label37.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label37.Name = "label37";
            this.label37.Size = new System.Drawing.Size(32, 17);
            this.label37.TabIndex = 1;
            this.label37.Text = "100";
            // 
            // label38
            // 
            this.label38.AutoSize = true;
            this.label38.ForeColor = System.Drawing.Color.White;
            this.label38.Location = new System.Drawing.Point(7, 84);
            this.label38.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label38.Name = "label38";
            this.label38.Size = new System.Drawing.Size(24, 17);
            this.label38.TabIndex = 2;
            this.label38.Text = "10";
            // 
            // label39
            // 
            this.label39.AutoSize = true;
            this.label39.ForeColor = System.Drawing.Color.White;
            this.label39.Location = new System.Drawing.Point(48, 84);
            this.label39.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label39.Name = "label39";
            this.label39.Size = new System.Drawing.Size(30, 17);
            this.label39.TabIndex = 3;
            this.label39.Text = "m/s";
            // 
            // label40
            // 
            this.label40.AutoSize = true;
            this.label40.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label40.ForeColor = System.Drawing.Color.White;
            this.label40.Location = new System.Drawing.Point(48, 53);
            this.label40.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label40.Name = "label40";
            this.label40.Size = new System.Drawing.Size(32, 17);
            this.label40.TabIndex = 4;
            this.label40.Text = "ang";
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.label41);
            this.groupBox4.Controls.Add(this.label42);
            this.groupBox4.Controls.Add(this.label43);
            this.groupBox4.Controls.Add(this.label44);
            this.groupBox4.Controls.Add(this.label45);
            this.groupBox4.Location = new System.Drawing.Point(297, 400);
            this.groupBox4.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Padding = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.groupBox4.Size = new System.Drawing.Size(88, 113);
            this.groupBox4.TabIndex = 10;
            this.groupBox4.TabStop = false;
            // 
            // label41
            // 
            this.label41.AutoSize = true;
            this.label41.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label41.ForeColor = System.Drawing.Color.White;
            this.label41.Location = new System.Drawing.Point(27, 18);
            this.label41.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label41.Name = "label41";
            this.label41.Size = new System.Drawing.Size(31, 20);
            this.label41.TabIndex = 0;
            this.label41.Text = "Θ4";
            // 
            // label42
            // 
            this.label42.AutoSize = true;
            this.label42.ForeColor = System.Drawing.Color.White;
            this.label42.Location = new System.Drawing.Point(7, 53);
            this.label42.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label42.Name = "label42";
            this.label42.Size = new System.Drawing.Size(32, 17);
            this.label42.TabIndex = 1;
            this.label42.Text = "100";
            // 
            // label43
            // 
            this.label43.AutoSize = true;
            this.label43.ForeColor = System.Drawing.Color.White;
            this.label43.Location = new System.Drawing.Point(7, 84);
            this.label43.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label43.Name = "label43";
            this.label43.Size = new System.Drawing.Size(24, 17);
            this.label43.TabIndex = 2;
            this.label43.Text = "10";
            // 
            // label44
            // 
            this.label44.AutoSize = true;
            this.label44.ForeColor = System.Drawing.Color.White;
            this.label44.Location = new System.Drawing.Point(48, 84);
            this.label44.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label44.Name = "label44";
            this.label44.Size = new System.Drawing.Size(30, 17);
            this.label44.TabIndex = 3;
            this.label44.Text = "m/s";
            // 
            // label45
            // 
            this.label45.AutoSize = true;
            this.label45.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label45.ForeColor = System.Drawing.Color.White;
            this.label45.Location = new System.Drawing.Point(48, 53);
            this.label45.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label45.Name = "label45";
            this.label45.Size = new System.Drawing.Size(32, 17);
            this.label45.TabIndex = 4;
            this.label45.Text = "ang";
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.label46);
            this.groupBox5.Controls.Add(this.label47);
            this.groupBox5.Controls.Add(this.label48);
            this.groupBox5.Controls.Add(this.label49);
            this.groupBox5.Controls.Add(this.label50);
            this.groupBox5.Location = new System.Drawing.Point(384, 400);
            this.groupBox5.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Padding = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.groupBox5.Size = new System.Drawing.Size(88, 113);
            this.groupBox5.TabIndex = 11;
            this.groupBox5.TabStop = false;
            // 
            // label46
            // 
            this.label46.AutoSize = true;
            this.label46.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label46.ForeColor = System.Drawing.Color.White;
            this.label46.Location = new System.Drawing.Point(27, 18);
            this.label46.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label46.Name = "label46";
            this.label46.Size = new System.Drawing.Size(31, 20);
            this.label46.TabIndex = 0;
            this.label46.Text = "Θ5";
            // 
            // label47
            // 
            this.label47.AutoSize = true;
            this.label47.ForeColor = System.Drawing.Color.White;
            this.label47.Location = new System.Drawing.Point(7, 53);
            this.label47.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label47.Name = "label47";
            this.label47.Size = new System.Drawing.Size(32, 17);
            this.label47.TabIndex = 1;
            this.label47.Text = "100";
            // 
            // label48
            // 
            this.label48.AutoSize = true;
            this.label48.ForeColor = System.Drawing.Color.White;
            this.label48.Location = new System.Drawing.Point(7, 84);
            this.label48.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label48.Name = "label48";
            this.label48.Size = new System.Drawing.Size(24, 17);
            this.label48.TabIndex = 2;
            this.label48.Text = "10";
            // 
            // label49
            // 
            this.label49.AutoSize = true;
            this.label49.ForeColor = System.Drawing.Color.White;
            this.label49.Location = new System.Drawing.Point(48, 84);
            this.label49.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label49.Name = "label49";
            this.label49.Size = new System.Drawing.Size(30, 17);
            this.label49.TabIndex = 3;
            this.label49.Text = "m/s";
            // 
            // label50
            // 
            this.label50.AutoSize = true;
            this.label50.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label50.ForeColor = System.Drawing.Color.White;
            this.label50.Location = new System.Drawing.Point(48, 53);
            this.label50.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label50.Name = "label50";
            this.label50.Size = new System.Drawing.Size(32, 17);
            this.label50.TabIndex = 4;
            this.label50.Text = "ang";
            // 
            // groupBox6
            // 
            this.groupBox6.Controls.Add(this.label51);
            this.groupBox6.Controls.Add(this.label52);
            this.groupBox6.Controls.Add(this.label53);
            this.groupBox6.Controls.Add(this.label54);
            this.groupBox6.Controls.Add(this.label55);
            this.groupBox6.Location = new System.Drawing.Point(471, 400);
            this.groupBox6.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.groupBox6.Name = "groupBox6";
            this.groupBox6.Padding = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.groupBox6.Size = new System.Drawing.Size(88, 113);
            this.groupBox6.TabIndex = 12;
            this.groupBox6.TabStop = false;
            // 
            // label51
            // 
            this.label51.AutoSize = true;
            this.label51.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label51.ForeColor = System.Drawing.Color.White;
            this.label51.Location = new System.Drawing.Point(27, 18);
            this.label51.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label51.Name = "label51";
            this.label51.Size = new System.Drawing.Size(31, 20);
            this.label51.TabIndex = 0;
            this.label51.Text = "Θ6";
            // 
            // label52
            // 
            this.label52.AutoSize = true;
            this.label52.ForeColor = System.Drawing.Color.White;
            this.label52.Location = new System.Drawing.Point(7, 53);
            this.label52.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label52.Name = "label52";
            this.label52.Size = new System.Drawing.Size(32, 17);
            this.label52.TabIndex = 1;
            this.label52.Text = "100";
            // 
            // label53
            // 
            this.label53.AutoSize = true;
            this.label53.ForeColor = System.Drawing.Color.White;
            this.label53.Location = new System.Drawing.Point(7, 84);
            this.label53.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label53.Name = "label53";
            this.label53.Size = new System.Drawing.Size(24, 17);
            this.label53.TabIndex = 2;
            this.label53.Text = "10";
            // 
            // label54
            // 
            this.label54.AutoSize = true;
            this.label54.ForeColor = System.Drawing.Color.White;
            this.label54.Location = new System.Drawing.Point(48, 84);
            this.label54.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label54.Name = "label54";
            this.label54.Size = new System.Drawing.Size(30, 17);
            this.label54.TabIndex = 3;
            this.label54.Text = "m/s";
            // 
            // label55
            // 
            this.label55.AutoSize = true;
            this.label55.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label55.ForeColor = System.Drawing.Color.White;
            this.label55.Location = new System.Drawing.Point(48, 53);
            this.label55.Margin = new System.Windows.Forms.Padding(8, 7, 8, 7);
            this.label55.Name = "label55";
            this.label55.Size = new System.Drawing.Size(32, 17);
            this.label55.TabIndex = 4;
            this.label55.Text = "ang";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(18)))), ((int)(((byte)(18)))), ((int)(((byte)(18)))));
            this.ClientSize = new System.Drawing.Size(596, 548);
            this.Controls.Add(this.groupBox6);
            this.Controls.Add(this.groupBox5);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.delete_file);
            this.Controls.Add(this.upload_file);
            this.Controls.Add(this.options);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.start);
            this.Controls.Add(this.program_list);
            this.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(189)))), ((int)(((byte)(193)))), ((int)(((byte)(198)))));
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.groupBox5.ResumeLayout(false);
            this.groupBox5.PerformLayout();
            this.groupBox6.ResumeLayout(false);
            this.groupBox6.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ListBox program_list;
        private System.Windows.Forms.Button start;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button options;
        private System.Windows.Forms.Button upload_file;
        private System.Windows.Forms.Button delete_file;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label31;
        private System.Windows.Forms.Label label32;
        private System.Windows.Forms.Label label33;
        private System.Windows.Forms.Label label34;
        private System.Windows.Forms.Label label35;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Label label36;
        private System.Windows.Forms.Label label37;
        private System.Windows.Forms.Label label38;
        private System.Windows.Forms.Label label39;
        private System.Windows.Forms.Label label40;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.Label label41;
        private System.Windows.Forms.Label label42;
        private System.Windows.Forms.Label label43;
        private System.Windows.Forms.Label label44;
        private System.Windows.Forms.Label label45;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.Label label46;
        private System.Windows.Forms.Label label47;
        private System.Windows.Forms.Label label48;
        private System.Windows.Forms.Label label49;
        private System.Windows.Forms.Label label50;
        private System.Windows.Forms.GroupBox groupBox6;
        private System.Windows.Forms.Label label51;
        private System.Windows.Forms.Label label52;
        private System.Windows.Forms.Label label53;
        private System.Windows.Forms.Label label54;
        private System.Windows.Forms.Label label55;
    }
}

