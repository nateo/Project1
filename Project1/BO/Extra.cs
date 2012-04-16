using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace Project1.BO
{
    public class Extra
    {
        internal string ExtraID;
        internal string Description;
        internal decimal Cost;
        internal string ItemID;

        public Extra(string extraID, string description, decimal cost, string itemID)
        {
            this.ExtraID = extraID;
            this.Description = description;
            this.Cost = cost;
            this.ItemID = itemID;
        }

        internal static IEnumerable<Extra> Extras(string itemID)
        {
            List<Extra> extras = new List<Extra>();

            string connectionString = ConfigurationManager.ConnectionStrings["Project1"].ToString();
            string sql = "select * from Extras where ItemID = " + itemID.ToString();
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                using (SqlCommand myCommand = new SqlCommand(sql, myConnection))
                {
                    using (SqlDataReader myDataReader = myCommand.ExecuteReader())
                    {
                        while (myDataReader.Read())
                        {
                            extras.Add(new Extra(
                                myDataReader["ExtraID"].ToString(),
                                myDataReader["Description"].ToString(),
                                Convert.ToDecimal(myDataReader["Cost"].ToString()),
                                myDataReader["ItemID"].ToString()
                            ));
                        }
                    }
                }
            }
            return extras;
        }
    }
}