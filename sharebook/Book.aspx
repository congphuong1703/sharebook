<%@ Page Title="" Language="C#" MasterPageFile="~/BookMaster.Master" AutoEventWireup="true" CodeBehind="Book.aspx.cs" Inherits="sharebook.Book" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderBook" runat="server">
    <link href="./Content/Category.css" rel="stylesheet" />
    <link href="./Content/book.css" rel="stylesheet" />
    <title>Sách</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentBook" runat="server">
    <div class="container mt-3">
        <asp:Repeater ID="RepeaterBookDetail" runat="server" OnItemDataBound="RepeaterBookDetail_ItemDataBound">
            <ItemTemplate>
                <asp:HiddenField ID="hdfUserID" runat="server" Value='<%#Eval("userId")%>' />
                <asp:HiddenField ID="hdfBookID" runat="server" Value='<%#Eval("bookId")%>' />
                <asp:HiddenField ID="hdfFile" runat="server" Value='<%#Eval("file")%>' />
                <div class="row">
                    <div class="col-2">
                        <img data-v-5e990434="" src="<%#Eval("thumbnail") %>" alt="Avatar" class="thumbnail">
                    </div>
                    <div class="col-10">
                        <div class="row">
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-6">
                                        <label class="text-muted"><%#Eval("created_at") %></label>
                                        by <a href="User.aspx?user_id=<%#Eval("userId") %>"><%#Eval("author") %></a>
                                    </div>
                                    <div class="col-6">
                                        <asp:Repeater ID="RepeaterBookTags" runat="server">
                                            <ItemTemplate>
                                                <a href="Category.aspx?tag=<%#Eval("name") %>" class="el-tag tag el-tag--info el-tag--mini" data-v-1ebc36b8="" data-v-190ce5c0=""><%#Eval("name") %> </a>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="row">
                                    <div class="col-8">
                                        <div class="col-12">
                                            <h2>Sách: <%#Eval("name") %></h2>
                                        </div>
                                        <div class="col-12">
                                            <h4>Mô tả</h4>
                                            <p><%#Eval("description") %></p>
                                        </div>
                                        <div class="col-12 mt-5">
                                            <div class="btn-process mt-5">
                                                <asp:LinkButton class="btn btn-info" runat="server" ID="readBook" OnClick="Read_Click" CommandArgument='<%# Eval("bookId") %>'>Đọc sách</asp:LinkButton>
                                                <asp:LinkButton OnClick="Download_Click" ID="downloadBtn" runat="server" class="btn btn-info" CommandArgument='<%# Eval("file") %>'>Tải xuống</asp:LinkButton>
                                                <asp:LinkButton class="btn btn-info" ID="favoriteBtn" runat="server" OnClick="Favorite_Click" CommandArgument='<%# Eval("bookId") %>'>Đọc sau</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="section-title">
                                            <h4 class="text-uppercase">Phản hồi
                                            </h4>
                                            <hr class="section-title__filler">
                                        </div>
                                        <asp:Repeater ID="RepeaterBookComments" runat="server">
                                            <ItemTemplate>
                                                <a href="/User?user_id=<%#Eval("user_id") %>"><%#Eval("name")%> </a>
                                                <div>
                                                    <label class="text-muted"><%#Eval("created_at") %></label>
                                                </div>
                                                <div>
                                                    <label><%#Eval("comment") %></label>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:TextBox ID="commentContent" type="text" runat="server" name="commentContent" CssClass="form-control" placeholder="Nhập bình luận...." />
                                        <asp:Button ID="submitComment" class="btn btn-info mt-3" Text="Bình luận" OnClick="Comment_Click" runat="server" />
                                    </div>
                                </div>


                            </div>
                        </div>


                    </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <script>

</script>
</asp:Content>
