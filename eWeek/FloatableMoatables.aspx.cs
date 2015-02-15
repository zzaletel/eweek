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
    public partial class FloatableMoatables : System.Web.UI.Page
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
            int id = 0;
            if (!int.TryParse(this.TextBoxID.Text, out id))
            {
                this.LabelOutput.Text = "invaild ID";
                return;
            }
            if (id < 5000) {
                this.LabelOutput.Text = "Participant ID has to be a team ID.";
                return;
            }

            int marbles_num = 0;

            if(this.DropDownListSurvival.SelectedValue == "Yes"){
                int.TryParse(this.TextBoxMarbleNum.Text, out marbles_num);
            }

            string[] info = this.getTeamInfoById(this.TextBoxID.Text);

            //insert record
            try
            {
                SqlConnection mySqlConnection = new SqlConnection(SqlTool.GetConnectionString());

                string sqlQuery = "INSERT INTO floatable_moatable_report (participant_id, student_names, school, " +
                    "grade_group, marbles_num, people_num) VALUES " +
                   "('" + this.TextBoxID.Text + "','" + info[0] + "','" + info[1] + "','" + info[3]
                + "','" + marbles_num + "','" + info[2] + "');";

                SqlCommand Command = new SqlCommand(sqlQuery, mySqlConnection);
                SqlDataReader mySqlDataReader;
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
                this.LabelDebug.Text = "Inserting Record Error: " + ex.Message;
            }
        
        }

        public string[] getTeamInfoById(string id)
        {
            string[] toReturn = new string[4];
            string studentRep = "";

            try
            {
                SqlConnection mySqlConnection = new SqlConnection(SqlTool.GetConnectionString());

                string sqlQuery = "select member_names, team_size, representative_id " +
                "from team where team_id =" + id + ";";

                SqlCommand Command = new SqlCommand(sqlQuery, mySqlConnection);
                SqlDataReader mySqlDataReader;
                mySqlConnection.Open();
                mySqlDataReader = Command.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    toReturn[0] = mySqlDataReader.GetString(0);    // member names
                    toReturn[2] = mySqlDataReader.GetInt32(1).ToString();    // team size
                    studentRep = mySqlDataReader.GetInt32(2).ToString();  //  rep id
                }

                mySqlDataReader.Close();

                sqlQuery = "select school, grade from student where student_id =" + studentRep + ";";
                Command = new SqlCommand(sqlQuery, mySqlConnection);
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
                this.LabelDebug.Text = "Get Team Info Error: " + ex.Message;
            }

            return toReturn;
        }

        protected void ButtonReset_Click(object sender, EventArgs e)
        {
            this.TextBoxMarbleNum.Text = "";
            this.TextBoxID.Text = "";
            this.DropDownListSurvival.SelectedValue = "Yes";
            this.LabelOutput.Text = "";
        }
    }
}