﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace ASPWenFormPractice1
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Lable_intro.Style["font-weight"] = "bold";
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                this.Button_student_reg.Style["display"] = "";
                this.Lable_intro.Style["display"] = "none";
            }
        }

        protected void Button_Student_reg(object sender, EventArgs e)
        {
            try
            {
                MySqlConnection mySqlConnection = new MySqlConnection(GetConnectionString());

                string sqlQuery = "INSERT INTO student (name, school, grade) VALUES " +
                   "('" + this.TxtName.Text + "','" + this.TxtSchool.Text + "','" + this.TxtGrade.Text + "');";

                string getIdQ = "SELECT LAST_INSERT_ID();";
                string id = "";

                MySqlCommand Command = new MySqlCommand(sqlQuery, mySqlConnection);
                MySqlDataReader mySqlDataReader;
                mySqlConnection.Open();
                mySqlDataReader = Command.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                }
                mySqlDataReader.Close();

                Command = new MySqlCommand(getIdQ, mySqlConnection);
                mySqlDataReader = Command.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    id = mySqlDataReader.GetString(0);  //get newly inserted student id
                }
                mySqlDataReader.Dispose();
                mySqlConnection.Close();

                this.Label_student_reg.Text = "Registered! " + this.TxtName.Text + ", your ID is "
                    + id;
            }
            catch (Exception ex)
            {
                this.Label_student_reg.Text = ex.Message;
            }
        }

        public string GetConnectionString()
        {
            //sets the connection string from your web config file "ConnString" is the name of your Connection String
            return System.Configuration.ConfigurationManager.ConnectionStrings["eweekDb"].ConnectionString;
        }
    }

}