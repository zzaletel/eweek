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
    public partial class EggToss : System.Web.UI.Page
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
            this.TextBoxDist.Text = "";
            this.TextBoxConstrutTime.Text = "";
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            string[] info;
            double idValue;
            string totalPoint = "";
            double dist = 0;
            double const_time = 0;
            double allowed_time = 30;
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

            if (!Double.TryParse(this.TextBoxDist.Text, out dist))
            {
                this.LabelOutput.Text = "Invaild Distance!";
                return;
            }

            if (!Double.TryParse(this.TextBoxConstrutTime.Text, out const_time))
            {
                this.LabelOutput.Text = "Invaild construction time!";
                return;
            }

            //Distance from target+[Construction time (if over limit) - construction time allowed]*1in/min=Total distance
            //check first char in grade group (e.g '7 to 12' -> '7')
            if( int.Parse(info[3][0].ToString()) > 6 ){ allowed_time = 15;}
            if(const_time > allowed_time){
                totalPoint = (dist+ const_time - allowed_time).ToString() ;
            }
            else{
                totalPoint = dist.ToString();
            }

            try
            {
                SqlConnection mySqlConnection = new SqlConnection(SqlTool.GetConnectionString());

                string sqlQuery = "INSERT INTO egg_toss_report (participant_id, student_names, school," +
                    "grade_group, dist_from_target, construt_time, total_points) VALUES " +
                   "('" + this.TextBoxID.Text + "','" + info[0] + "','" + info[1] + "','" + info[3]
                + "','" + this.TextBoxDist.Text + "','" + this.TextBoxConstrutTime.Text
                + "','" + totalPoint +  "');";

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
                this.LabelOutput.Text = "Inserting Record Error: " + ex.Message;
            }
        }

        public string[] getStudentInfoById(string id)
        {
            string[] toReturn = new string[4];
            try
            {
                SqlConnection mySqlConnection = new SqlConnection(SqlTool.GetConnectionString());

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
                this.LabelOutput.Text = "Get Team Info Error: " + ex.Message;
            }

            return toReturn;
        }
    }
}