using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Project1.Admin.ItemAttributes
{
    public partial class AddItemAttribute : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                switch (Request.QueryString["action"])
                {
                    case "Add":
                        foreach (BO.Item item in BO.Item.Items())
                        {
                            this.ddlItems.Items.Add(item.Description);
                        }
                        break;
                    case "Edit":
                        ddlItems.Items.Clear();
                        foreach (BO.Item item in BO.Item.Items())
                        {
                            this.ddlItems.Items.Add(item.Description);
                        }
                        BO.ItemAttribute itemAttribute = BO.ItemAttribute.GetItemAttribute(Request.QueryString["ItemAttributeID"].ToString());
                        this.ddlItems.Text = itemAttribute.ItemDescription;
                        this.txtDescription.Text = itemAttribute.Description;
                        this.txtMarkupFlatRate.Text = itemAttribute.MarkupFlatRate;
                        this.txtMarkupPercentage.Text = itemAttribute.MarkupPertcentage;
                        //this.txtDescription = 
                        break;
                    case "Delete":
                        // to do
                        break;
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string storedProc = string.Empty;
            string action = Request.QueryString["action"];
            switch (action)
            {
                case "Add":
                    storedProc = "sp_AddItemAttribute";
                    break;
                case "Edit":
                    storedProc = "sp_EditItemAttribute";
                    break;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["Project1"].ToString();
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                using (SqlCommand myCommand = new SqlCommand(storedProc, myConnection))
                {
                    myCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    decimal markupPercentage = 0;
                    decimal markupFlatRate = 0;
                    decimal.TryParse(txtMarkupPercentage.Text, out markupPercentage);
                    decimal.TryParse(txtMarkupFlatRate.Text, out markupFlatRate);
                    myCommand.Parameters.AddWithValue("Description", txtDescription.Text);
                    myCommand.Parameters.AddWithValue("MarkupPercentage", markupPercentage);
                    myCommand.Parameters.AddWithValue("MarkupFlatRate", markupFlatRate);
                    myCommand.Parameters.AddWithValue("ItemID", BO.Item.GetItemID(ddlItems.Text));
                    switch (action)
                    {
                        case "Edit":
                            myCommand.Parameters.AddWithValue("ItemAttributeID", Request.QueryString["ItemAttributeID"]);
                            myCommand.ExecuteNonQuery();
                            lblStatus.Text = "Successfully updated";
                            break;
                        case "Add":
                            myCommand.ExecuteNonQuery();
                            lblStatus.Text = "Successfully added";
                            break;
                    }
                }
            }
        }
    }
}