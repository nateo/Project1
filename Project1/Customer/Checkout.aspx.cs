using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Project1.LoggedIn
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //CalculateOrder();
        }

        private void CalculateOrder()
        {
            string orderid = Session["OrderID"].ToString();

            string connectionString = ConfigurationManager.ConnectionStrings["Project1"].ToString();
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                
                using (SqlCommand myCommand = new SqlCommand("sp_GetOrderCost", myConnection))
                {
                    myCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    using (SqlDataReader myDataReader = myCommand.ExecuteReader())
                    {
                        if (myDataReader.Read())
                        {
                            //myDataReader["CustomerID"].ToString();
                        }
                    }
                }
            }
        }

        protected void rblPaymentMethod_SelectedIndexChanged(object sender, EventArgs e)
        {

            switch (rblPaymentMethod.SelectedValue)
            {

                case "Cash":
                    ddlCardType.Enabled = false;
                    txtCreditCardNumber.Enabled = false;
                    break;
                case "CreditCard":
                    ddlCardType.Enabled = true;
                    txtCreditCardNumber.Enabled = true;
                    break;
            }
        }

        protected void btnConfirmOrder_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Project1"].ToString();
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                using (SqlCommand myCommand = new SqlCommand("sp_Checkout", myConnection))
                {
                    myCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    myCommand.Parameters.AddWithValue("OrderID", Session["OrderID"].ToString());
                    myCommand.Parameters.AddWithValue("Paid", DetermineIfPaid());
                    myCommand.Parameters.AddWithValue("Pickup", GetDeliveryType());
                    myCommand.ExecuteNonQuery();
                }
            }
            lblResult.Text = "Order confirmed, you're order will be piping hot";
        }

        private int DetermineIfPaid()
        {
            int paid = 0;
            if (rblPaymentMethod.SelectedValue == "CreditCard")
                paid = 1;
            return paid;
        }

        private int GetDeliveryType()
        {
            int pickup = 0;
            if (rblDeliveryType.SelectedValue == "Pickup")
                pickup = 1;
            return pickup;
        }
    }
}