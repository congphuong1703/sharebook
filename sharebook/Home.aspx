<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="sharebook._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main-card-2">
        <div class="d-flex row ">
            <div class="col-lg-8">
                <div class="card-top-left">
                      <img src="https://i.imgur.com/uNGdWHi.png" class="image">
                </div>
                <div class="card-bottom-left mt-5">
                    <a href="Category.aspx" class="btn btn-primary">Đọc sách</a>
                    <a href="Post.aspx" class="btn btn-primary">Đăng sách</a>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card-right">
                      <img src="https://i.imgur.com/uNGdWHi.png" class="image">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>Trang chủ</title>
    <link href="Content/Home.css" rel="stylesheet" />
</asp:Content>