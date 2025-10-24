<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LecturerClaimForms.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5" style="max-width:500px;">
        <h2 class="text-center">Login</h2>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

        <div class="mb-3">
            <asp:Label Text="Username:" runat="server" AssociatedControlID="txtUsername" />
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <asp:Label Text="Password:" runat="server" AssociatedControlID="txtPassword" />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
        </div>

        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary w-100" OnClick="btnLogin_Click" />
    </div>
</asp:Content>
