using System.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;

namespace sharebook
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        private static Random random = new Random();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void forgetPasswordBtn_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            SqlConnection conn;
            string isExistAccount = "isExistAccount";
            Dictionary<string, object> map = new Dictionary<string, object> { };
            map.Add("@p_email", email);
            DataTable dt = DataProvider.getInstance.ExecuteQuery(isExistAccount, map);
            if (dt.Rows.Count == 0)
            {
                errorNotify.Text = "Không tồn tại email";
                return;
            }
            if (sendMail(email))
            {
                Response.Write("<script language='javascript' type='text/javascript'>window.location.href='https://gmail.com'</script>");
            }
            else
            {
                errorNotify.Text = "Gửi email không thành công";
                return;
            }
        }


        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        private Boolean sendMail(string email)
        {
            try
            {
                string newPassword = RandomString(8);

                Dictionary<string, object> map = new Dictionary<string, object>();
                map.Add("@p_email", email);
                map.Add("@p_password", newPassword);
                int rowsEffect = DataProvider.getInstance.ExecuteNonQuery("resetPassword", map);
                if (rowsEffect < 1)
                {
                    return false;
                }

                var fromAddress = new MailAddress("congphuong.jav62@gmail.com", "Share Book");
                var toAddress = new MailAddress(email);
                string fromPassword = "Conghpuong1a";
                string subject = "Đổi mật khẩu - ShareBook";
                string body = "Mật khẩu của bạn đã được thay đổi. Mật khẩu mới của bạn là : " + newPassword;

                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                };
                using (var message = new MailMessage(fromAddress, toAddress)
                {
                    Subject = subject,
                    Body = body
                })
                    smtp.Send(message);

            }
            catch (Exception e)
            {
                return false;

            }
            return true;
        }
    }
}