<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="sharebook.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Trang cá nhân</title>
    <link href="Content/profile.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      <div class="d-flex row mt-3">
        <div class="col-lg-3">
          
        </div>
         <div class="col-lg-6">
             <div class="profile-info mb-5">
                 <h3 class="profile-name mb-4" id="profileName" runat="server"></h3>
                 <h4 class="profile-email mb-4" id="profileEmail" runat="server"></h4>
                 <h4 class="profile-related mb-4">Số bài đăng: 2</h4>
                 <h4 class="profile-related">Sách đã lưu trữ: 3</h4>
             </div>

             <div class="profile-action">
                 <div class="container">   
                     <div class="row">
                         <div class="col-lg-4">
                             <a href="EditProfile.aspx" class="btn-action">Sửa thông tin</a>
                         </div>
                         <div class="col-lg-4">
                             <a href="#"  class="btn-action">Xem bài đăng</a>
                         </div>
                         <div class="col-lg-4">
                             <a href="#"  class="btn-action">Xem kho lưu trữ</a>
                         </div>
                     </div>
                 </div>
             </div>
        </div>
        <div class="col-lg-3">
            
        </div>
    </div>
</asp:Content>
