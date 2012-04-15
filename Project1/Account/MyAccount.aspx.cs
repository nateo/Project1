using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;


namespace Project1.Account
{
    public partial class MyAccountNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!BO.Customer.CustomerExists(Membership.GetUser().UserName.ToString()))
            {
                BO.Customer.InsertCustomer(Membership.GetUser().UserName.ToString());
            }

        }

        protected void Page_Init(object sender, EventArgs e)
        {
            sdsCustomer.SelectParameters["UserName"].DefaultValue = Membership.GetUser().UserName.ToString();
            sdsCustomer.UpdateParameters["UserName"].DefaultValue = Membership.GetUser().UserName.ToString();
            sdsCustomer.UpdateParameters["original_UserName"].DefaultValue = Membership.GetUser().UserName.ToString();
        }


    }
}