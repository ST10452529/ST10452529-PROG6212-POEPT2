using System;
using System.Data;
using System.IO;
using Newtonsoft.Json; // Make sure you have Newtonsoft.Json installed via NuGet

namespace LecturerClaimForms
{
    public partial class TrackClaim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          /*  if (Session["Role"] == null || Session["Role"].ToString() != "Lecturer")
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadClaims();
            }
        }

        private void LoadClaims()
        {
            string filePath = Server.MapPath("~/App_Data/Claims.json");

            if (File.Exists(filePath))
            {
                var jsonData = File.ReadAllText(filePath);
                var claims = JsonConvert.DeserializeObject<DataTable>(jsonData);
                gvClaims.DataSource = claims;
                gvClaims.DataBind();
            }
            else
            {
                gvClaims.DataSource = null;
                gvClaims.DataBind();
            } */
        }
    }
}
