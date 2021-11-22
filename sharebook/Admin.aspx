<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="sharebook.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container ">
        <button type="button" class="mt-5 btn btn-primary" data-toggle="modal" id="addTagBtn" data-target="#exampleModalCenter">
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
                                <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#modalEditUser"
                                    onclick="editUser('<%#Eval("user_id") %>')">
                                    Sửa</button></td>
                            <%--<button class="btn btn-danger" type="button" onclick="deleteUser('<%#Eval("user_id") %>')">Xóa</button>--%></td>
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
                            <label for="tag-text">Tên nhãn:</label>
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
        <div class="modal fade" id="modalEditUser" tabindex="-1" role="dialog" aria-labelledby="modalEditUserTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalEditUserLongTitle">Sửa người dùng</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="userId">ID:</label>
                            <asp:TextBox runat="server" class="form-control" data-type="userId" type="text" ID="TextBox1" />
                        </div>
                        <div class="form-group">
                            <label for="userName">Tên:</label>
                            <asp:TextBox runat="server" class="form-control" data-type="userName" type="text" ID="userName" />
                        </div>
                        <div class="form-group">
                            <label for="userEmail" class="col-form-label">Email:</label>
                            <asp:TextBox runat="server" class="form-control" data-type="userEmail" type="text" ID="userEmail" />
                        </div>
                        <div class="form-group">
                            <label for="userRole" class="col-form-label">Vai trò:</label>
                            <asp:DropDownList runat="server" class="form-control"
                                data-type="userRole" type="text" ID="userRole">
                                <asp:ListItem Selected="True" Value="0">Người dùng</asp:ListItem>
                                <asp:ListItem Value="1">Admin</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="userAvatar" class="col-form-label">Ảnh đại diện:</label>
                            <asp:FileUpload runat="server" data-type="userAvatar" accept=".png, .jpg, .jpeg" ID="userAvatar" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <asp:Button runat="server" type="button" data-type="saveUser" class="btn btn-primary" ID="updateUser" Text="Lưu" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="Scripts/jquery-3.5.1.js"></script>
    <%--<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>--%>
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
        function editUser(userId) {
            console.log(userId);
            $.ajax({
                url: '/api/Manage/' + userId,
                method: 'GET',
                success: function (data) {
                    console.log("data", data);
                    if (data != undefined) {
                        $('input[data-type=userId]').val(data.id);
                        $('input[data-type=userName]').val(data.name);
                        $('input[data-type=userEmail]').val(data.email);
                        $("select[data-type=userRole] option[value='" + data.role + "']").prop('selected', true);
                    }
                },
                error: function (xhr, err) {
                    alert(xhr.responseText);
                }
            });
        }
    </script>
</asp:Content>
