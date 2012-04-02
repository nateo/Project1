using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

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
            string userID = "")
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
        }

        internal static bool UpdateCustomer(Customer customer, string spName, string userID)
        {
            bool result = false;
            string connectionString = ConfigurationManager.ConnectionStrings["Project1"].ToString();
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                using (SqlCommand myCommand = new SqlCommand(spName, myConnection))
                {
                    myCommand.CommandType = System.Data.CommandType.StoredProcedure;

                    myCommand.Parameters.AddWithValue("FirstName", customer.FirstName);
                    myCommand.Parameters.AddWithValue("LastName", customer.LastName);
                    myCommand.Parameters.AddWithValue("Address1", customer.Address1);
                    myCommand.Parameters.AddWithValue("Address2", customer.Address2);
                    myCommand.Parameters.AddWithValue("City", customer.City);
                    myCommand.Parameters.AddWithValue("State", customer.State);
                    myCommand.Parameters.AddWithValue("Zip", customer.Zip);
                    myCommand.Parameters.AddWithValue("PhoneNumber", customer.PhoneNumber);
                    myCommand.Parameters.AddWithValue("UserID", customer.UserID);

                    myCommand.ExecuteNonQuery();
                    result = true;

                }
            }
            return result;
        }


    }

}