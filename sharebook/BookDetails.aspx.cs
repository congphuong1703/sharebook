using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sharebook
{
    public partial class BookDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string parameter = Request.QueryString["book_id"];
            if (parameter == null)
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
                loadImage(parameter);
                loadBookRelate(parameter);
            }
        }

        protected void loadImage(string parameter)
        {
            string getInfoBook = "getInfoBook";
            Dictionary<string, object> map = new Dictionary<string, object> { };
            map.Add("@pBookId", Int32.Parse(parameter));
            DataTable dataTable = DataProvider.getInstance.ExecuteQuery(getInfoBook, map);
            if (dataTable.Rows.Count > 0)
            {
                Image1.Src = (string)dataTable.Rows[0][5];
            }
            else
            {
                //thong bao
            }
        }

        protected void loadBookRelate(string parameter)
        {
            string bookRelate = "bookRelate";
            Dictionary<string, object> map = new Dictionary<string, object> { };
            map.Add("@pBookId", Int32.Parse(parameter));

            DataTable dataTable = DataProvider.getInstance.ExecuteQuery(bookRelate, map);
            RepeaterBookRelate.DataSource = dataTable;
            RepeaterBookRelate.DataBind();
        }
    }
}