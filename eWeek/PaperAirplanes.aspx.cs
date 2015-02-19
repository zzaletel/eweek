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
    public partial class PaperAirplanes : System.Web.UI.Page
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
            this.TextBoxDist_ft.Text = "";
            this.TextBoxDist_in.Text = "";
            this.TextBoxDist2_ft.Text = "";
            this.TextBoxDist2_in.Text = "";
            this.TextBoxID.Text = "";
            this.TextBoxMaxDist.Text = "To be calculated";
            this.TextBoxOffset_ft.Text = "";
            this.TextBoxOffset_in.Text = "";
            this.TextBoxOffset2_ft.Text = "";
            this.TextBoxOffset2_in.Text = "";
            this.TextBoxPlaneNum.Text = "";
            this.TextBoxScore.Text = "To be calculated";
            this.TextBoxScore2.Text = "To be calculated";
        }

        protected void ButtonCalculate_Click(object sender, EventArgs e)
        {
            string[] info = {this.TextBoxDist_ft.Text ,
            this.TextBoxDist_in.Text ,
            this.TextBoxOffset_ft.Text ,
            this.TextBoxOffset_in.Text ,
            this.TextBoxDist2_ft.Text ,
            this.TextBoxDist2_in.Text ,
            this.TextBoxOffset2_ft.Text ,
            this.TextBoxOffset2_in.Text };
            
            double[] val = new double[8];
            int n = 0;
            foreach(string i in info){            
                if(!double.TryParse(i, out val[n])){
                    if (i == "" && n > 3) { } //second attempt is empty
                    else
                    {
                        this.LabelOutput.Text = "invalid input(s)";
                        return;
                    }
                }
                n++;
            }

            if (info[4] == "" && info[5] == "")//second attempt is empty
            {
                this.TextBoxScore.Text = ((val[0] + val[1] / 12) - 2 * (val[2] + val[3] / 12)).ToString("#.##");
                this.TextBoxMaxDist.Text = ((val[0] + val[1] / 12) - 2 * (val[2] + val[3] / 12)).ToString("#.##");
                this.TextBoxScore2.Text = "";
            }
            else
            {
                this.TextBoxScore.Text = ((val[0] + val[1] / 12) - 2 * (val[2] + val[3] / 12)).ToString("#.##");
                this.TextBoxScore2.Text = ((val[4] + val[5] / 12) - 2 * (val[6] + val[7] / 12)).ToString("#.##");
                this.TextBoxMaxDist.Text = (
                    ((val[0] + val[1] / 12) - 2 * (val[2] + val[3] / 12)) >
                    ((val[4] + val[5] / 12) - 2 * (val[6] + val[7] / 12))) ?
                    ((val[0] + val[1] / 12) - 2 * (val[2] + val[3] / 12)).ToString("#.##") :
                    ((val[4] + val[5] / 12) - 2 * (val[6] + val[7] / 12)).ToString("#.##");
            }
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            string[] info;

            int id = 0;
            if (!int.TryParse(this.TextBoxID.Text, out id))
            {
                this.LabelOutput.Text = "invaild ID";
                return;
            }
            if (id >= 5000)
            {
                this.LabelOutput.Text = "Participant ID has to be a student ID.";
                return;
            }

            info = this.getStudentInfoById(this.TextBoxID.Text);

            try
            {
                SqlConnection SqlConnection = new SqlConnection(SqlTool.GetConnectionString());

                string sqlQuery = "INSERT INTO paper_airplanes_report (participant_id, student_names, school," +
                    "grade_group, Plane_num, dist1_ft, dist1_in, offset1_ft, offset1_in, score1, " +
                    "dist2_ft, dist2_in, offset2_ft, offset2_in, score2, max_dist) VALUES " +
                   "('" + this.TextBoxID.Text + "','" + info[0] + "','" + info[1] + "','" + info[3]
                + "','" + this.TextBoxPlaneNum.Text + "','" + this.TextBoxDist_ft.Text + "','" + this.TextBoxDist_in.Text +
                "','" + this.TextBoxOffset_ft.Text + "','" + this.TextBoxOffset_in.Text + "','" + this.TextBoxScore.Text + "','"
                + this.TextBoxDist2_ft.Text + "','" + this.TextBoxDist2_in.Text + "','" +
                this.TextBoxOffset2_ft.Text + "','" + this.TextBoxOffset2_in.Text + "','" + this.TextBoxScore2.Text + "','"
                + this.TextBoxMaxDist.Text +"');";

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

    }
}