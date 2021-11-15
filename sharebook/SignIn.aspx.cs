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
        SqlConnection conn;
        SqlCommand cmd;
        String queryStr;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void logginBtn_Click(object sender, EventArgs e)
        {
            string login = "login";
            Dictionary<string, object> map = new Dictionary<string, object> { };
            map.Add("@p_email", email.Text.Trim());
            map.Add("@p_password", password.Text.Trim());
            DataTable dataTable = DataProvider.getInstance.ExecuteQuery(login, map);
            if (dataTable.Rows.Count > 0)
            {
                UserModel user = new UserModel()
                {
                    id = (int)dataTable.Rows[0][0],
                    name = dataTable.Rows[0][1] == null ? "" : dataTable.Rows[0][1].ToString(),
                    email = dataTable.Rows[0][2] == null ? "" : dataTable.Rows[0][2].ToString(),
                    role = dataTable.Rows[0][3] == null ? "" : dataTable.Rows[0][3].ToString()
                };
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
                //thong bao
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