using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

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
                    MySqlConnection mySqlConnection = new MySqlConnection(GetConnectionString());

                    string staSql = "INSERT INTO student_team_affiliation (team_id,student_id) VALUES ";

                    string getStudentNameSqlPre = "select name from student where student_id =";
                    string getIdQ = "SELECT LAST_INSERT_ID();";
                    string id = "";

                    string TeamMembers = this.TextTeamMembers.Text;
                    string[] words = TeamMembers.Split(',');
                    string allNames = "";
                    string getStudentNameSql = "";
                    int teamSize = words.Length;
                    int teamRep = Int32.Parse(words[0]);

                    MySqlCommand Command;
                    MySqlDataReader mySqlDataReader;
                    mySqlConnection.Open();

                    foreach (string s in words) //insert members to new team
                    {
                        getStudentNameSql = getStudentNameSqlPre + Int32.Parse(s) + ";";
                        Command = new MySqlCommand(getStudentNameSql, mySqlConnection);
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

                    Command = new MySqlCommand(teamSqlQuery, mySqlConnection);        
                    mySqlDataReader = Command.ExecuteReader();

                    while (mySqlDataReader.Read())
                    {
                    }
                    mySqlDataReader.Close();

                    Command = new MySqlCommand(getIdQ, mySqlConnection);
                    mySqlDataReader = Command.ExecuteReader();

                    while (mySqlDataReader.Read())
                    {
                        id = mySqlDataReader.GetString(0);  //get newly inserted team id
                    }
                    mySqlDataReader.Close();


                    foreach (string s in words) //insert members to new team
                    {
                        getStudentNameSql += Int32.Parse(s) + ";";
                        Command = new MySqlCommand(staSql + "('" + id + "','" + s + "');", mySqlConnection);
                        mySqlDataReader = Command.ExecuteReader();
                        mySqlDataReader.Close();
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

        public string GetConnectionString()
        {
            //sets the connection string from your web config file "ConnString" is the name of your Connection String
            return System.Configuration.ConfigurationManager.ConnectionStrings["eweekDb"].ConnectionString;
        }
    }
}