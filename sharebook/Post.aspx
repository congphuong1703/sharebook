<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Post.aspx.cs" Inherits="sharebook.Post" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>Đăng bài</title>
    <link href="Content/Post.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-body">
        <div class="row">
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                        <h3>Đăng bài viết</h3>
                        <p>Điền đầy đủ thông tin phía bên dưới.</p>
                        <div class="requires-validation" novalidate>
                            <div class="col-md-12">
                                <label class="post">
                                    Tiêu đề
                                    <label class="require">*</label>
                                </label>
                                <asp:TextBox runat="server" class="form-control" ID="name" type="text" name="name" placeholder="Tiêu đề" required />
                                <div class="invalid-feedback">Tiêu đề không được trống!</div>
                            </div>
                            <div class="col-md-12 mt-3">
                                <label class="post">Ảnh đại diện </label>
                                <asp:FileUpload runat="server" accept=".png, .jpg, .jpeg" class="form-control-file" ID="avatar" />
                                <div class="invalid-feedback">Ảnh đại diện không được để trống!</div>
                            </div>
                            <div class="col-md-12 mt-3">
                                <label class="post">
                                    Nội dung
                                    <label class="require">*</label>
                                </label>
                                <asp:FileUpload runat="server" accept=".pdf" class="form-control-file" ID="images" />
                                <div class="invalid-feedback">Nội dung không được để trống!</div>
                            </div>
                            <div class="col-md-12 mt-3">
                                <label class="post">
                                    Mô tả
                                </label>
                                <textarea runat="server" class="form-control" id="description" type="text" name="description" placeholder="Mô tả" required />
                                <div class="invalid-feedback">Mô tả không được để trống</div>
                            </div>
                            <div class="col-md-12 mt-3">
                                <label class="post">
                                    Danh mục
                                </label>
                                <asp:DropDownList ID="CategoryDropDownList" class="form-control" runat="server">
                                </asp:DropDownList>
                                <div class="invalid-feedback">Danh mục không được để trống</div>
                            </div>
                            <div class="col-md-12 mt-3">
                                <label class="post">
                                    Nhãn
                                </label>
                                <asp:ListBox ID="TagsDropDownList" class="form-control" SelectionMode="multiple" runat="server"></asp:ListBox>
                                <div class="invalid-feedback">Nhãn không được để trống</div>
                            </div>
                            <div class="form-button mt-3">
                                <asp:Button ID="postBtn" OnClick="Post_Click" Text="Đăng bài" type="button" runat="server" class="btn btn-primary" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
