using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project1.Admin
{
    public partial class Items1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblAttributes.Visible = true;
            gvItemAttributes.Enabled = true;
            dvItemAttributes.Enabled = true;
            lblExtras.Visible = true;
            gvExtras.Enabled= true;
            dvExtras.Enabled = true;

            sdsItemAttributes.SelectParameters["ItemID"].DefaultValue = gvItems.SelectedValue.ToString();
            sdsExtras.SelectParameters["ItemID"].DefaultValue = gvItems.SelectedValue.ToString();

        }


    }
}