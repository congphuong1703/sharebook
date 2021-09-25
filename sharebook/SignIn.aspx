<%@ Page Title="" Language="C#" MasterPageFile="~/Authen.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="sharebook.SignIn" %>

<asp:Content ID="RightContent" ContentPlaceHolderID="AuthenContent" runat="server">
    <div class="row px-3 mb-4">
        <div class="line"></div>
        <h2 class="or text-center">Đăng Nhập</h2>
        <div class="line"></div>
    </div>
    <div class="row px-3">
        <label class="mb-1">
            <h6 class="mb-0 text-sm">Email</h6>
        </label>
        <input class="mb-4" type="text" name="email" placeholder="Nhập email">
    </div>
    <div class="row px-3">
        <label class="mb-1">
            <h6 class="mb-0 text-sm">Mật khẩu</h6>
        </label>
        <input type="password" name="password" placeholder="Nhập mật khẩu">
    </div>
    <div class="row px-3 mb-4">
        <a href="ForgotPassword.aspx" class="ml-auto mb-0 text-sm">Quên mật khẩu?</a>
    </div>
    <div class="row mb-3 px-3">
        <button type="submit" class="btn btn-blue text-center">Đăng nhập</button>
    </div>
    <div class="row mb-4 px-3"><small class="font-weight-bold">Chưa có tài khoản?&ensp;<a href="SignUp.aspx" class="text-danger ">Đăng ký</a></small> </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>Đăng Nhập</title>
</asp:Content>
