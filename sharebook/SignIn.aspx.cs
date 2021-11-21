using System.Data.SqlClient;
using sharebook.model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;

namespace sharebook
{
    public partial class SignIn : System.Web.UI.Page
    {
        string hashkey = ConfigurationManager.AppSettings["hashkey"];

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void logginBtn_Click(object sender, EventArgs e)
        {
            string login = "login";
            Dictionary<string, object> map = new Dictionary<string, object> { };
            map.Add("@p_email", email.Text.Trim());
            map.Add("@p_password", HashCode.Decrypt(password.Text.Trim(), hashkey, true));
            DataTable dataTable = DataProvider.getInstance.ExecuteQuery(login, map);
            if (dataTable.Rows.Count > 0)
            {
                UserModel user = new UserModel()
                {
                    id = (int)dataTable.Rows[0][0],
                    email = dataTable.Rows[0][1] == null ? "" : dataTable.Rows[0][1].ToString(),
                    name = dataTable.Rows[0][2] == null ? "" : dataTable.Rows[0][2].ToString(),
                    role = dataTable.Rows[0][3] == null ? "" : dataTable.Rows[0][3].ToString(),
                    avatar = dataTable.Rows[0][4] == null ? "" : dataTable.Rows[0][4].ToString()
                };
                Session["user"] = user;
                Session["login"] = true;
                Response.Redirect("Home.aspx");
            }
            else
            {
                Response.Write("<script>alert('Sai email hoặc mật khẩu !');</script>");
            }
        }


    }
}