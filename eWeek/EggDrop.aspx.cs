﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using ASPWenFormPractice1.CsLib;

namespace ASPWenFormPractice1
{
    public partial class EggDrop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                this.Visible = true;
            }
        }

        protected void ButtonCalculate_Click(object sender, EventArgs e)
        {
            //popute allowed time
            string[] info;
            double idValue;
            if (!Double.TryParse(this.TextBoxID.Text, out idValue))
            {
                this.LabelEggDropOutput.Text = "Invaild Id number!";
                return;
            }

            if (idValue >= 5000)
            {
                //get info from team table by id
                info = this.getTeamInfoById(this.TextBoxID.Text);
            }
            else
            {
                //get info from student table by id
                info = this.getStudentInfoById(this.TextBoxID.Text);
            }

            if (info[3].Equals("1 to 3") || info[3].Equals("4 to 6"))
            {
                this.TextBoxAllowedTime.Text = "40";
            }
            else if (info[3].Equals("7 to 8") || info[3].Equals("9 to 12"))
            {
                this.TextBoxAllowedTime.Text = "20";
            }
            else {
                this.TextBoxAllowedTime.Text = "error";
            }

            //get duration time
            this.TextBoxTotalTime.Text = Tools.getDuration(this.TextBoxSTime.Text, this.TextBoxETime.Text);

            //validations
            double temp;
            if (!Double.TryParse(TextBoxAllowedTime.Text, out temp))
            {
                this.LabelEggDropOutput.Text = "allowed time is not in a correct format (it should be time in minutes)";
                return;
            }
            
            if (!Tools.validate(TextBoxTotalTime.Text))
            {
                this.LabelEggDropOutput.Text = "total time is not in a correct format (should be xx:xx)";
                return;
            }

            if(Double.Parse(TextBoxAllowedTime.Text) <= Tools.getMinutes(TextBoxTotalTime.Text)){
                this.TextBoxPDist.Text =
                    (Tools.getMinutes(TextBoxTotalTime.Text) - Double.Parse(TextBoxAllowedTime.Text)).ToString();
            }
            else{
                this.TextBoxPDist.Text = "0";
            }

            this.TextBoxTotalDist.Text = Tools.getSum(this.TextBoxMDist.Text, this.TextBoxPDist.Text);
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            string[] info;
            double idValue;
            if (!Double.TryParse(this.TextBoxID.Text, out idValue))
            {
                this.LabelEggDropOutput.Text = "Invaild Id number!";
                return;
            }
          
            if (idValue >= 5000)
            {
                //get info from team table by id
                info = this.getTeamInfoById(this.TextBoxID.Text);
            }
            else
            {
                //get info from student table by id
                info = this.getStudentInfoById(this.TextBoxID.Text);
            }

            try
            {
                SqlConnection mySqlConnection = new SqlConnection(GetConnectionString());

                string sqlQuery = "INSERT INTO egg_drop_report (participant_id, student_names, school," +
                    "number_of_team_members, grade_group, survive, measured_dist, allowed_time, start_time," +
                    "end_time, total_time, penalty_dist, total_dist) VALUES " +
                   "('" + this.TextBoxID.Text + "','" + info[0] + "','" + info[1] + "','" + info[2]
                + "','" + info[3] + "','" + this.DropDownListSurvival.Text + "','" + this.TextBoxMDist.Text
                + "','" + this.TextBoxAllowedTime.Text + "','" + this.TextBoxSTime.Text + "','"
                + this.TextBoxETime.Text + "','" + this.TextBoxTotalTime.Text + "','" +
                this.TextBoxPDist.Text + "','" + this.TextBoxTotalDist.Text + "');";

                SqlCommand Command = new SqlCommand(sqlQuery, mySqlConnection);
                SqlDataReader mySqlDataReader;
                mySqlConnection.Open();
                mySqlDataReader = Command.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                }

                mySqlDataReader.Dispose();
                mySqlConnection.Close();

                this.LabelEggDropOutput.Text = "ID: " + this.TextBoxID.Text +
                    ", Your record was inserted.";
            }
            catch (Exception ex)
            {
                this.LabelEggDropOutput.Text = "Inserting Record Error: " + ex.Message;
            }
        }

        public string[] getStudentInfoById(string id)
        {
            string[] toReturn = new string[4];
            try
            {
                SqlConnection mySqlConnection = new SqlConnection(GetConnectionString());

                string sqlQuery = "SELECT name, school, grade FROM student WHERE student_id =" + id + ";";

                SqlCommand Command = new SqlCommand(sqlQuery, mySqlConnection);
                SqlDataReader mySqlDataReader;
                mySqlConnection.Open();
                mySqlDataReader = Command.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    toReturn[0] = mySqlDataReader.GetString(0);    //name
                    toReturn[1] = mySqlDataReader.GetString(1);    //school
                    toReturn[3] = mySqlDataReader.GetString(2);    //grade
                }

                mySqlDataReader.Dispose();
                mySqlConnection.Close();

            }
            catch (Exception ex)
            {
                this.LabelDebug.Text = "Get Student Info Error: " + ex.Message;
            }

            toReturn[2] = "1"; //one person
            return toReturn;
        }

        public string[] getTeamInfoById(string id)
        {
            string[] toReturn = new string[4];
            string studentRep = "";

            
                SqlConnection mySqlConnection = new SqlConnection(GetConnectionString());

                string sqlQuery = "select member_names, team_size, representative_id from team where team_id = " + id + ";";

                SqlCommand Command = new SqlCommand(sqlQuery, mySqlConnection);
                SqlDataReader mySqlDataReader;
                mySqlConnection.Open();
                mySqlDataReader = Command.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    toReturn[0] = mySqlDataReader.GetString(0);    // member names
                    toReturn[2] = mySqlDataReader.GetInt32(1).ToString();    // team size
                    studentRep = mySqlDataReader.GetInt32(2).ToString();  //  rep id GetDecimal
                }

                mySqlDataReader.Close();

                sqlQuery = "select school, grade from student where student_id = " + studentRep + ";";
                Command = new SqlCommand(sqlQuery, mySqlConnection);
                mySqlDataReader = Command.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    toReturn[1] = mySqlDataReader.GetString(0);    // school
                    toReturn[3] = mySqlDataReader.GetString(1);    // grade
                }

                mySqlDataReader.Dispose();
                mySqlConnection.Close();

           

            return toReturn;
        }


        public string GetConnectionString()
        {
            //sets the connection string from your web config file "ConnString" is the name of your Connection String
            return System.Configuration.ConfigurationManager.ConnectionStrings["eweekDb"].ConnectionString;
        }

        protected void ButtonReset_Click(object sender, EventArgs e)
        {
            this.TextBoxID.Text = "";
            this.DropDownListSurvival.SelectedValue = "Yes";
            this.TextBoxMDist.Text = "";
            this.TextBoxAllowedTime.Text = "";
            this.TextBoxSTime.Text = "";
            this.TextBoxETime.Text = "";
            this.TextBoxTotalTime.Text = "To be calculated";
            this.TextBoxPDist.Text = "To be calculated";
            this.TextBoxTotalDist.Text = "To be calculated";
            this.LabelEggDropOutput.Text = "";
        }
    }
}