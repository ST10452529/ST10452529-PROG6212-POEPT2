using System;
using System.Web;
using System.Web.UI;

namespace LecturerClaimForms
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] != null)
            {
                string role = Session["Role"].ToString();

                // Show "Manager Approval" only if logged-in user is a Manager
                if (role == "Manager")
                {
                    lnkManagerApproval.Visible = true;
                }
                else
                {
                    lnkManagerApproval.Visible = false;
                }
            }
            else
            {
                // Hide it by default if no one is logged in
                lnkManagerApproval.Visible = false;
            }
        }
    }
}
