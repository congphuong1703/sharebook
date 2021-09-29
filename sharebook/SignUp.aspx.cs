using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;

namespace sharebook
{

    public partial class SignUp : System.Web.UI.Page
    {
        MySqlConnection conn;
        MySqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signUp_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            using (conn = this.connectionSQL())
            {
                using (cmd = new MySqlCommand("isExistsEmail", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email", email);
                    MySqlDataReader reader = cmd.ExecuteReader();
                    if (!reader.HasRows)
                    {
                        using (cmd = new MySqlCommand("SignUp", conn))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@email", email);
                            cmd.Parameters.AddWithValue("@password", password);

                            MySqlDataReader rdr = cmd.ExecuteReader();
                            if (rdr.HasRows)
                            {
                                //todo thong bao thanh cong
                            }
                            else
                            {
                                //todo thong bao that bai
                            }
                        }
                    }
                    else
                    {
                        //todo thong bao trung
                    }

                }


            }
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