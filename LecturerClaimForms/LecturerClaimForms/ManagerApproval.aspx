<%@ Page Title="Manager Approval" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ManagerApproval.aspx.cs" Inherits="LecturerClaimForms.ManagerApproval" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Manager Approval Panel</h2>
        <p class="text-center text-muted">Review all pending claims and approve or reject them below.</p>

        <asp:Label ID="lblMessage" runat="server" ForeColor="Green" Font-Bold="True"></asp:Label>
        <br /><br />

        <asp:GridView ID="gvManagerClaims" runat="server"
            AutoGenerateColumns="False"
            CssClass="table table-striped table-bordered shadow-sm"
            OnRowCommand="gvManagerClaims_RowCommand"
            HeaderStyle-BackColor="#343a40"
            HeaderStyle-ForeColor="White"
            GridLines="None">

            <Columns>
                <asp:BoundField DataField="ClaimID" HeaderText="Claim ID" />
                <asp:BoundField DataField="LecturerName" HeaderText="Lecturer Name" />
                <asp:BoundField DataField="ModuleCode" HeaderText="Module Code" />
                <asp:BoundField DataField="HoursWorked" HeaderText="Hours" />
                <asp:BoundField DataField="HourlyRate" HeaderText="Rate" DataFormatString="{0:C}" />
                <asp:BoundField DataField="TotalAmount" HeaderText="Total" DataFormatString="{0:C}" />
                <asp:BoundField DataField="ClaimDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Status" HeaderText="Status" />

                <asp:TemplateField HeaderText="Attachment">
                    <ItemTemplate>
                        <asp:HyperLink ID="lnkAttachment" runat="server"
                            Text="📎 View"
                            NavigateUrl='<%# Eval("AttachmentPath") %>'
                            Target="_blank"
                            CssClass="text-decoration-none text-primary fw-bold" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <div class="d-flex justify-content-center">
                            <asp:Button ID="btnApprove" runat="server"
                                Text="Approve"
                                CommandName="Approve"
                                CommandArgument='<%# Eval("ClaimID") %>'
                                CssClass="btn btn-success btn-sm me-2" />

                            <asp:Button ID="btnReject" runat="server"
                                Text="Reject"
                                CommandName="Reject"
                                CommandArgument='<%# Eval("ClaimID") %>'
                                CssClass="btn btn-danger btn-sm" />
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>

        <div class="text-center mt-3">
            <asp:Button ID="btnRefresh" runat="server"
                Text="🔄 Refresh Claims"
                CssClass="btn btn-secondary"
                OnClick="btnRefresh_Click" />
        </div>
    </div>
</asp:Content>
