using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using sharebook.model;
using System.Configuration;

namespace sharebook
{
    public partial class User : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        String query;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["login"] == false)
            {
                Response.Write("<script>alert('Bạn chưa đăng nhập !');</script>");
                Response.Redirect("SignIn.aspx");
            }
            SqlConnection conn = this.connectionSQL();
            Users user = (Users) Session["user"];
            query = "Select * from tbl_user WHERE Id = " + user.Id;
            cmd = new SqlCommand(query, conn);
            SqlDataReader reader = cmd.ExecuteReader();

            while(reader.HasRows && reader.Read())
            {
                profileName.InnerHtml = Convert.ToString(reader["name"]);
                profileEmail.InnerHtml = "Email: " + Convert.ToString(reader["email"]);
            }

        }

        private SqlConnection connectionSQL()
        {

            string constr = ConfigurationManager.ConnectionStrings["connectSQL"].ToString();

            conn = new SqlConnection(constr);
            conn.Open();

            return conn;
        }
    }
}