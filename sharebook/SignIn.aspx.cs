using MySql.Data.MySqlClient;
using sharebook.model;
using System;
using System.Configuration;
namespace sharebook
{
    public partial class SignIn : System.Web.UI.Page
    {
        MySqlConnection conn;
        MySqlCommand cmd;
        String queryStr;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void logginBtn_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = this.connectionSQL();
            queryStr = "SELECT * FROM tbl_user WHERE email = '" + email.Text + "' and password = '" + password.Text + "'";
            cmd = new MySqlCommand(queryStr, conn);
            MySqlDataReader reader = cmd.ExecuteReader();
            Users user = new Users();
            while (reader.HasRows && reader.Read())
            {
                user.Email = reader.GetString(reader.GetOrdinal("email"));
                user.Username = reader.GetString(reader.GetOrdinal("username"));
                user.Status = reader.GetBoolean("status");
                user.Verify = reader.GetBoolean("verify");
                user.Role = (int)reader.GetInt64("role");
            }
            if (reader.HasRows)
            {
                Session["user"] = user;
                Response.Redirect("Home.aspx", false);
            }
            else
            {

            }

            reader.Close();
            conn.Close();
        }

        private MySqlConnection connectionSQL()
        {
            string constr = ConfigurationManager.ConnectionStrings["connectSQL"].ToString();
            conn = new MySqlConnection(constr);
            conn.Open();

            return conn;
        }

    }
}