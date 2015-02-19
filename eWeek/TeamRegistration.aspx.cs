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
    public partial class Team_Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                this.Visible = true;
            }
        }

        protected void Button_Team_reg(object sender, EventArgs e)
        {
            if (teamMembersStringValidation(this.TextTeamMembers.Text))
            {
                try
                {
                    SqlConnection mySqlConnection = new SqlConnection(DBController.GetConnectionString("eweekDb"));

                    string staSql = "INSERT INTO student_team_affiliation (team_id,student_id) VALUES ";

                    string getStudentNameSqlPre = "select name from student where student_id =";
                    string getIdQ = "SELECT SCOPE_IDENTITY();";
                    string id = "";

                    string TeamMembers = this.TextTeamMembers.Text;
                    string[] words = TeamMembers.Split(',');
                    string allNames = "";
                    string getStudentNameSql = "";
                    int teamSize = words.Length;
                    int teamRep = Int32.Parse(words[0]);

                    SqlCommand Command;
                    SqlDataReader mySqlDataReader;
                    mySqlConnection.Open();

                    foreach (string s in words) //insert members to new team
                    {
                        getStudentNameSql = getStudentNameSqlPre + Int32.Parse(s) + ";";
                        Command = new SqlCommand(getStudentNameSql, mySqlConnection);
                        mySqlDataReader = Command.ExecuteReader();
                        while (mySqlDataReader.Read())
                        {
                            allNames += mySqlDataReader.GetString(0)+", ";  //get student name
                        }
                        mySqlDataReader.Close();
                    }

                    string teamSqlQuery = "INSERT INTO team (name, member_names, team_size, representative_id) VALUES " +
                       "('" + this.TextTeamName.Text + "','" + allNames + "','" + teamSize + "','"
                       + teamRep + "');";

                    //Command = new SqlCommand(teamSqlQuery, mySqlConnection);        
                    //Command.ExecuteNonQuery();


                    Command = new SqlCommand(teamSqlQuery + getIdQ, mySqlConnection); //insert + get new id
                    mySqlDataReader = Command.ExecuteReader();

                    while (mySqlDataReader.Read())
                    {
                        id = mySqlDataReader.GetDecimal(0).ToString();  //get newly inserted team id
                    }
                    mySqlDataReader.Close();


                    foreach (string s in words) //insert members to new team
                    {
                        getStudentNameSql += Int32.Parse(s) + ";";
                        Command = new SqlCommand(staSql + "('" + id + "','" + s + "');", mySqlConnection);
                        Command.ExecuteNonQuery();
                    }


                    mySqlDataReader.Dispose();
                    mySqlConnection.Close();

                    this.Label_team_reg.Text = "Registered! Your team ID is "
                        + id;
                }
                catch (Exception ex)
                {
                    this.Label_team_reg.Text = ex.Message;
                }
            }
            else { }
        }

        public bool teamMembersStringValidation(string members)
        {
            string[] words = members.Split(',');
            int x = 0;
            foreach (string s in words)
            {
                if (Int32.TryParse(s, out x)) { }
                else
                {
                    this.Label_team_reg.Text = "Wrong members format: '" + s + "'";
                    return false;
                }
            }
            return true;
        }

    }
}