using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;

namespace Project1.Customer
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlItems.Items.Add("");
                foreach (BO.Item item in BO.Item.GetItems())
                {
                    this.ddlItems.Items.Add(item.Description);
                }
                ddlItems.Text = ddlItems.Items[1].Text;
                ddlItemOptions.Items.Add("");
                //foreach (string itemOption in BO.ItemAttribute.GetItemAttributes(ddlItems.Text))
                //{
                //    this.ddlItemOptions.Items.Add(itemOption);
                //}
                ddlItemOptions.Text = "";
            }
            if (Session["OrderID"] != null)
            {
                DataTable dt = BO.OrderItem.OrderItems(Session["OrderID"].ToString());
                lvOrderItems.DataSource = dt;
                lvOrderItems.DataBind();
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            // Credte Order ID
            //string connectionString = ConfigurationManager.ConnectionStrings["Project1"].ToString();
            //if (Session["OrderID"] == null)
            //{
            //    using (SqlConnection myConnection = new SqlConnection(connectionString))
            //    {
            //        myConnection.Open();
            //        using (SqlCommand myCommand = new SqlCommand("sp_CreateOrder", myConnection))
            //        {
            //            myCommand.CommandType = System.Data.CommandType.StoredProcedure;
            //            //string customerID =  BO.Customer.GetCustomer(Membership.GetUser().ProviderUserKey.ToString()).CustomerID;
            //            myCommand.Parameters.AddWithValue("CustomerID", customerID);
            //            Session["OrderID"] = myCommand.ExecuteScalar();
            //        }
            //    }
            //}
            // Add Items
            //using (SqlConnection myConnection = new SqlConnection(connectionString))
            //{
            //    myConnection.Open();
            //    using (SqlCommand myCommand = new SqlCommand("sp_AddItemToCart", myConnection))
            //    {
            //        myCommand.CommandType = System.Data.CommandType.StoredProcedure;
            //        myCommand.Parameters.AddWithValue("OrderID", Session["OrderID"]);
            //        myCommand.Parameters.AddWithValue("@ItemAttributeID", BO.ItemAttribute.GetItemAttributeID(
            //            ddlItemOptions.Text));
            //        myCommand.Parameters.AddWithValue("@Quantity", txtQuantity.Text);
            //        myCommand.ExecuteNonQuery();
            //    }
            //}
            //Response.Redirect("OrderFood.aspx");
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx");
        }
    }
}