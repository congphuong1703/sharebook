using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using sharebook.model;
using System.Configuration;
using System.Data;

namespace sharebook
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            var userId = Request.QueryString["user_id"];
            string storeProcedure = "getInfoUser";
            Dictionary<string, object> map = new Dictionary<string, object> { };
            UserModel userModel = (UserModel)Session["user"];
            if (String.IsNullOrEmpty(userId) && userModel != null)
            {
                map.Add("@pUserId", userModel.id);
            }
            else if (!String.IsNullOrEmpty(userId))
            {
                map.Add("@pUserId", userId);
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }
            DataTable dt = DataProvider.getInstance.ExecuteQuery(storeProcedure, map);
            RepeaterProfile.DataSource = dt;
            RepeaterProfile.DataBind();
        }
    }
}