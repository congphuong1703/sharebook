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
                                            <ul class="user-info">
                                                <li>
                                                    <div class="counter"><%#Eval("favourite") %></div>
                                                      <a class="btn btn-light" data-toggle="collapse" href="#tableFavorite" role="button" aria-expanded="false" aria-controls="tableFavorite">
                                                        Lưu trữ
                                                      </a>
                                                </li>
                                                <li>
                                                    <div class="counter"><%#Eval("comment") %></div>
                                                     <a class="btn btn-light" data-toggle="collapse" href="#tableComment" role="button" aria-expanded="false" aria-controls="tableComment">
                                                         <div>Bình luận</div> 
                                                      </a>
                                                </li>
                                                <li>
                                                    <div class="counter"><%#Eval("book") %></div>
                                                     <a class="btn btn-light" data-toggle="collapse" href="#tablePost" role="button" aria-expanded="false" aria-controls="tablePost">
                                                        Bài viết
                                                      </a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-xl-3 col-md-3 d-flex justify-content-center">
                                            <div class="image-default">
                                                <img class="rounded-circle" src="<%#Eval("avatar") %>" alt="...">
                                            </div>
                                            <div class="infos">
                                                <h2><%#Eval("name") %></h2>
                                                <div class="location"><%#Eval("email") %></div>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-md-3 d-flex justify-content-lg-end justify-content-md-end justify-content-center">
                                            <div class="follow">
                                                <a href="EditProfile.aspx?user_id=<%# Eval("user_id") %>" class="btn btn-info">Sửa thông tin</a>
                                                <%--<asp:LinkButton ID="edit" OnClick="edit_Click" CommandArgument='<%#Eval("Id") %>' class="btn btn-shadow" runat="server"><i class="la la-user-plus"></i>Sửa thông tin</asp:LinkButton>--%>
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
            <div class="collapse" id="tableFavorite">
              <div class="card card-body">
                 <table class="table">
                  <thead class="thead-dark">
                    <tr>
                      <th scope="col">#</th>
                      <th scope="col">Tên sách</th>
                      <th scope="col">Ảnh</th>
                      <th scope="col">Tác giả</th>
                    </tr>
                  </thead>
                  <tbody>
                      <asp:Repeater ID="listFavorite" runat="server">
                          <ItemTemplate>
                                <tr>
                                  <th scope="row">
                                        <%# Eval("favourite_id") %>
                                  </th>
                                  <td>
                                      <a href="Book.aspx?book_id=<%# Eval("book_id")%>">
                                          <%# Eval("name") %>
                                      </a>
                                  </td>
                                  <td>
                                      <img src="<%# Eval("thumbnail") %>" alt="<%# Eval("name") %>" class="my-thumbnail" />
                                  </td>
                                  <td>
                                      <a href="User.aspx?user_id=<%# Eval("user_id") %>">
                                        <%# Eval("author") %></td>
                                      </a>
                                </tr>
                          </ItemTemplate>
                      </asp:Repeater>
                  </tbody>
              </table>
              </div>
            </div>

          <div class="collapse" id="tablePost">
              <div class="card card-body">
                 <table class="table">
                  <thead class="thead-dark">
                    <tr>
                      <th scope="col">#</th>
                      <th scope="col">Tên sách</th>
                      <th scope="col">Ảnh</th>
                      <th scope="col">Tác giả</th>
                    </tr>
                  </thead>
                  <tbody>
                      <asp:Repeater ID="listPost" runat="server">
                          <ItemTemplate>
                                <tr>
                                  <th scope="row">
                                        <%# Eval("user_id") %>
                                  </th>
                                  <td>
                                      <a href="Book.aspx?book_id=<%# Eval("user_id")%>">
                                          <%# Eval("name") %>
                                      </a>
                                  </td>
                                  <td>
                                      <img src="<%# Eval("thumbnail") %>" alt="<%# Eval("name") %>" class="my-thumbnail" />
                                  </td>
                                  <td> <%# Eval("author") %></td>

                                </tr>
                          </ItemTemplate>
                      </asp:Repeater>
                  </tbody>
              </table>
              </div>
            </div>
            

        <div>
        </div>
    </div>
</asp:Content>
