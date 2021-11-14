<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="sharebook.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style>
		.table-condensed tr th {
			border: 0px solid #222e3c;
			color: white;
			background-color: #222e3c;
		}

		.table-condensed, .table-condensed tr td {
			border: 0px solid #000;
		}

		tr:nth-child(even) {
			background: #f8f7ff
		}

		tr:nth-child(odd) {
			background: #fff;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    		<div class="row mb-2 mb-xl-3">
						<div class="col-auto d-none d-sm-block">
							<h3><strong>List Users</strong></h3>
						</div>
			            
			</div>
			<div class="row mb-2 mb-xl-3">				
				<asp:GridView ID="ListUser" runat="server" AutoGenerateColumns="false" UseAccessibleHeader="true" CssClass="table table-condensed table-hover" Width="100%" >
					    <Columns>
							<asp:BoundField  DataField="Id" HeaderText="STT" />
							<asp:BoundField  DataField="name" HeaderText="Username" />
							<asp:BoundField  DataField="email" HeaderText="Email" />
							<asp:BoundField  DataField="verify" HeaderText="Verify" />
               
						</Columns>
                </asp:GridView>
			</div>
</asp:Content>
