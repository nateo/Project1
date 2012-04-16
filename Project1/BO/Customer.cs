using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;


namespace Project1.BO
{
    public class Customer
    {

        internal string FirstName;
        internal string LastName;
        internal string Address1;
        internal string Address2;
        internal string City;
        internal string State;
        internal string Zip;
        internal string PhoneNumber;
        internal string UserID;
        internal string CustomerID;

        public Customer()
        { }


        public Customer(
            string firstName,
            string lastName,
            string address1,
            string address2,
            string city,
            string state,
            string zip,
            string phoneNumber,
            string userID,
            string customerID)
        {
            this.FirstName = firstName;
            this.LastName = lastName;
            this.Address1 = address1;
            this.Address2 = address2;
            this.City = city;
            this.State = state;
            this.Zip = zip;
            this.PhoneNumber = phoneNumber;
            this.UserID = userID;
            this.CustomerID = customerID;
        }


        internal static Project1.BO.Customer GetCustomer(string userName)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Project1"].ToString();
            string sql = "select * from customers where username = '" + userName + "'";
            Project1.BO.Customer customer = new Customer();
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                using (SqlCommand myCommand = new SqlCommand(sql, myConnection))
                {
                    using (SqlDataReader myDataReader = myCommand.ExecuteReader())
                    {
                        if (myDataReader.Read())
                        {
                            customer = new BO.Customer(
                                myDataReader["FirstName"].ToString(),
                                myDataReader["LastName"].ToString(),
                                myDataReader["Address1"].ToString(),
                                myDataReader["Address2"].ToString(),
                                myDataReader["City"].ToString(),
                                myDataReader["State"].ToString(),
                                myDataReader["Zip"].ToString(),
                                myDataReader["PhoneNumber"].ToString(),
                                myDataReader["UserName"].ToString(),
                                myDataReader["CustomerID"].ToString());
                        }
                    }
                }
            }
            return customer;
        }

        internal static bool CustomerExists(string userName)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Project1"].ToString();
            string sql = "select * from customers where username = '" + userName + "'";
            bool customerExists = false;
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                using (SqlCommand myCommand = new SqlCommand(sql, myConnection))
                {
                    using (SqlDataReader myDataReader = myCommand.ExecuteReader())
                    {
                        if (myDataReader.Read())
                        {
                            customerExists = true;
                        }
                    }
                }
            }
            return customerExists;
        }


        internal static void InsertCustomer(string userID)
        {
            //bool result = false;
            string connectionString = ConfigurationManager.ConnectionStrings["Project1"].ToString();
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                using (SqlCommand myCommand = new SqlCommand("sp_CreateCustomer", myConnection))
                {
                    myCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    myCommand.Parameters.AddWithValue("UserName", Membership.GetUser().UserName.ToString());
                    myCommand.ExecuteNonQuery();
                }
            }
        }


    }

}