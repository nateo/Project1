using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Project1.BO
{
    public class ItemAttribute
    {

        internal string Description;
        internal string MarkupPertcentage;
        internal string MarkupFlatRate;
        internal string ItemDescription;

        public ItemAttribute() { }

        public ItemAttribute(string description, string markupPertcentage, string markupFlatRate, string itemDescription)
        {
            this.Description = description;
            this.MarkupPertcentage = markupPertcentage;
            this.MarkupFlatRate = markupFlatRate;
            this.ItemDescription = itemDescription;
        }


        internal static DataTable GetItemAttributes()
        {
            DataTable dt = new DataTable();
            string connectionString = ConfigurationManager.ConnectionStrings["Project1"].ToString();
            string sql = "select items.description as ItemDescription, " +
                "itemattribute.Description as ItemAttributeDescription, itemattribute.MarkupPercentage, itemattribute.MarkupFlatRate, itemattribute.ItemAttributeID" +
                " from Items, ItemAttribute where Items.ItemID = itemattribute.itemid order by ItemDescription, ItemAttributeDescription";
            List<ItemAttribute> itemAttributes = new List<ItemAttribute>();
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                using (SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter(sql, connectionString))
                {
                    da.Fill(dt);
                }
            }
            return dt;
        }

        internal static ItemAttribute GetItemAttribute(string itemAttributeID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Project1"].ToString();
            string sql = "select items.description as ItemDescription, " +
                "itemattribute.description as ItemAttributeDescription, itemattribute.MarkupPercentage, itemattribute.MarkupFlatRate, itemattribute.ItemAttributeID" +
                " from Items, ItemAttribute where Items.ItemID = itemattribute.itemid and ItemAttribute.ItemAttributeID = " + itemAttributeID;
            ItemAttribute itemAttribute = new ItemAttribute();
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                using (SqlCommand myCommand = new SqlCommand(sql, myConnection))
                {
                    using (SqlDataReader myDataReader = myCommand.ExecuteReader())
                    {
                        if (myDataReader.Read())
                        {
                            itemAttribute.Description = myDataReader["ItemAttributeDescription"].ToString();
                            itemAttribute.MarkupPertcentage = myDataReader["MarkupPercentage"].ToString();
                            itemAttribute.MarkupFlatRate = myDataReader["MarkupFlatRate"].ToString();
                            itemAttribute.ItemDescription = myDataReader["ItemDescription"].ToString();
                        }
                    }
                }
            }
            return itemAttribute;
        }

        internal static IEnumerable<string> GetItemOptions(string itemID)
        {
            List<string> itemAttributes = new List<string>();
            string connectionString = ConfigurationManager.ConnectionStrings["Project1"].ToString();
            string sql = "select Description as ItemAttributeDescription" +
                " from ItemAttribute where ItemID = " + itemID;
            ItemAttribute itemAttribute = new ItemAttribute();
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                using (SqlCommand myCommand = new SqlCommand(sql, myConnection))
                {
                    using (SqlDataReader myDataReader = myCommand.ExecuteReader())
                    {
                        while (myDataReader.Read())
                        {
                            itemAttributes.Add(myDataReader["ItemAttributeDescription"].ToString());
                        }
                    }
                }
            }
            return itemAttributes;
        }

        internal static int GetItemAttributeID(string description)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Project1"].ToString();
            string sql = "select ItemAttributeID from ItemAttribute  where Description = '" + description + "'";
            int itemAttributeID = 0;
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                using (SqlCommand myCommand = new SqlCommand(sql, myConnection))
                {
                    using (SqlDataReader myDataReader = myCommand.ExecuteReader())
                    {
                        if (myDataReader.Read())
                        {
                            itemAttributeID = Convert.ToInt16(myDataReader["ItemAttributeID"].ToString());
                        }
                    }
                }
            }
            return itemAttributeID;            
        }
    }
}