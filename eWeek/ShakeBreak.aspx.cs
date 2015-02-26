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
    public partial class ShakeBreak : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                this.Visible = true;
            }
        }

        protected void ButtonReset_Click(object sender, EventArgs e)
        {
            this.TextBoxID.Text = "";
            this.TextBoxStoriesNum.Text = "";
            this.TextBoxSurvivalTime.Text = "";
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

            double total_points = 0.0;
            double time = 0.0;
            double stories_num = 0.0;

            if (!Double.TryParse(this.TextBoxSurvivalTime.Text, out time)){
                this.LabelOutput.Text = "Invaild Time!";
                return;
            }

            if (!Double.TryParse(this.TextBoxStoriesNum.Text, out stories_num))
            {
                this.LabelOutput.Text = "Invaild Stories Number!";
                return;
            }

            // If<10 seconds, (seconds survived)+ (if >10 stories survived, 2*(Stories survived-10))
            //if >10 seconds, 10+(seconds survived-10)*2++if >10 stories survived, 2*(Stories survived-10)
            if (time < 10) {
                if (stories_num > 10)
                {
                    total_points = time + 2 * (stories_num - 10);
                }
                else {
                    total_points = time;
                }
            }
            else { //time >10
                if (stories_num > 10)
                {
                    total_points = 10 + 2*(time-10) + 2 * (stories_num - 10);
                }
                else {
                    total_points = 10 + 2 * (time - 10);
                }
            }

            try
            {
                SqlConnection SqlConnection = new SqlConnection(SqlTool.GetConnectionString());

                string sqlQuery = "INSERT INTO shake_and_break_report (participant_id, student_names, school," +
                    "grade_group, survival_time, stories_num, total_points) VALUES " +
                   "('" + this.TextBoxID.Text + "','" + info[0] + "','" + info[1] + "','" + info[3]
                + "','" + this.TextBoxSurvivalTime.Text + "','" + this.TextBoxStoriesNum.Text + "','"
                + total_points + "');";

                SqlCommand Command = new SqlCommand(sqlQuery, SqlConnection);
                SqlDataReader SqlDataReader;
                SqlConnection.Open();
                SqlDataReader = Command.ExecuteReader();

                while (SqlDataReader.Read())
                {
                }

                SqlDataReader.Dispose();
                SqlConnection.Close();

                this.LabelOutput.Text = "ID: " + this.TextBoxID.Text +
                    ", Your record was inserted. Your total point is"+total_points;
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
                SqlConnection SqlConnection = new SqlConnection(SqlTool.GetConnectionString());

                string sqlQuery = "select member_names, team_size, representative_id " +
                "from team where team_id =" + id + ";";

                SqlCommand Command = new SqlCommand(sqlQuery, SqlConnection);
                SqlDataReader SqlDataReader;
                SqlConnection.Open();
                SqlDataReader = Command.ExecuteReader();

                while (SqlDataReader.Read())
                {
                    toReturn[0] = SqlDataReader.GetString(0);    // member names
                    toReturn[2] = SqlDataReader.GetInt32(1).ToString();    // team size
                    studentRep = SqlDataReader.GetInt32(2).ToString();  //  rep id
                }

                SqlDataReader.Close();

                sqlQuery = "select school, grade from student where student_id =" + studentRep + ";";
                Command = new SqlCommand(sqlQuery, SqlConnection);
                SqlDataReader = Command.ExecuteReader();

                while (SqlDataReader.Read())
                {
                    toReturn[1] = SqlDataReader.GetString(0);    // school
                    toReturn[3] = SqlDataReader.GetString(1);    // grade
                }

                SqlDataReader.Dispose();
                SqlConnection.Close();

            }
            catch (Exception ex)
            {
                this.LabelOutput.Text = "Get Team Info Error: " + ex.Message;
            }

            return toReturn;
        }

    }
}