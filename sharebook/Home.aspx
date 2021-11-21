<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="sharebook._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main-card-3">
        <div class="container">
            <div class="d-flex row ">
                <div class="col-lg-6">
                    <div class="m-4">
                        <h2 class="title-home">Sharebook</h2>
                        <p class="text-home">Phần mềm đọc và lưu trữ sách trực tuyến được thực hiện bởi nhóm sinh viên FITHOU</p>
               
                        <div class="mt-5 group-btn">
                            <a href="Category.aspx" class="btn btn-primary-custom">Đọc sách</a>
                            <a href="Post.aspx" class="btn btn-primary-custom">Đăng sách</a>
                        </div>
                    </div>
              
                </div>
                <div class="col-lg-6">
               
                </div>
            </div>
            
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>Trang chủ</title>
    <link href="Content/home.css" rel="stylesheet" />
</asp:Content>