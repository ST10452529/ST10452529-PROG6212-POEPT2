<%@ Page Title="Track Claims" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TrackClaim.aspx.cs" Inherits="LecturerClaimForms.TrackClaim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center">📋 Track Your Claims</h2>
    <p class="text-muted text-center">Below are your submitted claims and their approval statuses.</p>
    <hr />

    <asp:Label ID="lblMessage" runat="server" ForeColor="Green" CssClass="fw-bold"></asp:Label>

    <asp:GridView 
        ID="gvClaims" 
        runat="server" 
        AutoGenerateColumns="False" 
        CssClass="table table-hover table-striped text-center mt-3"
        EmptyDataText="No claims submitted yet.">
        
        <Columns>
            <asp:BoundField DataField="ClaimID" HeaderText="Claim ID" />
            <asp:BoundField DataField="LecturerName" HeaderText="Lecturer" />
            <asp:BoundField DataField="ModuleCode" HeaderText="Module Code" />
            <asp:BoundField DataField="HoursWorked" HeaderText="Hours Worked" />
            <asp:BoundField DataField="HourlyRate" HeaderText="Hourly Rate" DataFormatString="{0:C}" />
            <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" DataFormatString="{0:C}" />
            <asp:BoundField DataField="ClaimDate" HeaderText="Claim Date" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="Status" HeaderText="Current Status" />
        </Columns>
    </asp:GridView>
</asp:Content>
