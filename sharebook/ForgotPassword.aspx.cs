using System;
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
            Boolean isSuccessfulSendMail = sendMail(email);
            if (isSuccessfulSendMail)
            {
                //todo thong bao thanh cong
            }
            else
            {

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
                var fromAddress = new MailAddress("from@gmail.com", "From Name");
                var toAddress = new MailAddress("to@example.com", "To Name");
                const string fromPassword = "fromPassword";
                const string subject = "Subject";
                const string body = "Body";

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
            catch (Exception)
            {
                return false;
            }
            return true;
        }
    }
}