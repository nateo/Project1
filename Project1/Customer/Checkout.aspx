<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Checkout.aspx.cs" Inherits="Project1.LoggedIn.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:RadioButtonList ID="rblPaymentMethod" runat="server" OnSelectedIndexChanged="rblPaymentMethod_SelectedIndexChanged"
        AutoPostBack="True">
        <asp:ListItem Value="Cash" Selected="True">Cash</asp:ListItem>
        <asp:ListItem Value="CreditCard">Credit Card</asp:ListItem>
    </asp:RadioButtonList>
    <asp:DropDownList ID="ddlCardType" runat="server" Enabled="False">
        <asp:ListItem Enabled="true" Text="Visa" Value="Visa"></asp:ListItem>
        <asp:ListItem Enabled="true" Text="MasterCard" Value="MasterCard"></asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="txtCreditCardNumber" runat="server" Enabled="False" Width="199px"></asp:TextBox><hr />
    <asp:RadioButtonList ID="rblDeliveryType" runat="server">
        <asp:ListItem>Delivery</asp:ListItem>
        <asp:ListItem>Pickup</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <asp:Button ID="btnConfirmOrder" runat="server" Text="Confirm Order" OnClick="btnConfirmOrder_Click" />
    <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
</asp:Content>
