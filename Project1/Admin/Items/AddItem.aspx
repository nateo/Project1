<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AddItem.aspx.cs" Inherits="Project1.Admin.AddItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=PizzaEntities"
        ContextTypeName="Project1.DAL.PizzaEntities" EnableFlattening="False" EnableInsert="True"
        EntitySetName="Items">
    </asp:EntityDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False"
        DataKeyNames="ItemID" DataSourceID="EntityDataSource1" DefaultMode="Insert">
        <Fields>
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="BasePrice" HeaderText="BasePrice" SortExpression="BasePrice" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
</asp:Content>
