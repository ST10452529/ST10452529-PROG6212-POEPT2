using System;
using System.Web.UI;

namespace LecturerClaimForms
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: you can add session checks here later
            // Example: redirect if not logged in
            // if (Session["UserID"] == null)
            // {
            //     Response.Redirect("Login.aspx");
            // }

            // This page mainly serves as a dashboard/home page
            // No special logic needed yet
        }
    }
}
