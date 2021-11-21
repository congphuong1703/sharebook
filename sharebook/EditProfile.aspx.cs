using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using sharebook.model;


namespace sharebook
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["login"] == false)
            {
                Response.Write("<script>alert('Bạn chưa đăng nhập !');</script>");
                Response.Redirect("SignIn.aspx");
            }
            if(!IsPostBack)
            {

                UserModel userModel = (UserModel)Session["user"];
                email.Text = userModel.email;
                username.Text = userModel.name;

                if(userModel.avatar == "")
                {
                    avatarHere.Src = "Images/default-avatar.png";
                } else
                {
                    avatarHere.Src = userModel.avatar;
                }
            }


        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string userId = Request.QueryString["user_id"];

            var newEmail = email.Text;
            var newName = username.Text;
            var newPassword = password.Text;

            string procedure = "updateProfile";
            string ava = "";
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
            } else
            {
                ava = avatarHere.Src;
            }

            Dictionary<string, Object> map = new Dictionary<string, object>();
            map.Add("@userId", int.Parse(userId));
            map.Add("@p_email", newEmail);
            map.Add("@p_name", newName);
            map.Add("@p_password", newPassword);
            map.Add("@p_avatar", ava);
            int result = DataProvider.getInstance.ExecuteNonQuery(procedure, map);

            if(result > 0)
            {
                UserModel userModel = (UserModel)Session["user"];
                userModel.email = newEmail;
                userModel.name = newName;
                userModel.password = newPassword;
                userModel.avatar = ava;

                Response.Write("<script>alert('Cập nhật profile thành công !');</script>");
                Response.Redirect("User.aspx");

            } else
            {
                Response.Write("<script>alert('Cập nhật profile thất bại !');</script>");
            }

        }
    }
}