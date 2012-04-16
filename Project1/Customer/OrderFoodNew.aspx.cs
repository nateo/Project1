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
                        string customerID = BO.Customer.GetCustomer(Membership.GetUser().UserName).CustomerID;
                        myCommand.Parameters.AddWithValue("CustomerID", customerID);
                        Session["OrderID"] = myCommand.ExecuteScalar();
                    }
                }

            }
            if (!IsPostBack)
            {
                ddlItems.Items.Add("");
                foreach (BO.Item item in BO.Item.GetItems())
                {
                    ListItem listItem = new ListItem();
                    listItem.Value = item.ItemID.ToString();
                    listItem.Text = item.Description + " : " + item.BasePrice.ToString("c");
                    this.ddlItems.Items.Add(listItem);
                }
                ddlItems.Text = ddlItems.Items[1].Text;
                ddlItems.SelectedValue = ddlItems.Items[1].Value.ToString();
                ddlItemAttributes.Items.Add("");
                foreach (BO.ItemAttribute itemAttribute in BO.ItemAttribute.GetItemAttributes(ddlItems.SelectedValue.ToString()))
                {
                    ListItem listItem = new ListItem();
                    listItem.Text = itemAttribute.Description;
                    listItem.Value = itemAttribute.ItemAttributeID;
                    this.ddlItemAttributes.Items.Add(listItem);
                }
                ddlItemAttributes.Text = "";
                sdsOrderItems.SelectParameters["OrderID"].DefaultValue = Session["OrderID"].ToString();
                sdsOrderItemExtras.SelectParameters["OrderID"].DefaultValue = Session["OrderID"].ToString();
                sdsOrderItems.DataBind();
                sdsOrderItemExtras.DataBind();
                //sdsOrderItems.SelectParameters["OrderID"].DefaultValue = "54";
            }



        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Project1"].ToString();
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                using (SqlCommand myCommand = new SqlCommand("sp_AddItemToCart", myConnection))
                {
                    myCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    myCommand.Parameters.AddWithValue("@OrderID", Session["OrderID"]);
                    myCommand.Parameters.AddWithValue("@ItemAttributeID", ddlItemAttributes.Text);
                    myCommand.Parameters.AddWithValue("@Quantity", txtQuantity.Text);
                    myCommand.Parameters.AddWithValue("@ItemID", ddlItems.SelectedValue.ToString());
                    myCommand.ExecuteNonQuery();
                    lblOrderItems.Visible = true;
                }
            }
            gvOrderItems.DataBind();
        }

        protected void ddlItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlItemAttributes.Items.Clear();
            ddlItemAttributes.Items.Add("");
            foreach (BO.ItemAttribute itemAttribute in BO.ItemAttribute.GetItemAttributes(ddlItems.Text))
            {
                ListItem listItem = new ListItem();
                listItem.Text = itemAttribute.Description;
                listItem.Value = itemAttribute.ItemAttributeID;
                this.ddlItemAttributes.Items.Add(listItem);
            }
        }

        protected void gvOrderItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblExtras.Visible = true;
            lblAddExtra.Visible = true;
            ddlExtras.Items.Clear();
            foreach (BO.Extra extra in BO.Extra.Extras(gvOrderItems.DataKeys[gvOrderItems.SelectedIndex].Values["ItemID"].ToString()))
            {
                ListItem listItem = new ListItem();
                listItem.Text = extra.Description + "  :  " + extra.Cost.ToString("c");
                listItem.Value = extra.ExtraID;
                ddlExtras.Items.Add(listItem);
            }
            sdsOrderItemExtras.SelectParameters["OrderID"].DefaultValue = Session["OrderID"].ToString();
            sdsOrderItemExtras.DataBind();
        }

        protected void btnAddExtra_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Project1"].ToString();
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                using (SqlCommand myCommand = new SqlCommand("sp_AddExtra", myConnection))
                {
                    myCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    myCommand.Parameters.AddWithValue("@OrderID", Session["OrderID"]);
                    myCommand.Parameters.AddWithValue("@ExtraID", ddlExtras.Text);
                    myCommand.ExecuteNonQuery();
                    lblExtras.Visible = true;
                }
            }
            sdsOrderItemExtras.DataBind();
        }






    }
}