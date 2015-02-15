using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using ASPWenFormPractice1.CsLib;

namespace ASPWenFormPractice1
{
    public partial class TowerOfPower : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                this.Visible = true;
            }
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

            if (mass > 100)
            {
                contest_mass = 100 + Math.Pow((mass - 100), 1.5);
            }
            else
            {
                contest_mass = mass;
            }
            ratio = load / contest_mass;

            if (this.DropDownListPasses.SelectedValue != "Yes")
            {
                ratio = 0.0;
            }

            try
            {
                SqlConnection SqlConnection = new SqlConnection(SqlTool.GetConnectionString());

                string sqlQuery = "INSERT INTO tower_of_power (participant_id, student_name, school," +
                    "grade_group, passes_inspection, mass, contest_mass, peak_load, ratio) VALUES " +
                   "('" + this.TextBoxID.Text + "','" + info[0] + "','" + info[1] + "','" + info[3]
                + "','" + this.DropDownListPasses.Text + "','" + this.TextBoxMass.Text + "','" + contest_mass.ToString("#.##")
                + "','" + this.TextBoxLoad.Text + "','" + ratio.ToString("#.##") + "');";

                SqlCommand Command = new SqlCommand(sqlQuery, SqlConnection);
                SqlDataReader SqlDataReader;
                SqlConnection.Open();
                SqlDataReader = Command.ExecuteReader();

                while (SqlDataReader.Read())
                {
                }

                SqlDataReader.Dispose();
                SqlConnection.Close();

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
                SqlConnection SqlConnection = new SqlConnection(SqlTool.GetConnectionString());

                string sqlQuery = "SELECT name, school, grade FROM student WHERE student_id =" + id + ";";

                SqlCommand Command = new SqlCommand(sqlQuery, SqlConnection);
                SqlDataReader SqlDataReader;
                SqlConnection.Open();
                SqlDataReader = Command.ExecuteReader();

                while (SqlDataReader.Read())
                {
                    toReturn[0] = SqlDataReader.GetString(0);    //name
                    toReturn[1] = SqlDataReader.GetString(1);    //school
                    toReturn[3] = SqlDataReader.GetString(2);    //grade
                }

                SqlDataReader.Dispose();
                SqlConnection.Close();

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