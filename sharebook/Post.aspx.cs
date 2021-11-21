using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sharebook
{
    public partial class Post : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((UserModel)Session["user"] == null)
            {
                Response.Redirect("SignIn.aspx");
            }
            if (!IsPostBack)
            {
                string getAllTags = "getAllTags";
                string getAllCategories = "getAllCategories";

                DataTable tagsTable = DataProvider.getInstance.ExecuteQuery(getAllTags);
                DataTable categoriesTable = DataProvider.getInstance.ExecuteQuery(getAllCategories);

                CategoryDropDownList.DataSource = categoriesTable;
                CategoryDropDownList.DataTextField = "name";
                CategoryDropDownList.DataValueField = "Id";
                CategoryDropDownList.DataBind();

                TagsDropDownList.DataSource = tagsTable;
                TagsDropDownList.DataTextField = "name";
                TagsDropDownList.DataValueField = "Id";
                TagsDropDownList.DataBind();
            }
        }

        protected void Post_Click(object sender, EventArgs e)
        {
            UserModel userSession = (UserModel)Session["user"];
            if (userSession != null)
            {
                if (Page.IsValid)
                {

                    string postBook = "postBook";
                    string image = "";
                    string ava = "";

                    if (images.HasFile)
                    {
                        var extension = System.IO.Path.GetExtension(images.FileName);
                        if (extension == ".pdf")
                        {
                            var path = Server.MapPath("Images\\");
                            images.SaveAs(path + images.FileName);
                            string fileName = System.IO.Path.GetFileName(images.FileName);
                            image = "Images/" + fileName;
                        }
                    }
                    else
                    {
                        image = "Images/";
                    }
                    if (avatar.HasFile)
                    {
                        var extension = System.IO.Path.GetExtension(avatar.FileName);
                        if (extension == ".jpg" || extension == ".png" || extension == ".jpeg")
                        {
                            var path = Server.MapPath("Images\\");
                            avatar.SaveAs(path + avatar.FileName);
                            string fileName = System.IO.Path.GetFileName(avatar.FileName);
                            ava = "Images/" + fileName;
                        }
                    }
                    else
                    {
                        ava = "Images/";
                    }

                    Dictionary<string, object> map = new Dictionary<string, object> { };
                    map.Add("@pName", name.Text);
                    map.Add("@pUserId", userSession.id);
                    map.Add("@pThumbnail", ava);
                    map.Add("@pDescription", description.Value);
                    map.Add("@pFile", image);
                    map.Add("@pCreatedAt", DateTime.Now);
                    map.Add("@pUpdatedAt", DateTime.Now);
                    
                    DataTable dt = DataProvider.getInstance.ExecuteQuery(postBook, map);
                    if (dt.Rows.Count > 0)
                    {
                        int bookId = Int32.Parse(dt.Rows[0][0].ToString());
                        string addBookTag = "addBookTag";
                        string addBookCategory = "addBookCategory";

                        foreach (ListItem item in TagsDropDownList.Items)
                        {
                             if(item.Selected) {
                                int tagId = Int32.Parse(item.Value);
                                Dictionary<string, object> tagMap = new Dictionary<string, object> { };
                                tagMap.Add("@pBookId", bookId);
                                tagMap.Add("@pTagId", tagId);
                                DataProvider.getInstance.ExecuteQuery(addBookTag, tagMap);
                            }
                        }

                        Dictionary<string, object> categoryMap = new Dictionary<string, object> { };
                        categoryMap.Add("@pBookId", bookId);
                        categoryMap.Add("@pCategoryId", CategoryDropDownList.SelectedValue);
                        DataProvider.getInstance.ExecuteQuery(addBookCategory, categoryMap);

                        //Response.Redirect("User.aspx");
                        //thong bao
                    }
                    else
                    {
                        //thong bao
                    }
                }
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }
        }
    }
}