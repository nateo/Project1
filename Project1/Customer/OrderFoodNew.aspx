<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="OrderFoodNew.aspx.cs" Inherits="Project1.Customer.OrderFoodNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    Items:
    <asp:DropDownList ID="ddlItems" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlItems_SelectedIndexChanged">
    </asp:DropDownList>
    Item Options:
    <asp:DropDownList ID="ddlItemAttributes" runat="server">
    </asp:DropDownList>
    Quantity:
    <asp:TextBox ID="txtQuantity" runat="server" Width="30px"></asp:TextBox>
    <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" OnClick="btnAddToCart_Click" />
    <hr />
    <br />
    <asp:Label ID="lblOrderItems" runat="server" Text="Label" Visible="False">Order Items:</asp:Label>
    <asp:GridView ID="gvOrderItems" runat="server" DataSourceID="sdsOrderItems" AutoGenerateColumns="False"
        AllowPaging="True" DataKeyNames="OrderItemID,ItemID" OnSelectedIndexChanged="gvOrderItems_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="Select for options" ShowDeleteButton="True" />
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID"
                Visible="False" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
        </Columns>
    </asp:GridView>
    <hr />
    <asp:Label ID="lblAddExtra" runat="server" Text="Add option:" Visible="False"></asp:Label>
    <asp:DropDownList ID="ddlExtras" runat="server">
    </asp:DropDownList>
    <asp:Button ID="btnAddExtra" runat="server" Text="Add" OnClick="btnAddExtra_Click" />
    <hr />
    <asp:Label ID="lblExtras" runat="server" Text="Item Extras:" Visible="False"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="OrderItemExtraID" DataSourceID="sdsOrderItemExtras">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="OrderItemExtraID" HeaderText="OrderItemExtraID" 
                InsertVisible="False" ReadOnly="True" SortExpression="OrderItemExtraID" />
            <asp:BoundField DataField="ExtraID" HeaderText="ExtraID" 
                SortExpression="ExtraID" />
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" 
                SortExpression="OrderID" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsExtras" runat="server" ConnectionString="<%$ ConnectionStrings:Project1 %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT DISTINCT * FROM [Extras]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsOrderItems" runat="server" ConnectionString="<%$ ConnectionStrings:Project1 %>"
        SelectCommand="SELECT dbo.OrderItems.OrderID, dbo.OrderItems.Quantity, dbo.OrderItems.OrderItemID, dbo.Items.Description, dbo.OrderItems.ItemID
                        FROM dbo.OrderItems INNER JOIN
                        dbo.Items ON dbo.OrderItems.ItemID = dbo.Items.ItemID
                        where OrderItems.OrderID = @OrderID" DeleteCommand="DELETE FROM OrderItems where OrderItemID = @OrderItemID">
        <DeleteParameters>
            <asp:Parameter Name="OrderItemID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:Parameter Name="OrderID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsItems" runat="server" ConnectionString="<%$ ConnectionStrings:Project1 %>"
        SelectCommand="select description, ItemID from Items"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsOrderItemExtras" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:Project1 %>" 
        DeleteCommand="DELETE FROM [OrderItemExtras] WHERE [OrderItemExtraID] = @original_OrderItemExtraID AND [ExtraID] = @original_ExtraID AND (([OrderID] = @original_OrderID) OR ([OrderID] IS NULL AND @original_OrderID IS NULL))" 
        InsertCommand="INSERT INTO [OrderItemExtras] ([ExtraID], [OrderID]) VALUES (@ExtraID, @OrderID)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [OrderItemExtras] where OrderID = @OrderID" 
        UpdateCommand="UPDATE [OrderItemExtras] SET [ExtraID] = @ExtraID, [OrderID] = @OrderID WHERE [OrderItemExtraID] = @original_OrderItemExtraID AND [ExtraID] = @original_ExtraID AND (([OrderID] = @original_OrderID) OR ([OrderID] IS NULL AND @original_OrderID IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_OrderItemExtraID" Type="Int32" />
            <asp:Parameter Name="original_ExtraID" Type="Int32" />
            <asp:Parameter Name="original_OrderID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ExtraID" Type="Int32" />
            <asp:Parameter Name="OrderID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="OrderID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ExtraID" Type="Int32" />
            <asp:Parameter Name="OrderID" Type="Int32" />
            <asp:Parameter Name="original_OrderItemExtraID" Type="Int32" />
            <asp:Parameter Name="original_ExtraID" Type="Int32" />
            <asp:Parameter Name="original_OrderID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>
