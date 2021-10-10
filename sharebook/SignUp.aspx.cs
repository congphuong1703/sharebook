using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;

namespace sharebook
{

    public partial class SignUp : System.Web.UI.Page
    {
        MySqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signUp_Click(object sender, EventArgs e)
        {
            MySqlConnection conn;
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string name = txtName.Text;
            string confirmPassword = txtConfirmPassword.Text;
            if (!password.Equals(confirmPassword))
            {
                errorNotify.Text = "Đăng ký thành thất bại. Kiểm tra lại mật khẩu";
                return;
            }
            using (conn = DataProvider.getInstance.connectionSQL())
            {
                using (cmd = new MySqlCommand("isExistAccount", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email", email);
                    MySqlDataReader reader = cmd.ExecuteReader();
                    if (!reader.HasRows)
                    {
                        reader.Close();
                        using (cmd = new MySqlCommand("createNewAccount", conn))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@p_email", email);
                            cmd.Parameters.AddWithValue("@p_password", password);
                            cmd.Parameters.AddWithValue("@p_role", 1);
                            cmd.Parameters.AddWithValue("@p_name", name);

                            MySqlDataReader rdr = cmd.ExecuteReader();
                            if (rdr.HasRows)
                            {
                                Response.Write("<script language='javascript' type='text/javascript'>window.location.href = 'https://gmail.com'</script>");
                            }
                            else
                            {
                                errorNotify.Text = "Đăng ký thành thất bại. Kiểm tra lại thông tin";
                            }
                            rdr.Close();
                        }
                    }
                    else
                    {
                        errorNotify.Text = "Email này đã được sử dụng.";
                    }

                }
            }
        }

    }
}