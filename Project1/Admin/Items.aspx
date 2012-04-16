<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Items.aspx.cs" Inherits="Project1.Admin.Items1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DetailsView ID="dvItems" runat="server" Height="50px" Width="125px" AutoGenerateRows="False"
        DataKeyNames="ItemID" DataSourceID="sdsItems" DefaultMode="Insert" HeaderText="Insert new item">
        <Fields>
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" InsertVisible="False"
                ReadOnly="True" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:BoundField DataField="BasePrice" HeaderText="BasePrice" SortExpression="BasePrice" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsItems" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:Project1 %>" DeleteCommand="DELETE FROM [Items] WHERE [ItemID] = @original_ItemID"
        InsertCommand="INSERT INTO [Items] ([Description], [BasePrice]) VALUES (@Description, @BasePrice)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Items]"
        UpdateCommand="UPDATE [Items] SET [Description] = @Description, [BasePrice] = @BasePrice WHERE [ItemID] = @original_ItemID ">
        <DeleteParameters>
            <asp:Parameter Name="original_ItemID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="BasePrice" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="BasePrice" Type="Decimal" />
            <asp:Parameter Name="original_ItemID" Type="Int32" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_BasePrice" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    Items:
    <asp:GridView ID="gvItems" runat="server" AllowPaging="True" DataSourceID="sdsItems"
        AutoGenerateColumns="False" DataKeyNames="ItemID" OnSelectedIndexChanged="gvItems_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" Visible="False" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="BasePrice" HeaderText="BasePrice" SortExpression="BasePrice"
                DataFormatString="{0:C2}" />
        </Columns>
        <SelectedRowStyle BackColor="LightGray" />
    </asp:GridView>
    <br />
    <hr />
    <br />
    <asp:DetailsView ID="dvExtras" runat="server" Height="50px" Width="125px" AutoGenerateRows="False"
        DataKeyNames="ExtraID" DataSourceID="sdsExtras" DefaultMode="Insert"
        HeaderText="Insert Extra" Enabled="False">
        <Fields>
            <asp:BoundField DataField="ExtraID" HeaderText="ExtraID" InsertVisible="False" ReadOnly="True"
                SortExpression="ExtraID" Visible="False" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" Visible="False" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <br />
    <asp:Label ID="lblExtras" runat="server" Text="Label" Visible="false">Extras:</asp:Label>
    <asp:GridView ID="gvExtras" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        DataKeyNames="ExtraID" DataSourceID="sdsExtras" Enabled="False">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ExtraID" HeaderText="ExtraID" InsertVisible="False" ReadOnly="True"
                SortExpression="ExtraID" Visible="False" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Cost" DataFormatString="{0:C2}" HeaderText="Cost" SortExpression="Cost" />
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" Visible="False" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsExtras" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:Project1 %>" DeleteCommand="DELETE FROM [Extras] WHERE [ExtraID] = @original_ExtraID "
        InsertCommand="INSERT INTO [Extras] ([Description], [Cost], [ItemID]) VALUES (@Description, @Cost, @ItemID)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT ExtraID, Description, Cost, ItemID FROM Extras WHERE (ItemID = @ItemID)"
        UpdateCommand="UPDATE [Extras] SET [Description] = @Description, [Cost] = @Cost, [ItemID] = @ItemID WHERE [ExtraID] = @original_ExtraID">
        <DeleteParameters>
            <asp:Parameter Name="original_ExtraID" Type="Int32" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Cost" Type="Decimal" />
            <asp:Parameter Name="original_ItemID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Cost" Type="Decimal" />
            <asp:ControlParameter ControlID="gvItems" Name="ItemID" PropertyName="SelectedValue"
                Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="ItemID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Cost" Type="Decimal" />
            <asp:ControlParameter ControlID="gvItems" Name="ItemID" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:Parameter Name="original_ExtraID" Type="Int32" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Cost" Type="Decimal" />
            <asp:Parameter Name="original_ItemID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <hr />
    <br />
    <asp:DetailsView ID="dvItemAttributes" runat="server" AutoGenerateRows="False" DataKeyNames="ItemAttributeID"
        DataSourceID="sdsItemAttributes" Height="50px" Width="125px" DefaultMode="Insert"
        Enabled="False" HeaderText="Insert Item Attribute">
        <Fields>
            <asp:BoundField DataField="ItemAttributeID" HeaderText="ItemAttributeID" InsertVisible="False"
                ReadOnly="True" SortExpression="ItemAttributeID" Visible="False" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" Visible="False" />
            <asp:BoundField DataField="MarkupPercentage" HeaderText="MarkupPercentage" SortExpression="MarkupPercentage" />
            <asp:BoundField DataField="MarkupFlatRate" HeaderText="MarkupFlatRate" SortExpression="MarkupFlatRate" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <br />
    <asp:Label ID="lblAttributes" runat="server" Text="Label" Visible="false">Item Attributes:</asp:Label>
    <asp:GridView ID="gvItemAttributes" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        DataSourceID="sdsItemAttributes" DataKeyNames="ItemAttributeID" Enabled="False">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ItemAttributeID" HeaderText="ItemAttributeID" InsertVisible="False"
                ReadOnly="True" SortExpression="ItemAttributeID" Visible="False" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" Visible="False" />
            <asp:BoundField DataField="MarkupPercentage" HeaderText="MarkupPercentage" SortExpression="MarkupPercentage"
                DataFormatString="{0:F2}" />
            <asp:BoundField DataField="MarkupFlatRate" HeaderText="MarkupFlatRate" SortExpression="MarkupFlatRate"
                DataFormatString="{0:C2}" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsItemAttributes" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:Project1 %>" DeleteCommand="DELETE FROM [ItemAttribute] WHERE [ItemAttributeID] = @original_ItemAttributeID "
        InsertCommand="INSERT INTO [ItemAttribute] ([Description], [ItemID], [MarkupPercentage], [MarkupFlatRate]) VALUES (@Description, @ItemID, @MarkupPercentage, @MarkupFlatRate)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT ItemAttributeID, Description, ItemID, MarkupPercentage, MarkupFlatRate, markupflatrate FROM ItemAttribute WHERE (ItemID = @ItemID)"
        UpdateCommand="UPDATE [ItemAttribute] SET [Description] = @Description, [ItemID] = @ItemID, [MarkupPercentage] = @MarkupPercentage, [MarkupFlatRate] = @MarkupFlatRate WHERE [ItemAttributeID] = @original_ItemAttributeID">
        <DeleteParameters>
            <asp:Parameter Name="original_ItemAttributeID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:ControlParameter ControlID="gvItems" Name="ItemID" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:Parameter Name="MarkupPercentage" Type="Decimal" />
            <asp:Parameter Name="MarkupFlatRate" Type="Decimal" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="ItemID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:ControlParameter ControlID="gvItems" Name="ItemID" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:Parameter Name="MarkupPercentage" Type="Decimal" />
            <asp:Parameter Name="MarkupFlatRate" Type="Decimal" />
            <asp:Parameter Name="original_ItemAttributeID" Type="Int32" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_ItemID" Type="Int32" />
            <asp:Parameter Name="original_MarkupPercentage" Type="Decimal" />
            <asp:Parameter Name="original_MarkupFlatRate" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
