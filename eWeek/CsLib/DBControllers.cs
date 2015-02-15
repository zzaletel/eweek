using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace ASPWenFormPractice1.CsLib
{
    /// <summary>
    /// Database controller base class
    /// </summary>
    public class DBController
    {
        protected string sqlGetLastId = "SELECT SCOPE_IDENTITY();";
        public string cnnName = "DefaultConnection";

        public DBController() { }

        public string InsertRecord(string sqlStatement, string userName)
        {
            string id = "";
            try
            {
                using (SqlConnection sqlCnn = new SqlConnection(GetConnectionString(cnnName)))
                {
                    sqlCnn.Open();

                    //insert command
                    using (SqlCommand cmd = new SqlCommand(sqlStatement + sqlGetLastId, sqlCnn))
                    {
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                id = dr.GetDecimal(0).ToString();  //get newly inserted student id
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

            return "Registered! " + userName + ", your ID is " + id;
        }

        public static string GetConnectionString(string cnnName)
        {      
            //sets the connection string from your web config file "ConnString" is the name of your Connection String
            return ConfigurationManager.ConnectionStrings[cnnName].ConnectionString;
        }
    }

    /// <summary>
    /// UAA E-Week database controller
    /// </summary>
    public class UaaEWeekDBController : DBController
    {
        public UaaEWeekDBController() {
            this.cnnName = "eweekDb";
        }

        public bool isTeamId(string id, Label output)
        {
            int idValue;
            if (!Int32.TryParse(id, out idValue))
            {
                output.Text = "Invaild Id number!";
                return false;
            }
            return idValue>=5000;
        }

        public bool isStudentId(string id, Label output)
        {
            int idValue;
            if (!Int32.TryParse(id, out idValue))
            {
                output.Text = "Invaild Id number!";
                return false;
            }
            return idValue<5000;
        }

        /// <summary>
        /// get student info (name, school, size(1), grade)
        /// </summary>
        /// <param name="id"></param>
        /// <param name="output"></param>
        /// <returns></returns>
        public string[] getStudentInfoById(string id, Label output)
        {
            string[] toReturn = new string[4];
            string sqlQuery = "SELECT name, school, grade FROM student WHERE student_id =" + id + ";";
            try
            {
                using (SqlConnection sqlCnn = new SqlConnection(GetConnectionString(cnnName))){
                    using (SqlCommand cmd = new SqlCommand(sqlQuery, sqlCnn))
                    {
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                toReturn[0] = dr.GetString(0);    //name
                                toReturn[1] = dr.GetString(1);    //school
                                toReturn[3] = dr.GetString(2);    //grade
                            }
                        }
                    }
               }
            }
            catch (Exception ex)
            {
                output.Text = "Get Student Info Error: " + ex.Message;
            }

            toReturn[2] = "1"; //one person
            return toReturn;
        }

        /// <summary>
        /// get team info (names, school, size, grade)
        /// </summary>
        /// <param name="id"></param>
        /// <param name="output"></param>
        /// <returns></returns>
        public string[] getTeamInfoById(string id, Label output) 
        {
            string[] toReturn = new string[4];
            string studentRep = "";
            string sqlQuery = "select member_names, team_size, representative_id from team where team_id =" + id + ";";            
            try
            {
                using (SqlConnection sqlCnn = new SqlConnection(GetConnectionString(cnnName)))
                {
                    using (SqlCommand cmd = new SqlCommand(sqlQuery, sqlCnn))
                    {
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                toReturn[0] = dr.GetString(0);    // member names
                                toReturn[2] = dr.GetDecimal(1).ToString();   // team size
                                studentRep = dr.GetDecimal(2).ToString();  //  rep id
                            }
                        }
                    }
				
					string sqlQuery2 = "select school, grade from student where student_id =" + studentRep + ";";
					
                    using (SqlCommand cmd = new SqlCommand(sqlQuery2, sqlCnn))
                    {
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                toReturn[1] = dr.GetString(0);    // school
                                toReturn[3] = dr.GetString(1);    // grade
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                output.Text = "Get Team Info Error: " + ex.Message;
            }

            return toReturn;
        }
            
    }
}