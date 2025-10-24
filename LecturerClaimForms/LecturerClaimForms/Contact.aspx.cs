using System;
using System.Configuration;
using System.Data.SqlClient;

namespace YourProjectName
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string message = txtMessage.Text.Trim();

            string connString = ConfigurationManager.ConnectionStrings["ClaimDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "INSERT INTO ContactMessages (Name, Email, Message, DateSent) VALUES (@Name, @Email, @Message, GETDATE())";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Message", message);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            lblMessage.Text = "Thank you for reaching out! We'll get back to you soon.";
            txtName.Text = txtEmail.Text = txtMessage.Text = "";
        }
    }
}
