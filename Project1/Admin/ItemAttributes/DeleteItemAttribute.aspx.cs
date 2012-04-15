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
    public partial class EditItemAttribute : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnYes_Click1(object sender, EventArgs e)
        {
            int itemAttribute = 0;
            if (int.TryParse(Request.QueryString["ItemAttributeID"].ToString(), out itemAttribute))
            {

                string connectionString = ConfigurationManager.ConnectionStrings["Project1"].ToString();
                using (SqlConnection myConnection = new SqlConnection(connectionString))
                {
                    myConnection.Open();
                    using (SqlCommand myCommand = new SqlCommand("sp_DeleteItemAttribute", myConnection))
                    {
                        myCommand.CommandType = System.Data.CommandType.StoredProcedure;
                        myCommand.Parameters.AddWithValue("ItemAttributeID", itemAttribute);
                        myCommand.ExecuteNonQuery();
                    }
                }
            }
            lblResult.Text = "Deleted";
            Response.Redirect("ItemAttributes.aspx");
        }


    }
}