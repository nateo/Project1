<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="MyAccount.aspx.cs" Inherits="Project1.Account.MyAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table>
        <tr>
            <td>
                First Name:
            </td>
            <td>
                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Last Name:
            </td>
            <td>
                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Address1:
            </td>
            <td>
                <asp:TextBox ID="txtAddress1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Address2:
            </td>
            <td>
                <asp:TextBox ID="txtAddress2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                City:
            </td>
            <td>
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                State:
            </td>
            <td>
                <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Zip:
            </td>
            <td>
                <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Phone Number:
            </td>
            <td>
                <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblConfirmation" runat="server" Text="" ForeColor="Red"></asp:Label><br />
    <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
</asp:Content>
