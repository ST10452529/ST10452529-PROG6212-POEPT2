<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="YourProjectName.Contact" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5" style="max-width:600px;">
            <h2 class="text-center mb-4">Contact Us</h2>

            <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>

            <div class="mb-3">
                <asp:Label Text="Full Name:" runat="server" AssociatedControlID="txtName" />
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required" ForeColor="Red" />
            </div>

            <div class="mb-3">
                <asp:Label Text="Email:" runat="server" AssociatedControlID="txtEmail" />
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" ForeColor="Red" />
                <asp:RegularExpressionValidator ID="regexEmail" runat="server" ControlToValidate="txtEmail" 
                    ErrorMessage="Invalid email format" ForeColor="Red"
                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" />
            </div>

            <div class="mb-3">
                <asp:Label Text="Message:" runat="server" AssociatedControlID="txtMessage" />
                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Type your message"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqMessage" runat="server" ControlToValidate="txtMessage" ErrorMessage="Message is required" ForeColor="Red" />
            </div>

            <div class="text-center">
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </form>
</body>
</html>
