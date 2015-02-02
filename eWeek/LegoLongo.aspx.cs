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
    public partial class LegoLongo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonReset_Click(object sender, EventArgs e)
        {
            this.TextBox1Length.Text = "";
            this.TextBox1Weight.Text = "";
            this.TextBox2Length.Text = "";
            this.TextBox2Weight.Text = "";
            this.DropDownList1Survival.SelectedValue = "Yes";
            this.DropDownList2Survival.SelectedValue = "Yes";

        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            string[] info;
            double idValue;
            if (!Double.TryParse(this.TextBoxID.Text, out idValue))
            {
                this.LabelOutput.Text = "Invaild Id number!";
                return;
            }

            if (idValue > 5000)
            {
                //get info from team table by id
                info = this.getTeamInfoById(this.TextBoxID.Text);
            }
            else
            {
                //get info from student table by id
                info = this.getStudentInfoById(this.TextBoxID.Text);
            }

            double max_dist = 0.0;
            String selected_val_2 = "Yes";

            if (TextBox1Length.Text != "" &&  TextBox2Length.Text != "")//two attempts
            {
                double second_attempt = 0.0;
                if (!Double.TryParse(this.TextBox1Length.Text, out max_dist)) // set max to first attempt
                {
                    this.LabelOutput.Text = "Invaild Length Input in first attempt!";
                    return;
                }
                if (!Double.TryParse(this.TextBox2Length.Text, out second_attempt))
                {
                    this.LabelOutput.Text = "Invaild Length Input in second attempt!";
                    return;
                }

                if (DropDownList1Survival.SelectedValue != "Yes") { //if first attempt did not survive
                    max_dist = 0.0;
                }

                if (DropDownList2Survival.SelectedValue == "Yes")// if second attempt survived
                {
                    max_dist = (max_dist > second_attempt) ? max_dist : second_attempt;
                }
                else {
                    selected_val_2 = "No";
                }
            }
            else { 
                if (TextBox1Length.Text != "") // only first attempt
                {
                    selected_val_2 = ""; 
                    if (!Double.TryParse(this.TextBox1Length.Text, out max_dist)) {
                        this.LabelOutput.Text = "Invaild Length Input in first attempt!";
                        return;
                    }
                    if (DropDownList1Survival.SelectedValue != "Yes") { max_dist = 0.0; }//first attempt did not survive
                }
                else { // 0 attempt
                    this.LabelOutput.Text = "Length Input is required";
                    return;
                }
            }


            try
            {
                MySqlConnection mySqlConnection = new MySqlConnection(SqlTool.GetConnectionString());

                string sqlQuery = "INSERT INTO lego_longo_report (participant_id, student_names, school, " +
                    "grade_group, length1, weight1, survive1, length2," +
                    "weight2, survive2, max_distance) VALUES " +
                   "('" + this.TextBoxID.Text + "','" + info[0] + "','" + info[1] + "','" + info[3]
                + "','" + this.TextBox1Length.Text + "','" + this.TextBox1Weight.Text + "','" + this.DropDownList1Survival.Text
                + "','" + this.TextBox2Length.Text + "','" + this.TextBox2Weight.Text + "','"
                + selected_val_2 + "','" + max_dist  + "');";

                MySqlCommand Command = new MySqlCommand(sqlQuery, mySqlConnection);
                MySqlDataReader mySqlDataReader;
                mySqlConnection.Open();
                mySqlDataReader = Command.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                }

                mySqlDataReader.Dispose();
                mySqlConnection.Close();

                this.LabelOutput.Text = "ID: " + this.TextBoxID.Text +
                    ", Your record was inserted.";
            }
            catch (Exception ex)
            {
                this.LabelOutput.Text = "Inserting Record Error: " + ex.Message;
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
                this.LabelOutput.Text = "Get Student Info Error: " + ex.Message;
            }

            toReturn[2] = "1"; //one person
            return toReturn;
        }

        public string[] getTeamInfoById(string id)
        {
            string[] toReturn = new string[4];
            string studentRep = "";

            try
            {
                MySqlConnection mySqlConnection = new MySqlConnection(SqlTool.GetConnectionString());

                string sqlQuery = "select member_names, team_size, representative_id " +
                "from team where team_id =" + id + ";";

                MySqlCommand Command = new MySqlCommand(sqlQuery, mySqlConnection);
                MySqlDataReader mySqlDataReader;
                mySqlConnection.Open();
                mySqlDataReader = Command.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    toReturn[0] = mySqlDataReader.GetString(0);    // member names
                    toReturn[2] = mySqlDataReader.GetString(1);    // team size
                    studentRep = mySqlDataReader.GetString(2);  //  rep id
                }

                mySqlDataReader.Close();

                sqlQuery = "select school, grade from student where student_id =" + studentRep + ";";
                Command = new MySqlCommand(sqlQuery, mySqlConnection);
                mySqlDataReader = Command.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    toReturn[1] = mySqlDataReader.GetString(0);    // school
                    toReturn[3] = mySqlDataReader.GetString(1);    // grade
                }

                mySqlDataReader.Dispose();
                mySqlConnection.Close();

            }
            catch (Exception ex)
            {
                this.LabelOutput.Text = "Get Team Info Error: " + ex.Message;
            }

            return toReturn;
        }


    }
}