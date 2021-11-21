<%@ Page Title="" Language="C#" MasterPageFile="~/Authen.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="sharebook.SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AuthenContent" runat="server">
    <form runat="server" id="form1">
        <div class="row px-3 mb-4">
            <div class="line"></div>
            <h2 class="or text-center">Đăng ký</h2>
            <div class="line"></div>
        </div>
        <asp:Label class="text-danger text-center" runat="server" ID="errorNotify"></asp:Label>
        <div class="row px-3">
            <label class="mb-1">
                <h6 class="mb-0 text-sm">Họ và tên</h6>
            </label>
            <asp:TextBox ID="txtName" runat="server" type="text" name="name" placeholder="Nhập họ và tên" />
            <asp:RequiredFieldValidator ErrorMessage="Họ và tên không được trống" ControlToValidate="txtName" runat="server" ForeColor="Red" />
        </div>
        <div class="row px-3">
            <label class="mb-1">
                <h6 class="mb-0 text-sm">Email</h6>
            </label>
            <asp:TextBox ID="txtEmail" runat="server" type="email" name="email" placeholder="Nhập email" />
            <asp:RegularExpressionValidator ErrorMessage="Bạn nhập không đúng định dạng email" ControlToValidate="txtEmail" runat="server" ValidationExpression="\S+@\S+\.\S+" ForeColor="Red" />

        </div>
        <div class="row px-3">
            <label class="mb-1">
                <h6 class="mb-0 text-sm">Mật khẩu</h6>
            </label>
            <asp:TextBox ID="txtPassword" runat="server" type="password" name="password" placeholder="Nhập mật khẩu" />
            <asp:CustomValidator ID="CustomValidator2" runat="server"
                ControlToValidate="txtPassword" Display="Dynamic"
                ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate"
                SetFocusOnError="True"></asp:CustomValidator>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

        </div>
        <div class="row px-3">
            <label class="mb-1">
                <h6 class="mb-0 text-sm">Nhập lại mật khẩu</h6>
            </label>
            <asp:TextBox ID="txtConfirmPassword" runat="server" type="password" name="confirmPassword" placeholder="Nhập lại mật khẩu" />
            <asp:CompareValidator ID="CompareValidator2" runat="server"
                ErrorMessage="Mật khẩu mới không khớp" ControlToCompare="txtPassword"
                ControlToValidate="txtConfirmPassword" ForeColor="Red"></asp:CompareValidator>
        </div>
        <div class="row mb-3 px-3 mt-4">
            <asp:Button runat="server" ID="signUp" Text="Đăng ký" type="submit" class="btn btn-blue text-center" OnClick="signUp_Click" />
        </div>
        <div class="row mb-4 px-3"><small class="font-weight-bold">Bạn đã có tài khoản?&ensp;<a href="SignIn.aspx" class="text-danger ">Đăng nhập</a></small> </div>
    </form>
    <script>

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>Đăng Ký</title>
</asp:Content>
