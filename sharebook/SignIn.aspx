<%@ Page Title="" Language="C#" MasterPageFile="~/Authen.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="sharebook.SignIn" %>

<asp:Content ID="RightContent" ContentPlaceHolderID="AuthenContent" runat="server">
    <form id="form_login" runat="server">
        <div class="row px-3 mb-4">
            <div class="line"></div>
            <h2 class="or text-center">Đăng Nhập</h2>
            <div class="line"></div>
        </div>
        <asp:Label runat="server" ID="errorNotify" class="text-danger text-center"></asp:Label>
        <div class="row px-3">
            <label class="mb-1">
                <h6 class="mb-0 text-sm">Email</h6>
            </label>
            <asp:TextBox ID="email" runat="server" class="mb-4" type="text" name="email" placeholder="Nhập email" />
        </div>
        <div class="row px-3">
            <label class="mb-1">
                <h6 class="mb-0 text-sm">Mật khẩu</h6>
            </label>
            <asp:TextBox ID="password" runat="server" type="password" name="password" placeholder="Nhập mật khẩu" />
        </div>
        <div class="row px-3 mb-4">
            <a href="ForgotPassword.aspx" class="ml-auto mb-0 text-sm">Quên mật khẩu?</a>
        </div>
        <div class="row mb-3 px-3">
            <asp:Button ID="logginBtn" type="submit" runat="server" Text="Đăng nhập" class="btn btn-blue text-center" OnClick="logginBtn_Click" />
        </div>
        <div class="row mb-4 px-3"><small class="font-weight-bold">Chưa có tài khoản?&ensp;<a href="SignUp.aspx" class="text-danger ">Đăng ký</a></small> </div>
    </form>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>Đăng Nhập</title>
</asp:Content>
