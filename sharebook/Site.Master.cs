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
            string html = "";
            html += "<a href='SignIn.aspx' class=nav-link py-3 px-0 px-lg-3 rounded'>Đăng nhập</a>";

            if( (bool) Session["login"] == true) 
            {
                loginserver.InnerHtml = "<a href = 'User.aspx' class=nav-link py-3 px-0 px-lg-3 rounded'>Trang cá nhân</a>";
            } else
            {
                loginserver.InnerHtml = html;
            }

            //if ((bool)Session["login"] == true && (string)Session["nickname"] == "admin")
            //{
            //    loginserver.InnerHtml = "<a href='Blog.aspx' class='btn btn--signup'>Create Blog</a>"
            //                          + "<a href='AdminAccount.aspx' class='btn'>Accounts</a>"
            //                          + "<a href='#' class='btn btn--login'>"
            //                          + "<form><button type='submit' class='btnLogout' value='true' name='btnLogout' id='btnLogout' runat='server'>"
            //                          + "Logout</button></form>"
            //                          + "</a>";

            //}


            //else if ((bool)Session["login"] == true)
            //{
            //    loginserver.InnerHtml = "<a href='Blog.aspx' class='btn btn--signup'>Create Blog</a>"
            //                          + "<a href='#' class='btn btn--login'>"
            //                          + "<form><button type='submit' class='btnLogout' value='true' name='btnLogout' id='btnLogout' runat='server'>"
            //                          + "Logout</button></form>"
            //                          + "</a>";

            //}
        }
    }
}