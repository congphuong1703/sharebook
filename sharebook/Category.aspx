<%@ Page Title="" Language="C#" MasterPageFile="~/BookMaster.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="sharebook.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderBook" runat="server">
    <link href="./Content/Category.css" rel="stylesheet" />
    <title>Danh mục</title>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContentBook" runat="server">
    <div class="container">
        <div class="jumbotron title-home text-center">
            <h6>Sách hiện thị dưới dạng danh sách với đầy đủ nội dung. Ví dụ bên dưới.
            </h6>
        </div>
        <span runat="server" id="message"></span>
        <asp:ListView ID="books" runat="server">
            <ItemTemplate>
                <div class="post-feed-item">
                    <a href="/User?user_id=<%#Eval("user_id") %>" class="d-flex mr-05">
                        <img src="https://images.viblo.asia/avatar/837c8044-f5b1-4e61-bf37-941100086d5f.jpg" srcset="https://images.viblo.asia/avatar-retina/837c8044-f5b1-4e61-bf37-941100086d5f.jpg 2x" alt="Avatar" class="avatar avatar--md" data-v-5e990434=""></a>
                    <div class="post-feed-item__info">
                        <div class="post-meta--inline">
                            <div class="user--inline d-inline-flex flex-shrink-0">
                                <!---->
                                <span>
                                    <div role="tooltip" id="el-popover-1909" aria-hidden="true" class="el-popover el-popper" style="width: undefinedpx; display: none;" tabindex="0">
                                        <!---->
                                        <div align="center"><i aria-hidden="true" class="el-icon-loading"></i></div>
                                    </div>
                                    <span class="el-popover__reference-wrapper"><a href="/User?user_id=<%#Eval("user_id") %>" class="mr-05 el-popover__reference" aria-describedby="el-popover-1909" tabindex="0"><%#Eval("fullname") %>
                                    </a></span></span>
                                <!---->
                            </div>
                            <!---->
                            <div class="post-meta d-inline-flex align-items-center flex-wrap">
                                <div class="text-muted mr-05">
                                    <span class="mr-05" data-tippy="" data-original-title="thg 10 23, 2:17 AM"><%#Eval("create_at") %>
                                    </span>
                                </div>
                                <!---->
                                <!---->
                            </div>
                            <!---->
                        </div>
                        <div class="post-title--inline">
                            <h3 class="word-break mr-05"><a href="/Book?book_id=<%#Eval("book_id") %>" class="link"><%#Eval("name") %></a></h3>
                            <div class="tags" data-v-190ce5c0="">
                                <asp:ListView ID="tags" runat="server">
                                    <ItemTemplate>
                                        <a href="/tags/ngon-ngu-lap-trinh" class="el-tag tag el-tag--info el-tag--mini" data-v-1ebc36b8="" data-v-190ce5c0="">ngôn ngữ lập trình
                                        </a>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                        <!---->
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex align-items-center">
                                <div class="stats">
                                    <span class="stats-item text-muted" data-tippy="" data-original-title="Bookmark: 0"><i aria-hidden="true" class="stats-item__icon fa fa-bookmark"></i>
                                        <%#Eval("favourite") %>
                                    </span><span class="stats-item text-muted" data-tippy="" data-original-title="Bình luận: 0"><i aria-hidden="true" class="stats-item__icon fa fa-comments"></i>
                                        <%#Eval("comment") %>
                                    </span>
                                </div>
                                <!---->
                                <!---->
                                <!---->
                            </div>
                            <div class="points">
                                <div class="carets">
                                    <button id="saveFavourite" runat="server" commandargument='<%#Eval("book_id")%>' type="button" href="#" class="btn btn-outline-primary" onclick="SaveFavourite_Click" data-bs-toggle="tooltip" data-bs-placement="top" title="Lưu trữ">
                                        <i class="fa fa-save"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>

</asp:Content>
