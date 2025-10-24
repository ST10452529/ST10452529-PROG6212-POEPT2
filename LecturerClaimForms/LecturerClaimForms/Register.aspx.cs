using System;
using System.Configuration;
using System.Data.SqlClient;

namespace LecturerClaimForms
{
    public partial class Register : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
    /*        string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();
            string role = ddlRole.SelectedValue;

            if (password != confirmPassword)
            {
                lblMessage.Text = "❌ Passwords do not match.";
                return;
            }

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(role))
            {
                lblMessage.Text = "⚠️ Please fill in all fields.";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["ClaimDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                // Check if user already exists
                string checkQuery = "SELECT COUNT(*) FROM Users WHERE Username = @Username";
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
                {
                    checkCmd.Parameters.AddWithValue("@Username", username);
                    int exists = (int)checkCmd.ExecuteScalar();
                    if (exists > 0)
                    {
                        lblMessage.Text = "⚠️ Username already exists.";
                        return;
                    }
                }

                // Insert new user
                string insertQuery = "INSERT INTO Users (Username, Password, Role) VALUES (@Username, @Password, @Role)";
                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@Role", role);
                    cmd.ExecuteNonQuery();
                }
            }

            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "✅ Registration successful! You can now login."; */
        }
    }
}

