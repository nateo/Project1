<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="UpdateItemAttribute.aspx.cs" Inherits="Project1.Admin.ItemAttributes.AddItemAttribute" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--    <asp:EntityDataSource ID="edsAddItems" runat="server" ConnectionString="name=PizzaEntities"
        ContextTypeName="Project1.DAL.PizzaEntities" EnableFlattening="False" EnableInsert="True"
        EntitySetName="Items">
    </asp:EntityDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AllowPaging="True"
        AutoGenerateRows="False" DataKeyNames="ItemAttributeID" DataSourceID="edsAddItems"
        DefaultMode="Insert">
        <Fields>
            <asp:TemplateField HeaderText="Item">
                <InsertItemTemplate>
                    <asp:EntityDataSource ID="ItemsDataSource" runat="server" ConnectionString="name=PizzaEntities"
                        ContextTypeName="Project1.DAL.PizzaEntities" EnableFlattening="False" EnableInsert="True"
                        EntitySetName="Items">
                    </asp:EntityDataSource>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ItemsDataSource" DataTextField="Description" DataValueField="ItemID">
                    </asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="MarkupPercentage" HeaderText="MarkupPercentage" SortExpression="MarkupPercentage" />
            <asp:BoundField DataField="MarkupFlatRate" HeaderText="MarkupFlatRate" SortExpression="MarkupFlatRate" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>--%>
    <table>
        <tr>
            <td>
                Item:
            </td>
            <td>
                <asp:DropDownList ID="ddlItems" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Description:
            </td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                MarkupPercentage:
            </td>
            <td>
                <asp:TextBox ID="txtMarkupPercentage" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                MarkupFlatRate
            </td>
            <td>
                <asp:TextBox ID="txtMarkupFlatRate" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /><br />
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
</asp:Content>
