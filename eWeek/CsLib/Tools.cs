using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASPWenFormPractice1.CsLib
{
    public static class Tools
    {

        public static string getDuration(string start, string end)
        {
            if (!start.Contains(":") || !end.Contains(":"))
            {
                return "invalid input: missing ':'";
            }
            string toReturn = "N/A";
            string[] startTokens = start.Split(':');
            string[] endTokens = end.Split(':');

            int startToken0 = 0;
            int startToken1 = 0;
            int endToken0 = 0;
            int endToken1 = 0;

            if (!Int32.TryParse(startTokens[0], out startToken0))
            { return "invalid input"; }
            if (!Int32.TryParse(startTokens[1], out startToken1))
            { return "invalid input"; }
            if (!Int32.TryParse(endTokens[0], out endToken0))
            { return "invalid input"; }
            if (!Int32.TryParse(endTokens[1], out endToken1))
            { return "invalid input"; }

            toReturn = (endToken1 - startToken1 < 0) ?
            (endToken0 - startToken0 - 1).ToString() + ":" + (endToken1 - startToken1 + 60).ToString() :
            (endToken0 - startToken0).ToString() + ":" + (endToken1 - startToken1).ToString();

            return toReturn;
        }

        public static string getConcatenatedString(string[] val)
        {
            string toReturn = "";
            foreach (string token in val)
            {
                toReturn += token+",";
            }
            return toReturn;
        }

        public static string getSum(string a, string b) {
            double aD = 0;
            double bD = 0;
            if (!Double.TryParse(a, out aD)) {
                return "not a vaild number";
            }
            if (!Double.TryParse(b, out bD)) {
                return "not a vaild number";
            }
            return (aD + bD).ToString();
        }

        public static double getMinutes(string val) {
            if (!val.Contains(":"))
            {
                return 999999;
            }
            double toReturn = 0;
            string[] tokens = val.Split(':');
            toReturn = Double.Parse(tokens[0]) * 60 + Double.Parse(tokens[1]);
            return toReturn;
        }

    }
}