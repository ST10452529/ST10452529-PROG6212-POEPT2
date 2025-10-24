<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="LecturerClaimForms.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5" style="max-width:600px;">
        <h2 class="text-center mb-4">Create New Account</h2>

        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

        <div class="mb-3">
            <asp:Label Text="Username:" runat="server" AssociatedControlID="txtUsername" />
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <asp:Label Text="Password:" runat="server" AssociatedControlID="txtPassword" />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <asp:Label Text="Confirm Password:" runat="server" AssociatedControlID="txtConfirmPassword" />
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <asp:Label Text="Role:" runat="server" AssociatedControlID="ddlRole" />
            <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-select">
                <asp:ListItem Text="Select Role" Value="" />
                <asp:ListItem Text="Lecturer" Value="Lecturer" />
                <asp:ListItem Text="Manager" Value="Manager" />
            </asp:DropDownList>
        </div>

        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success w-100" OnClick="btnRegister_Click" />
        <p class="mt-3 text-center">
            Already have an account? <a runat="server" href="~/Login.aspx">Login here</a>
        </p>
    </div>
</asp:Content>
