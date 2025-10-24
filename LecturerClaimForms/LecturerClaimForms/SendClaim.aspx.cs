using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;

namespace LecturerClaimForms
{
    public partial class SendClaim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Only lecturers can access this page
            if (Session["Role"] == null || Session["Role"].ToString() != "Lecturer")
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string lecturerName = txtLecturerName.Text.Trim();
                string moduleCode = txtModuleCode.Text.Trim();
                decimal hoursWorked = decimal.Parse(txtHoursWorked.Text);
                decimal hourlyRate = decimal.Parse(txtHourlyRate.Text);
                decimal totalAmount = hoursWorked * hourlyRate;
                DateTime claimDate = DateTime.Parse(txtDate.Text);
                string filePath = null;

                // Handle attachment upload
                if (fileAttachment.HasFile)
                {
                    string folderPath = Server.MapPath("~/Uploads/");
                    if (!Directory.Exists(folderPath))
                        Directory.CreateDirectory(folderPath);

                    string fileName = Path.GetFileName(fileAttachment.FileName);
                    string fullPath = Path.Combine(folderPath, fileName);
                    fileAttachment.SaveAs(fullPath);

                    filePath = "~/Uploads/" + fileName;
                }

                // Save to database
                string connStr = ConfigurationManager.ConnectionStrings["ClaimDB"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = @"INSERT INTO Claims (LecturerName, ModuleCode, HoursWorked, HourlyRate, TotalAmount, ClaimDate, Status, AttachmentPath)
                                     VALUES (@LecturerName, @ModuleCode, @HoursWorked, @HourlyRate, @TotalAmount, @ClaimDate, @Status, @AttachmentPath)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@LecturerName", lecturerName);
                        cmd.Parameters.AddWithValue("@ModuleCode", moduleCode);
                        cmd.Parameters.AddWithValue("@HoursWorked", hoursWorked);
                        cmd.Parameters.AddWithValue("@HourlyRate", hourlyRate);
                        cmd.Parameters.AddWithValue("@TotalAmount", totalAmount);
                        cmd.Parameters.AddWithValue("@ClaimDate", claimDate);
                        cmd.Parameters.AddWithValue("@Status", "Pending");
                        cmd.Parameters.AddWithValue("@AttachmentPath", (object)filePath ?? DBNull.Value);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                lblMessage.ForeColor = Color.Green;
                lblMessage.Text = "✅ Claim submitted successfully.";

                // Clear form
                txtLecturerName.Text = txtModuleCode.Text = txtHoursWorked.Text = txtHourlyRate.Text = txtDate.Text = "";
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "❌ Error: " + ex.Message;
            }
        }
    }
}
