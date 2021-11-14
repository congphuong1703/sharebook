using System.Data.SqlClient;
using sharebook.model;
using System;
using System.Configuration;
namespace sharebook
{
    public partial class SignIn : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        String queryStr;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void logginBtn_Click(object sender, EventArgs e)
        {
            SqlConnection conn = this.connectionSQL();
            queryStr = "SELECT * FROM tbl_user WHERE email = '" + email.Text + "' and password = '" + password.Text + "' and verify = 1" ;
            cmd = new SqlCommand(queryStr, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            Users user = new Users();
            while (reader.HasRows && reader.Read())
            {
                user.Id = (int) reader["Id"];
                user.Email = reader.GetString(reader.GetOrdinal("email"));
                user.Name = reader.GetString(reader.GetOrdinal("name"));
                user.Status = (bool) reader["status"];
                user.Verify = (bool) reader["verify"];
                user.Role = (int) reader["role"];
            }
            if (reader.HasRows)
            {
                Session["user"] = user;
                Session["login"] = true;
                if(user.Role == 2)
                {
                    Session["admin"] = true;
                    Response.Redirect("Admin.aspx");
                }
                Response.Redirect("Home.aspx", false);
            }
            else
            {
                Response.Write("<script language='javascript'></script>");
            }

            reader.Close();
            conn.Close();
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