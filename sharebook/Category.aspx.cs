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
        private void LoadBookSource(string parameter)
        {
            string query = "";
            if (String.IsNullOrEmpty(parameter) || parameter.Equals("1"))
                query = "select b.book_id, b.name,b.thumbnail,b.description,DATE_FORMAT(b.update_at, '%d/%m/%Y') as create_at," +
                    "count(c.comment_id) as comment ,count(f.favourite_id) as favourite,u.user_id,u.name as fullname from tbl_book as b " +
                    "join tbl_user as u on b.user_id = u.user_id left join tbl_favourite as f on b.book_id = f.book_id " +
                    "left join tbl_comment as c on b.book_id = c.book_id group by b.book_id";
            else
            {
                query = "select b.book_id, b.name,b.thumbnail,b.description,DATE_FORMAT(b.update_at, '%d/%m/%Y') as create_at," +
                  "count(c.comment_id) as comment ,count(f.favourite_id) as favourite,u.name as fullname from tbl_book as b " +
                  "join tbl_user as u on b.user_id = u.user_id left join tbl_favourite as f on b.book_id = f.book_id " +
                  "left join tbl_comment as c on b.book_id = c.book_id join tbl_book_category as bc on " +
                  "bc.book_id = b.book_id join tbl_categories as ca on bc.categoty_id = ca.category_id where ca.category_id = " + parameter + " group by b.book_id";
            }
            DataTable dataTable = DataProvider.getInstance.ExecuteQuery(query);
            /*  for (int i = 0; i < dataTable.Rows.Count; i++)
              {
                  string queryTag = "select t.name from tbl_tag as t join tbl_book_tag as bt on t.tag_id = bt.tag_id join tbl_book as b on bt.book_id = b.book_id where bt.book_id=" + dataTable.Rows[i]["book_id"];
                  DataTable dataTableTag = DataProvider.getInstance.ExecuteQuery(query);
              }*/
        
            books.DataSource = dataTable;
            books.DataBind();
        }
        protected virtual void SaveFavourite_Click(Object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            Users userLogged = (Users)Session["user"];
            if (userLogged != null)
            {
                string query = "select * from tbl_favourite where book_id = " + btn.CommandArgument.ToString() + " and user_id =" + userLogged.Id;
                int existFavourite = DataProvider.getInstance.ExecuteNonQuery(query);
                string procedure = "";
                if (existFavourite > 0)
                {
                    procedure = "removeNewFavourite";
                    message.InnerHtml = Server.HtmlEncode("Đã lưu trữ thành công");
                }
                else
                {
                    procedure = "addNewFavourite";
                    message.InnerHtml = Server.HtmlEncode("Đã xóa lưu trữ");
                }

                Dictionary<string, Object> map = new Dictionary<string, object>();
                map.Add("@userId", userLogged.Id);
                map.Add("@bookId", btn.CommandArgument.ToString());
                int result = DataProvider.getInstance.ExecuteNonQuery(procedure, map);
            }
            else
            {
                Response.Redirect("/SignIn.aspx");
            }
        }

        /*
                protected void OnItemDataBound(object sender, ListViewItemEventArgs e)
                {
                    ListView books = (ListView)e.Item.FindControl("books");
                    if (e.Item.ItemType == ListViewItemType.DataItem)
                    {
                        foreach (var item in books.Items)
                        {
                            // finally, recommendedProducts for each childmenu-item within the currently processed childmenu is accessible
                            var tags = item.FindControl("tags") as ListView;
                            int i = (int)tags.DataKeys[CommentItem.DisplayIndex]["Id"];
                            recommendedProducts3.DataSource = new[] { "Best" };
                            recommendedProducts3.DataBind();
                        }
                    }
                }*/
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var parameter = Request.QueryString["category_id"];
                LoadBookSource(parameter);
            }
        }
    }
}
