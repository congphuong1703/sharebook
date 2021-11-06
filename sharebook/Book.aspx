<%@ Page Title="" Language="C#" MasterPageFile="~/BookMaster.Master" AutoEventWireup="true" CodeBehind="Book.aspx.cs" Inherits="sharebook.Book" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderBook" runat="server">
    <link href="./Content/Category.css" rel="stylesheet" />
    <link href="./Content/book.css" rel="stylesheet" />
    <title>Sách</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentBook" runat="server">
    <div class="container mt-3">
        <div class="row">
            <div class="col-2">
                <img data-v-5e990434="" src="https://images.viblo.asia/avatar/bafbf760-7a06-43c4-9f66-977a425c6896.jpg" srcset="https://images.viblo.asia/avatar-retina/bafbf760-7a06-43c4-9f66-977a425c6896.jpg 2x" alt="Avatar" class="avatar avatar--xxl">
            </div>
            <div class="col-10">
                <div class="row">
                    <div class="col-12">
                        <div class="col-2">
                            <h6 runat="server" id="authorName"></h6>
                        </div>
                        <div class="col-4">
                            <asp:Label ID="createdAt" class="text-muted" runat="server" />
                        </div>
                        <div class="col-6">
                            <asp:Repeater ID="RepeaterBookTags" runat="server">
                                <ItemTemplate>
                                    <a href="#" class="el-tag tag el-tag--info el-tag--mini" data-v-1ebc36b8="" data-v-190ce5c0=""><%#Eval("name") %>
                                    </a>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="row">
                            <div class="col-9">
                                <div class="col-12">
                                    <h3 runnat="server" id="bookName"></h3>
                                </div>
                                <div class="col-12">
                                    <p>
                                        <asp:Label ID="description" runat="server" />
                                    </p>
                                </div>
                                <div class="col-12">
                                    <div class="btn-process">
                                        <button class="btn btn-primary">Đọc sách</button>
                                        <button class="btn btn-primary">Tải xuống</button>
                                        <button class="btn btn-primary">Đọc sau</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="section-title">
                                    <h4 class="text-uppercase">Phản hồi
                                    </h4>
                                    <hr class="section-title__filler">
                                </div>
                                <asp:Repeater ID="RepeaterBookComments" runat="server">
                                    <ItemTemplate>
                                        <a href="/User?user_id=<%#Eval("user_id") %>" class="d-flex mr-05"><%#Eval("name")%> : <%#Eval("comment") %></a>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
