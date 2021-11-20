using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sharebook
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserModel user = (UserModel)Session["user"];
            if (user == null)
            {
                userBtn.Visible = false;
                logoutBtn.Visible = false;
                loginBtn.Visible = true;
            }
            else
            {
                if (user.role == "1")
                {
                    manageUrl.Visible = true;
                }
                else
                {
                    manageUrl.Visible = false;
                }
                loginBtn.Visible = false;
                userBtn.Visible = true;
                userBtn.InnerText = user.name;
                logoutBtn.Visible = true;
                userBtn.HRef = "User.aspx";
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Remove("user");
            Response.Redirect("SignIn.aspx");
        }
        protected void FindBook_Click(object sender, EventArgs e)
        {
            string parameter = searchBookInput.Value;
            Response.Redirect("Category.aspx?book=" + parameter);
        }
    }
}