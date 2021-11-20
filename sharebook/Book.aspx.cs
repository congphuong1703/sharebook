using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sharebook
{
    public partial class Book : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string parameter = Request.QueryString["book_id"];
                if (parameter == null)
                    Response.Redirect("Home.aspx");
                int param = Int32.Parse(parameter);
                loadDataBookDetails(param);


            }
        }
        protected void loadDataBookDetails(int parameter)
        {

            string getBookById = "getBookById";
            Dictionary<string, object> map = new Dictionary<string, object>();
            map.Add("bookId", parameter);
            DataTable dt = DataProvider.getInstance.ExecuteQuery(getBookById, map);
            RepeaterBookDetail.DataSource = dt;
            RepeaterBookDetail.DataBind();
        }

        protected void RepeaterBookDetail_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                var hdfBookID = (HiddenField)e.Item.FindControl("hdfBookID");
                var RepeaterBookTags = (Repeater)e.Item.FindControl("RepeaterBookTags");
                var RepeaterBookComments = (Repeater)e.Item.FindControl("RepeaterBookComments");

                string bookTagsDetails = "bookTagsDetails";
                string bookCommentsDetails = "bookCommentsDetails";

                Dictionary<string, object> map = new Dictionary<string, object>();
                map.Add("bookId", Convert.ToInt32(hdfBookID.Value));

                DataTable dataTableTags = DataProvider.getInstance.ExecuteQuery(bookTagsDetails, map);
                DataTable dataTableComments = DataProvider.getInstance.ExecuteQuery(bookCommentsDetails, map);

                RepeaterBookTags.DataSource = dataTableTags;
                RepeaterBookTags.DataBind();

                RepeaterBookComments.DataSource = dataTableComments;
                RepeaterBookComments.DataBind();

            }
        }
        protected void Download_Click(object sender, EventArgs e)
        {
            try
            {
                //Get the reference of the clicked button.
                LinkButton button = (sender as LinkButton);

                //Get the command argument
                string commandArgument = button.CommandArgument.Replace("Images/", "");

                Response.ContentType = ContentType;
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + "Images\\" + Path.GetFileName(commandArgument));
                Response.WriteFile("Images\\" + commandArgument);
                Response.End();
            }
            catch (Exception ex)
            {

            }
        }
        protected void Comment_Click(object sender, EventArgs e)
        {
            try
            {
                UserModel user = (UserModel)Session["user"];
                if (user == null)
                    Response.Redirect("SignIn.aspx");
                string addComment = "addComment";

                foreach (RepeaterItem rptItem in RepeaterBookDetail.Items)
                {
                    var hdfBookID = (HiddenField)rptItem.FindControl("hdfBookID");
                    TextBox commentContent = (TextBox)rptItem.FindControl("commentContent");
                    if (!String.IsNullOrEmpty(commentContent.Text))
                    {
                        Dictionary<string, object> map = new Dictionary<string, object> { };
                        map.Add("@pUserId", user.id);
                        map.Add("@pBookId", hdfBookID.Value);
                        map.Add("@pComment", commentContent.Text);
                        map.Add("@pCreatedAt", DateTime.Now);
                        MySqlDataReader dr = DataProvider.getInstance.ExecuteQueryReader(addComment, map);
                        if (dr.RecordsAffected > 0)
                            Response.Redirect(Request.RawUrl);
                        else
                        {
                            //thong bao

                        }
                    }
                }
            }
            catch (Exception ex)
            {

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
                //thong bao
            }
            else
            {
                //thong bao
            }

        }

        protected void Read_Click(object sender, EventArgs e)
        {
            //Get the reference of the clicked button.
            LinkButton button = (sender as LinkButton);

            //Get the command argument
            string commandArgument = button.CommandArgument;

            Response.Redirect("BookDetails.aspx?book_id=" + commandArgument);
        }
    }
}