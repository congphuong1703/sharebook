<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="sharebook.User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Trang cá nhân</title>
    <link href="Content/profile.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container db-social">
        <div class="jumbotron jumbotron-fluid"></div>
        <asp:Repeater ID="RepeaterProfile" runat="server">
            <ItemTemplate>
                <div class="container-fluid">
                    <div class="row justify-content-center">
                        <div class="col-xl-11">
                            <div class="widget head-profile has-shadow">
                                <div class="widget-body pb-0">
                                    <div class="row d-flex align-items-center">
                                        <div class="col-xl-6 col-md-6 d-flex justify-content-lg-start justify-content-md-start justify-content-center">
                                            <ul>
                                                <li>
                                                    <div class="counter"><%#Eval("favourite") %></div>
                                                    <div class="heading">Lưu trữ</div>
                                                </li>
                                                <li>
                                                    <div class="counter"><%#Eval("comment") %></div>
                                                    <div class="heading">Bình luận</div>
                                                </li>
                                                <li>
                                                    <div class="counter"><%#Eval("book") %></div>
                                                    <div class="heading">Bài viết</div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-xl-4 col-md-4 d-flex justify-content-center">
                                            <div class="image-default">
                                                <img class="rounded-circle" src="<%#Eval("avatar") %>" alt="...">
                                            </div>
                                            <div class="infos">
                                                <h2><%#Eval("name") %></h2>
                                                <div class="location"><%#Eval("email") %></div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 col-md-2 d-flex justify-content-lg-end justify-content-md-end justify-content-center">
                                            <div class="follow">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div>
        </div>
    </div>
</asp:Content>
