<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="sharebook.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container ">
        <button type="button" class="mt-3 btn btn-primary" data-toggle="modal" id="addTagBtn" data-target="#exampleModalCenter">
            Thêm nhãn
        </button>
        <table class="mt-3 table table-striped table-hover">
            <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Tên</th>
                    <th scope="col">Email</th>
                    <th scope="col">Vai trò</th>
                    <th scope="col">Hành động</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="RepeaterUsers" runat="server">
                    <ItemTemplate>
                        <tr>
                            <th scope="row"><%#Eval("user_id") %></th>
                            <td><%#Eval("name") %></td>
                            <td><%#Eval("email") %></td>
                            <td><%#Eval("role") %></td>
                            <td>
                                <button class="btn btn-danger" type="button" onclick="deleteUser('<%#Eval("user_id") %>')">Xóa</button></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Thêm mới nhãn</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="message-text" class="col-form-label">Tên nhãn:</label>
                            <input class="form-control" type="text" id="tag-text" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="button" class="btn btn-primary" id="addTag">Lưu</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="Scripts/jquery-3.5.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/admin.js"></script>
    <script>
        function deleteUser(userId) {
            console.log("userId", userId)
            $.ajax({
                url: '/api/Manage/' + userId,
                method: 'Delete',
                success: function () {
                    alert("Xóa thành công");
                },
                error: function (xhr, err) {
                    alert(xhr.responseText);
                }
            });
        }
    </script>
</asp:Content>
