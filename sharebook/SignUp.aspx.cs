using System.Data.SqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace sharebook
{

    public partial class SignUp : System.Web.UI.Page
    {
        String hashKey = ConfigurationManager.AppSettings["hashkey"];

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signUp_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
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

                DataTable dtExists = DataProvider.getInstance.ExecuteQuery(isExistAccount, mapExists);

                if (dtExists.Rows.Count == 0)
                {
                    map.Add("@p_email", email);
                    map.Add("@p_password", HashCode.Encrypt(password, hashKey, true));
                    map.Add("@p_role", 0);
                    map.Add("@p_name", name);
                    MySqlDataReader rdr = DataProvider.getInstance.ExecuteQueryReader(createNewAccount, map);

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

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //string strRegex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$";
            //Regex regex = new Regex(strRegex);
            //bool is_valid = false;

            //if (regex.IsMatch(txtPassword.Text))
            //{
            //    is_valid = true;
            //}
            int length = args.Value.Length;
            if (length >= 6)
            {

                args.IsValid = true;
            }
            else
            {
                Label1.Text = "Mật khẩu dài ít nhất 6 kí tự.";
                args.IsValid = false;

            }
        }
    }
}