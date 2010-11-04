<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Đăng ký mua xe
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>Đăng ký ngay</h2>
Hãy điển thông tin của bạn vào bên dưới , chúng tôi sẽ gửi qua email các hướng dẫn để hoàn tất quá trình mua xe của bạn!
<%= Html.ValidationSummary() %> 

<% using(Html.BeginForm()) { %>
<h3>Chuyển hàng đến: </h3>
<div>Họ và tên: <%= Html.TextBox("Name") %></div>

<h3>Thông tin chi tiết người nhận: </h3>
<div>Ngày sinh: <%= Html.TextBox("BirthOfDay")%></div>
<div>Nghề nghiệp: <%= Html.TextBox("Career")%></div>
<div>Điện thoại nhà: <%= Html.TextBox("HomePhone") %></div>
<div>Điện thoại di động: <%= Html.TextBox("Mobile") %></div>
<div>Email: <%= Html.TextBox("Email") %></div>

<h3>Thông tin địa chỉ người nhận: </h3>
<div>Địa chỉ: <%= Html.TextBox("Address")%></div>
<div>Thành phố: <%= Html.TextBox("City") %></div>
<div>Bang/Tiểu bang: <%= Html.TextBox("State") %></div>
<div>Mã: <%= Html.TextBox("Zip") %></div>
<div>Quốc gia: <%= Html.TextBox("Country") %></div>

<h3>Tùy chọn</h3>
<%= Html.CheckBox("GiftWrap") %> Đính kèm quà tặng
<p align="center"><input type="submit" value="Hoàn tất" /></p>
<% } %>
</asp:Content>