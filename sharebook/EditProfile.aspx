<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="sharebook.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Chỉnh sửa trang cá nhân</title>
    <link href="Content/profile.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-edit-profile">
      <%--  <div class="container rounded bg-white mt-5 mb-5">
                <div class="row">
                    <div class="col-md-3 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQF2psCzfbB611rnUhxgMi-lc2oB78ykqDGYb4v83xQ1pAbhPiB&usqp=CAU"><span class="font-weight-bold">Amelly</span><span class="text-black-50">amelly12@bbb.com</span><span> </span></div>
                    </div>
                    <div class="col-md-6 border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Profile Settings</h4>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-6"><label class="labels">Name</label><input type="text" class="form-control" placeholder="first name" value=""></div>
                                <div class="col-md-6"><label class="labels">Surname</label><input type="text" class="form-control" value="" placeholder="surname"></div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12"><label class="labels">PhoneNumber</label><input type="text" class="form-control" placeholder="enter phone number" value=""></div>
                                <div class="col-md-12"><label class="labels">Address</label><input type="text" class="form-control" placeholder="enter address" value=""></div>
                                <div class="col-md-12"><label class="labels">Email ID</label><input type="text" class="form-control" placeholder="enter email id" value=""></div>
                                <div class="col-md-12"><label class="labels">Education</label><input type="text" class="form-control" placeholder="education" value=""></div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6"><label class="labels">Country</label><input type="text" class="form-control" placeholder="country" value=""></div>
                                <div class="col-md-6"><label class="labels">State/Region</label><input type="text" class="form-control" value="" placeholder="state"></div>
                            </div>
                            <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="button">Save Profile</button></div>
                        </div>
                    </div>
                    <div class="col-md-3">
                    </div>
                </div>
            </div>     --%>       



        <div class="container">
            <div class="row">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
                         <h2 class="text-center">Sửa thông tin</h2>
                           <asp:HiddenField ID="hdfUserID" runat="server"/>
                          <div class="form-group">
                            <label for="username">Username</label>
                            <asp:TextBox ID="username" runat="server" CssClass="form-control" type="text" name="username" AutoCompleteType="None" placeholder="Tên mới"/>
                          </div>
                          <div class="form-group">
                            <label for="email">Email</label>
                            <asp:TextBox ID="email" runat="server" CssClass="form-control" type="email" name="email"  AutoCompleteType="None" placeholder="Email mới" />
                          </div>
                          <div class="form-group">
                            <label for="password">Password</label>
                            <asp:TextBox ID="password" runat="server" CssClass="form-control" type="password" name="password"  AutoCompleteType="None"  placeholder="Mật khẩu mới" />
                          </div>
                           <asp:Button runat="server" CssClass="btn btn-primary" ID="btnSave" OnClick="btnSave_Click" Text="Cập nhật"/>
                </div>
                <div class="col-lg-3"></div>
            </div>
        </div>
       
    </div>

</asp:Content>
