using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace LecturerClaimForms
{
    public partial class ManagerApproval : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadClaims();
            }
        }

        private void LoadClaims()
        {
            try
            {
                string connString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = "SELECT ClaimID, LecturerName, ModuleCode, HoursWorked, HourlyRate, (HoursWorked * HourlyRate) AS TotalAmount, ClaimDate, Status, AttachmentPath FROM Claims";
                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvManagerClaims.DataSource = dt;
                    gvManagerClaims.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading claims: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void gvManagerClaims_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            string claimID = e.CommandArgument.ToString();

            if (e.CommandName == "Approve")
            {
                UpdateClaimStatus(claimID, "Approved");
            }
            else if (e.CommandName == "Reject")
            {
                UpdateClaimStatus(claimID, "Rejected");
            }
        }

        private void UpdateClaimStatus(string claimID, string newStatus)
        {
            try
            {
                string connString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = "UPDATE Claims SET Status = @Status WHERE ClaimID = @ClaimID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Status", newStatus);
                    cmd.Parameters.AddWithValue("@ClaimID", claimID);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    lblMessage.Text = $"Claim {claimID} has been {newStatus}.";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }

                LoadClaims();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error updating claim: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadClaims();
        }
    }
}
