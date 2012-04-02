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
    public partial class MyAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MembershipUser currentUser = Membership.GetUser();
                string userID = currentUser.ProviderUserKey.ToString();
                Project1.BO.Customer customer = BO.Customer.GetCustomer(userID);
                if (customer != null)
                {
                    txtFirstName.Text = customer.FirstName;
                    txtLastName.Text = customer.LastName;
                    txtAddress1.Text = customer.Address1;
                    txtAddress2.Text = customer.Address2;
                    txtCity.Text = customer.City;
                    txtState.Text = customer.State;
                    txtZip.Text = customer.Zip;
                    txtPhoneNumber.Text = customer.PhoneNumber;
                    Session["UserID"] = customer.UserID;
                }
            }
        }


        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtAddress1.Text = string.Empty;
            txtAddress2.Text = string.Empty;
            txtCity.Text = string.Empty;
            txtState.Text = string.Empty;
            txtZip.Text = string.Empty;
            txtPhoneNumber.Text = string.Empty;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            string sql = string.Empty;

            if (Session["UserID"] == null)
            {

                BO.Customer customer = new BO.Customer(
                    txtFirstName.Text,
                    txtLastName.Text,
                    txtAddress1.Text,
                    txtAddress2.Text,
                    txtCity.Text,
                    txtState.Text,
                    txtZip.Text,
                    txtPhoneNumber.Text,
                    Membership.GetUser().ProviderUserKey.ToString()
                );

                if (BO.Customer.UpdateCustomer(customer, "sp_CreateCustomer", customer.UserID))
                {
                    lblConfirmation.Text = "Personal information updated";
                    Session["UserID"] = Membership.GetUser().ProviderUserKey.ToString();
                }
                else
                {
                    lblConfirmation.Text = "Error";
                }
            }
            else
            {
                BO.Customer customer = new BO.Customer(
                    txtFirstName.Text,
                    txtLastName.Text,
                    txtAddress1.Text,
                    txtAddress2.Text,
                    txtCity.Text,
                    txtState.Text,
                    txtZip.Text,
                    txtPhoneNumber.Text,
                    Membership.GetUser().ProviderUserKey.ToString()
                );

                if (BO.Customer.UpdateCustomer(customer, "sp_UpdateCustomer", customer.UserID))
                {
                    lblConfirmation.Text = "Personal information updated";
                }
                else
                {
                    lblConfirmation.Text = "Error";
                }
            }
        }


    }
}