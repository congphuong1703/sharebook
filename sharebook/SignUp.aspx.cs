using System.Data.SqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace sharebook
{

    public partial class SignUp : System.Web.UI.Page
    {
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signUp_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string name = txtName.Text;
            string confirmPassword = txtConfirmPassword.Text;
            if (!password.Equals(confirmPassword))
            {
                errorNotify.Text = "Đăng ký thành thất bại. Kiểm tra lại mật khẩu";
                return;
            }
            string isExistAccount = "isExistAccount";
            string createNewAccount = "createNewAccount";
            Dictionary<string, object> map = new Dictionary<string, object> { };
            Dictionary<string, object> mapExists = new Dictionary<string, object> { };
            mapExists.Add("@p_email", email);

            DataTable dtExists = DataProvider.getInstance.ExecuteQuery(isExistAccount, map);

            if (dtExists.Rows.Count == 0)
            {
                MySqlDataReader rdr = DataProvider.getInstance.ExecuteQueryReader(createNewAccount, map);
                map.Add("@p_email", email);
                map.Add("@p_password", password);
                map.Add("@p_role", 0);
                map.Add("@p_name", name);
                if (rdr.RecordsAffected > 0)
                {
                    Response.Redirect("SignIn.aspx");
                }
                else
                {
                    errorNotify.Text = "Đăng ký thành thất bại. Kiểm tra lại thông tin";
                }
                rdr.Close();
            }
            else
            {
                errorNotify.Text = "Email này đã được sử dụng.";
            }

        }
    }
}