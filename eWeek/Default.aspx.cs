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
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Lable_intro.Style["font-weight"] = "bold";
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                this.Button_student_reg.Style["display"] = "";
                this.Lable_intro.Style["display"] = "none";
            }
            else
            {
                Response.Redirect("~/Account/Login");
            }
        }

        protected void Button_Student_reg(object sender, EventArgs e)
        {
            UaaEWeekDBController dbContrlr = new UaaEWeekDBController();
            this.Label_output.Text = dbContrlr.InsertRecord("INSERT INTO student (name, school, grade) VALUES " +
                   "('" + this.TextBox_name.Text + "','" + this.TextBox_school.Text + "','"
                   + this.DropDownList_Grade.Text + "');", this.TextBox_name.Text);
         
        }

  
    }

}