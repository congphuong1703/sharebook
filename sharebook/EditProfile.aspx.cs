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
            Users user = (Users)Session["user"];
            hdfUserID.Value = user.Id.ToString();


        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var newEmail = email.Text;
            var newName = username.Text;
            var newPassword = password.Text;

            string procedure = "updateProfile";

            Dictionary<string, Object> map = new Dictionary<string, object>();
            map.Add("@userId", int.Parse(hdfUserID.Value));
            map.Add("@p_email", newEmail);
            map.Add("@p_name", newName);
            map.Add("@p_password", newPassword);
            int result = DataProvider.getInstance.ExecuteNonQuery(procedure, map);

            if(result > 0)
            {
                Response.Write("<script>alert('Cập nhật profile thành công !');</script>");
                Response.Redirect("User.aspx");

            } else
            {
                Response.Write("<script>alert('Cập nhật profile thất bại !');</script>");
            }

        }
    }
}