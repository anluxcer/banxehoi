<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DomainModel.Entities.Cart>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Danh sách xe hơi bạn chọn
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>Giỏ hàng</h2>
<table width="90%" align="center">
<thead><tr>
<th align="center">Số lượng xe</th>
<th align="left">Tên xe</th>
<th align="right">Giá</th>
<th align="right">Thành tiền</th>
</tr></thead>
<tbody>
<% foreach(var line in Model.Lines) { %>
<tr>
<td align="center"><%= line.Quantity %></td>
<td align="left"><%= line.Product.Name %></td>
<td align="right"><%= ((decimal)line.Product.Price).ToString("c") %></td>
<td align="right">
<%= ((decimal)(line.Quantity*(int)line.Product.Price)).ToString("c") %>
</td>

<td>
<% using(Html.BeginForm("RemoveFromCart", "Cart")) { %>
<%= Html.Hidden("ID", line.Product.ID) %>
<%= Html.Hidden("returnUrl", ViewData["returnUrl"]) %>
<input type="submit" value="Xóa hàng" />
<% } %>
</td>

</tr>
<% } %>
</tbody>
<tfoot><tr>
<td colspan="3" align="right">Tổng tiền:</td>
<td align="right">
<%= Model.ComputeTotalValue().ToString("c") %>
</td>
</tr></tfoot>
</table>

<p align="center" class="actionButtons">
<a href="<%= Html.Encode(ViewData["returnUrl"]) %>">Tiếp tục chọn xe</a>
        <%= Html.ActionLink("Đăng ký mua xe", "CheckOut") %> <!-- ActionLink là đi theo truy tim link theo bảng router -->
</p>
</asp:Content>