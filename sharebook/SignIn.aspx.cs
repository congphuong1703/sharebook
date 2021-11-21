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
            if(!IsValid)
            {
                CustomValidator1.Text = "Password phải lớn hơn 8 kí tự nhé !";
                return;
            }
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
                    role = dataTable.Rows[0][3] == null ? "" : dataTable.Rows[0][3].ToString(),
                    avatar = dataTable.Rows[0][7] == null ? "" : dataTable.Rows[0][7].ToString(),
                };
                Session["user"] = user;
                Session["login"] = true;
                Response.Redirect("Home.aspx");
            }
            else
            {
                errorAccount.InnerText = "Email hoặc password không chính xác !";
                return;
            }
        }

        protected void CustomValidator1_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            if(password.Text.Length >= 8)
            {
                args.IsValid = true;
            } else
            {
                args.IsValid = false;
            }
        }
    }
}