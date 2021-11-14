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
            if ((bool)Session["admin"] == false)
            {
                Response.Write("<script>alert('Bạn không có quyền vào trang này !');</script>");
                Response.Redirect("SignIn.aspx");
            }
            LoadListUser();
            
        }
        private void LoadListUser()
        {
            string query = "Select * from tbl_user where role = 1";
            DataTable dataTable = DataProvider.getInstance.ExecuteQuery(query);
            ListUser.DataSource = dataTable;
            ListUser.DataBind();            

        }
    }
}