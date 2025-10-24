<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="LecturerClaimForms.Logout" %>

<protected void Page_Load(object sender, EventArgs e)
{
    Session.Clear();
    Response.Redirect("Login.aspx");
}
