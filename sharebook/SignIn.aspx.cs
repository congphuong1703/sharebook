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
                    name = dataTable.Rows[0][2] == null ? "" : dataTable.Rows[0][2].ToString(),
                    email = dataTable.Rows[0][1] == null ? "" : dataTable.Rows[0][1].ToString(),
                    role = dataTable.Rows[0][3] == null ? "" : dataTable.Rows[0][3].ToString()
                };
                Session["user"] = user;
                Response.Redirect("Home.aspx");
            }
            else
            {
                //thong bao
            }
        }


    }
}