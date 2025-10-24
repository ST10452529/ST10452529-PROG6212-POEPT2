using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace LecturerClaimForms
{
    public partial class Login : Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "⚠️ Please enter both username and password.";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["ClaimDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT Role FROM Users WHERE Username = @Username AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);

                con.Open();
                object role = cmd.ExecuteScalar();

                if (role != null)
                {
                    // Save session info
                    Session["Username"] = username;
                    Session["Role"] = role.ToString();

                    // Redirect by role
                    if (role.ToString() == "Lecturer")
                        Response.Redirect("SendClaim.aspx");
                    else if (role.ToString() == "Manager")
                        Response.Redirect("ManagerApproval.aspx");
                    else
                        Response.Redirect("Default.aspx");
                }
                else
                {
                    lblMessage.Text = "❌ Invalid username or password.";
                }
            }
        }
    }
}
