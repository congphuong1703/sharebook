<%@ Page Title="" Language="C#" MasterPageFile="~/Authen.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="sharebook.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AuthenContent" runat="server">
    <form id="form_forgot_password" runat="server">
        <div class="row px-3 mb-4">
            <div class="line"></div>
            <h2 class="or text-center">Quên mật khẩu</h2>
            <div class="line"></div>
        </div>
        <asp:Label runat="server" ID="errorNotify"></asp:Label>
        <div class="row px-3">
            <label class="mb-1">
                <h6 class="mb-0 text-sm">Email</h6>
            </label>
            <asp:TextBox ID="txtEmail" runat="server" class="mb-4" type="text" name="email" placeholder="Nhập email" />
        </div>
        <div class="row mb-3 px-3 mt-4">
            <asp:Button ID="forgetPasswordBtn" runat="server" type="submit" Text="Lấy lại mật khẩu" class="btn btn-blue text-center" OnClick="forgetPasswordBtn_Click" />
        </div>
        <div class="row mb-4 px-3"><small class="font-weight-bold">Bạn đã có tài khoản?&ensp;<a href="SignIn.aspx" class="text-danger ">Đăng nhập</a></small> </div>
    </form>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>Quên mật khẩu</title>
</asp:Content>
