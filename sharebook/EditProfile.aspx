<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="sharebook.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Chỉnh sửa trang cá nhân</title>
    <link href="Content/profile.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-edit-profile">
        <div class="container rounded bg-white mt-5 mb-5">
                <div class="row">
                    <div class="col-md-3 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                            <img class="rounded-circle mb-5 my-avatar" src="#" runat="server" id="avatarHere">
                            <asp:FileUpload runat="server" accept=".png, .jpg, .jpeg" class="form-control-file" ID="avatar" />
                            <span class="invalid-feedback">Ảnh đại diện không được để trống!</span>
                        </div>
                    </div>
                    <div class="col-md-6 border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h2 class="text-center">Sửa thông tin</h2>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-6">
                                     <div class="form-group">
                                          <label for="username">Username</label>
                                          <asp:TextBox ID="username" runat="server" CssClass="form-control" type="text" name="username" AutoCompleteType="None" placeholder="Tên mới"/>
                                    </div>

                                </div>
                                <div class="col-md-6">
                                     <div class="form-group">
                                         <label for="email">Email</label>
                                         <asp:TextBox ID="email" runat="server" CssClass="form-control" type="email" name="email"  AutoCompleteType="None" placeholder="Email mới" />
                                    </div>
                                </div>
                            </div>

                            <div class="row mt-2">
                                <div class="col-md-6">
                                     <div class="form-group">
                                        <label for="password">Password</label>
                                        <asp:TextBox ID="password" runat="server" CssClass="form-control" type="password" name="password"  AutoCompleteType="None"  placeholder="Mật khẩu mới" />
                                     </div>
                                </div>
                            </div>
                        
                            <div class="mt-5 text-center">
                                <div class="col-md-6">
                                     <div class="form-group">
                                        <asp:Button runat="server" CssClass="btn btn-primary" ID="btnSave" OnClick="btnSave_Click" Text="Cập nhật"/>
                                     </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                    </div>
                </div>
            </div>            
    </div>

</asp:Content>
