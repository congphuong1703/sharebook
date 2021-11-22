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
            if (!Page.IsPostBack)
            {
                if ((UserModel)Session["user"] == null)
                {
                    Response.Redirect("SignIn.aspx");
                }
                else
                {
                    string getAllTags = "getAllTags";
                    string getAllCategories = "getAllCategories";

                    DataTable tagsTable = DataProvider.getInstance.ExecuteQuery(getAllTags);
                    DataTable categoriesTable = DataProvider.getInstance.ExecuteQuery(getAllCategories);

                    CategoryDropDownList.DataSource = categoriesTable;
                    CategoryDropDownList.DataTextField = "name";
                    CategoryDropDownList.DataValueField = "category_id";
                    CategoryDropDownList.DataBind();

                    TagsDropDownList.DataSource = tagsTable;
                    TagsDropDownList.DataTextField = "name";
                    TagsDropDownList.DataValueField = "tag_id";
                    TagsDropDownList.DataBind();

                }
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
                            string fileName = "Images/" + images.FileName;
                            string filePath = MapPath(fileName);
                            images.PostedFile.SaveAs(MapPath("~") + "/Images/" + images.PostedFile.FileName);
                            //avatar.SaveAs(filePath);
                            image = fileName;
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
                            string fileName = "Images/" + avatar.FileName;
                            string filePath = MapPath(fileName);
                            avatar.PostedFile.SaveAs(MapPath("~") + "/Images/" + avatar.PostedFile.FileName);

                            avatar.SaveAs(filePath);
                            ava = fileName;
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
                        categoryMap.Add("@pCategoryId", CategoryDropDownList.SelectedItem.Value);
                        DataProvider.getInstance.ExecuteQuery(addBookCategory, categoryMap);

                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Đăng bài thành công')", true);
                        Response.Redirect("Category.aspx");
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

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            HttpPostedFile file = images.PostedFile;
            int fileSize = file.ContentLength;
            args.IsValid = false;

            if(fileSize > 1048576) // 1mb
            {
                return;
            }
            args.IsValid = true;
        }
    }
}