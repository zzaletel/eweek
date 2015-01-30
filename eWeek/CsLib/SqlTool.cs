using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASPWenFormPractice1.CsLib
{
    public static class SqlTool
    {
        public static string GetConnectionString()
        {
            //sets the connection string from your web config file "ConnString" is the name of your Connection String
            return System.Configuration.ConfigurationManager.ConnectionStrings["eweekDb"].ConnectionString;
        }
    }
}