using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sharebook
{
    public partial class BookMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string queryCategory = "select * from tbl_categories";
            DataTable categoryDataTable = DataProvider.getInstance.ExecuteQuery(queryCategory);

            categories.DataSource = categoryDataTable;
            categories.DataBind();
        }
    }
}