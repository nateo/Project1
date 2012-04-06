using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Project1.BO
{
    public class OrderItem
    {
        internal static DataTable OrderItems(string orderID)
        {
            DataTable dt = new DataTable();
            string connectionString = ConfigurationManager.ConnectionStrings["Project1"].ToString();
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                using (SqlCommand myCommand = new SqlCommand("sp_OrderItems", myConnection))
                {
                    myCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    myCommand.Parameters.AddWithValue("@OrderID", orderID);
                    using (SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter(myCommand))
                    {
                        da.Fill(dt);
                    }
                }
            }
            return dt;
        }


    }
}