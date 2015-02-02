using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASPWenFormPractice1.CsLib;
using MySql.Data.MySqlClient;

namespace ASPWenFormPractice1
{
    public partial class BridgeBuster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

            if (idValue > 5000)
            {
                // team
                this.LabelEggDropOutput.Text = "ID has to be student ID";
                return;
            }
            else
            {
                //get info from student table by id
                info = this.getStudentInfoById(this.TextBoxID.Text);
            }

            double mass = 0.0;
            double contest_mass = 0.0;
            double ratio = 0.0;
            double load = 0.0;
            if (!Double.TryParse(this.TextBoxMass.Text, out mass))
            {
                this.LabelEggDropOutput.Text = "Invaild mass number!";
                return;
            }
            if (!Double.TryParse(this.TextBoxLoad.Text, out load))
            {
                this.LabelEggDropOutput.Text = "Invaild load number!";
                return;
            }

            if (mass > 50)
            {
                contest_mass = 50 + Math.Pow((mass - 50), 1.5);
            }
            else {
                contest_mass = mass;
            }
            ratio = load / contest_mass;

            if (this.DropDownListPasses.SelectedValue != "Yes") {
                ratio = 0.0;
            }

            try
            {
                MySqlConnection mySqlConnection = new MySqlConnection(SqlTool.GetConnectionString());

                string sqlQuery = "INSERT INTO bridge_buster_report (participant_id, student_name, school," +
                    "grade_group, passes_inspection, mass, contest_mass, `load`, ratio) VALUES " +
                   "('" + this.TextBoxID.Text + "','" + info[0] + "','" + info[1] + "','" + info[3]
                + "','" + this.DropDownListPasses.Text + "','" + this.TextBoxMass.Text + "','" + contest_mass.ToString("#.##")
                + "','" + this.TextBoxLoad.Text + "','" + ratio.ToString("#.##") + "');";

                MySqlCommand Command = new MySqlCommand(sqlQuery, mySqlConnection);
                MySqlDataReader mySqlDataReader;
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
                MySqlConnection mySqlConnection = new MySqlConnection(SqlTool.GetConnectionString());

                string sqlQuery = "SELECT name, school, grade FROM student WHERE student_id =" + id + ";";

                MySqlCommand Command = new MySqlCommand(sqlQuery, mySqlConnection);
                MySqlDataReader mySqlDataReader;
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
                this.LabelEggDropOutput.Text = "Get Student Info Error: " + ex.Message;
            }

            toReturn[2] = "1"; //one person
            return toReturn;
        }



        protected void ButtonReset_Click(object sender, EventArgs e)
        {
            this.TextBoxID.Text = "";
            this.TextBoxLoad.Text = "";
            this.TextBoxMass.Text = "";
            this.DropDownListPasses.SelectedValue = "Yes";
        }
    }
}