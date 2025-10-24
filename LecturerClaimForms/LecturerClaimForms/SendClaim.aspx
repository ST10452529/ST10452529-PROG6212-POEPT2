<%@ Page Title="Send Claim" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SendClaim.aspx.cs" Inherits="LecturerClaimForms.SendClaim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5" style="max-width:600px;">
        <h2 class="text-center mb-4">Submit Monthly Claim</h2>

        <asp:Label ID="lblMessage" runat="server" ForeColor="Green" Font-Bold="True"></asp:Label>
        <br /><br />

        <div class="mb-3">
            <asp:Label Text="Lecturer Name:" runat="server" AssociatedControlID="txtLecturerName" />
            <asp:TextBox ID="txtLecturerName" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <asp:Label Text="Module Code:" runat="server" AssociatedControlID="txtModuleCode" />
            <asp:TextBox ID="txtModuleCode" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <asp:Label Text="Hours Worked:" runat="server" AssociatedControlID="txtHoursWorked" />
            <asp:TextBox ID="txtHoursWorked" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <asp:Label Text="Hourly Rate:" runat="server" AssociatedControlID="txtHourlyRate" />
            <asp:TextBox ID="txtHourlyRate" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <asp:Label Text="Date:" runat="server" AssociatedControlID="txtDate" />
            <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <asp:Label Text="Attach Document:" runat="server" AssociatedControlID="fileAttachment" />
            <asp:FileUpload ID="fileAttachment" runat="server" CssClass="form-control" />
        </div>

        <asp:Button ID="btnSubmit" runat="server" Text="Submit Claim" CssClass="btn btn-primary w-100" OnClick="btnSubmit_Click" />
    </div>
</asp:Content>
