using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Project1.Admin.ItemAttributes
{
    public partial class EditItemAttributes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = BO.ItemAttribute.GetItemAttributes();
            lvItemAttributes.DataSource = dt;
            lvItemAttributes.DataBind();
        }
    }
}