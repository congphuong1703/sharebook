<%@ Page Title="" Language="C#" MasterPageFile="~/BookMaster.master" AutoEventWireup="true" CodeBehind="BookDetails.aspx.cs" Inherits="sharebook.BookDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerBook" runat="server">
    <link href="./Content/BookDetail.css" rel="stylesheet" />
    <link href="./Content/Category.css" rel="stylesheet" />

    <title>Đọc sách</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentBook" runat="server">
    <div class="container mt-3">
        <div class="row">
            <div class="col-8">
                <img src="#" id="Image1" runat="server" />
            </div>
            <div class="col-4">
                <h3>Sách liên quan</h3>
                <asp:Repeater ID="RepeaterBookRelate" runat="server">
                    <ItemTemplate>
                        <label>
                            Tác giả : 
                        <a href="/User?user_id=<%#Eval("user_id") %>"><%#Eval("username")%> </a>
                        </label>
                        <div>
                            <label class="text-muted"><%#Eval("created_at") %></label>
                        </div>
                        <div>
                            <label>
                                <a href="/BookDetails?book_id=<%#Eval("book_id") %>"><%#Eval("name")%> </a>
                            </label>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
