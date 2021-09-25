﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Authen.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="sharebook.SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AuthenContent" runat="server">
    <div class="row px-3 mb-4">
        <div class="line"></div>
        <h2 class="or text-center">Đăng ký</h2>
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
    <div class="row mb-3 px-3 mt-4">
        <button type="submit" class="btn btn-blue text-center">Đăng ký</button>
    </div>
    <div class="row mb-4 px-3"><small class="font-weight-bold">Bạn đã có tài khoản?&ensp;<a href="SignIn.aspx" class="text-danger ">Đăng nhập</a></small> </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>Đăng Ký</title>
</asp:Content>
