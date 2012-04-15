using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace Project1.Customer
{
    public partial class OrderFoodNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["OrderID"] == null)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["Project1"].ToString();
                using (SqlConnection myConnection = new SqlConnection(connectionString))
                {
                    myConnection.Open();
                    using (SqlCommand myCommand = new SqlCommand("sp_CreateOrder", myConnection))
                    {
                        myCommand.CommandType = System.Data.CommandType.StoredProcedure;
                        string customerID = BO.Customer.GetCustomer(Membership.GetUser().ProviderUserKey.ToString()).CustomerID;
                        myCommand.Parameters.AddWithValue("CustomerID", customerID);
                        Session["OrderID"] = myCommand.ExecuteScalar();
                    }
                }
            }
        }
    }
}