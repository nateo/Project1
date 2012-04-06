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
                "itemattribute.description, itemattribute.MarkupPercentage, itemattribute.MarkupFlatRate, itemattribute.ItemAttributeID" +
                " from Items, ItemAttribute where Items.ItemID = itemattribute.itemid order by ItemDescription, Description";
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
                "itemattribute.description, itemattribute.MarkupPercentage, itemattribute.MarkupFlatRate, itemattribute.ItemAttributeID" +
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
                            itemAttribute.Description = myDataReader["Description"].ToString();
                            itemAttribute.MarkupPertcentage = myDataReader["MarkupPercentage"].ToString();
                            itemAttribute.MarkupFlatRate = myDataReader["MarkupFlatRate"].ToString();
                            itemAttribute.ItemDescription = myDataReader["ItemDescription"].ToString();
                        }
                    }
                }
            }
            return itemAttribute;

        }
    }
}