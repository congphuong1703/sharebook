using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sharebook
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string getAllUser = "getAllUser";
            Dictionary<string, object> map = new Dictionary<string, object> { };
            DataTable dt = DataProvider.getInstance.ExecuteQuery(getAllUser, map);
            RepeaterUsers.DataSource = dt;
            RepeaterUsers.DataBind();
        }
    }
}