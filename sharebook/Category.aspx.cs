using MySql.Data.MySqlClient;
using System.Data.SqlClient;
using sharebook.model;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sharebook
{
    public partial class Category : System.Web.UI.Page
    {
        private void LoadBookSource(string categoryName, string parameter, string tagName)
        {
            string query = "getCategoriesByNameAndTag";
            Dictionary<string, object> map = new Dictionary<string, object> { };
            if ((String.IsNullOrEmpty(categoryName) || categoryName.Equals("Mới nhất")) && String.IsNullOrEmpty(tagName) && String.IsNullOrEmpty(parameter))
            {
                map.Add("@pCategoryName", "");
                map.Add("@pTagName", "");
                map.Add("@pBookName", "");

            }
            else if (!String.IsNullOrEmpty(categoryName))
            {
                map.Add("@pCategoryName", categoryName);
                map.Add("@pTagName", "");
                map.Add("@pBookName", "");
            }
            else if (!String.IsNullOrEmpty(tagName))
            {
                map.Add("@pCategoryName", "");
                map.Add("@pTagName", tagName);
                map.Add("@pBookName", "");
            }
            else
            {
                map.Add("@pCategoryName", "");
                map.Add("@pTagName", "");
                map.Add("@pBookName", parameter);
            }

            DataTable dataTable = DataProvider.getInstance.ExecuteQuery(query, map);
            RepeaterBooks.DataSource = dataTable;
            RepeaterBooks.DataBind();
        }

        protected void RepeaterBooksItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var hdfBookID = (HiddenField)e.Item.FindControl("hdfBookID");

                Repeater RepeaterBookTags = (Repeater)(e.Item.FindControl("RepeaterBookTags"));
                string storeProcedureGetTags = "bookTagsDetails";
                Dictionary<string, object> map = new Dictionary<string, object>();
                map.Add("bookId", Convert.ToInt32(hdfBookID.Value));
                DataTable dataTable = DataProvider.getInstance.ExecuteQuery(storeProcedureGetTags, map);

                RepeaterBookTags.DataSource = dataTable;
                RepeaterBookTags.DataBind();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var category = Request.QueryString["name"];
                var tag = Request.QueryString["tag"];
                var parameter = Request.QueryString["book"];
                LoadBookSource(category, parameter, tag);
            }
        }


        protected void Favorite_Click(object sender, EventArgs e)
        {
            UserModel user = (UserModel)Session["user"];
            if (user == null)
                Response.Redirect("SignIn.aspx");
            //Get the reference of the clicked button.
            LinkButton button = (sender as LinkButton);
            string addNewFavourite = "addNewFavourite";
            Dictionary<string, object> map = new Dictionary<string, object> { };
            string commandArgument = button.CommandArgument;

            map.Add("@userId", user.id);
            map.Add("@bookId", commandArgument);
            DataTable dataTable = DataProvider.getInstance.ExecuteQuery(addNewFavourite, map);

            if (dataTable.Rows.Count > 0)
            {
                Response.Write("<script>alert('Thêm thành công vào danh sách đọc sau!');</script>");
            }
            else
            {
                Response.Write("<script>alert('Thêm vào danh sách đọc sau thất bại!');</script>");
            }

        }
    }
}
