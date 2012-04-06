using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace Project1.BO
{
    public class Item
    {
        internal int ItemID;
        internal string Description;
        internal decimal BasePrice;

        public Item() { }

        public Item(int itemID, string description, decimal basePrice)
        {
            this.ItemID = itemID;
            this.Description = description;
            this.BasePrice = basePrice;
        }


        internal static int GetItemID(string itemDescription)
        {
            int itemID = 0;
            string connectionString = ConfigurationManager.ConnectionStrings["Project1"].ToString();
            string sql = "select * from Items where Description = '" + itemDescription + "'";
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                using (SqlCommand myCommand = new SqlCommand(sql, myConnection))
                {
                    using (SqlDataReader myDataReader = myCommand.ExecuteReader())
                    {
                        if (myDataReader.Read())
                        {
                            Int32.TryParse(myDataReader["ItemID"].ToString(), out itemID);
                        }
                    }
                }
            }
            return itemID;
        }

        internal static List<Item> GetItems()
        {
            List<Item> items = new List<Item>();
            string connectionString = ConfigurationManager.ConnectionStrings["Project1"].ToString();
            string sql = "select * from Items";
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                using (SqlCommand myCommand = new SqlCommand(sql, myConnection))
                {
                    using (SqlDataReader myDataReader = myCommand.ExecuteReader())
                    {
                        if (myDataReader.Read())
                        {
                            //Int32.TryParse(myDataReader["ItemID"].ToString(), out itemID);
                            items.Add(new Item(
                                Convert.ToInt16(myDataReader["ItemID"].ToString()),
                                myDataReader["Description"].ToString(),
                                Convert.ToDecimal(myDataReader["BasePrice"].ToString())
                            ));
                        }
                    }
                }
            }
            return items;
        }
    }
}