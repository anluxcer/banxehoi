<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DomainModel.Entities.Product>>" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Quản lý sản phẩm
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h1>Tất cả sản phẩm</h1>
<h4 style="background-color:GrayText ; text-align:right"><div id="itemdelete"></div></h4>

<div id="summits">

    <label style="font-weight:bolder"><input id="xuatxu" type="checkbox"/>Hiện thị xuất xứ</label>
    
    <div style="text-align:center ; font-weight:bold">
        -------------------------------------------------------------------------------------------------------------------------------
    </div>
    
    <table class="Grid">
    <tr>
        <th>Mã số</th>
        <th>Tên</th>
        <th style="text-align:right">Sản xuất</th>
        <th class="NumericCol">Giá cả</th>
        <th style="text-align:right">Thao tác sửa</th>
        <th style="text-align:right">Thao tác xóa</th>
    </tr>
        <% int i = 0; %>
        
        <% foreach (var item in Model) { %>
            <tr id="item_<%=item.ID %>">
                <td><%= item.ID %></td>
                
                <td><%= item.Name %></td>
                <td style="text-align:right"><%= item.MadeIn %></td>
                
                <td class="NumericCol"><%= ((decimal)item.Price).ToString("c") %></td>
                
                <td style="text-align:right">
                
                <!--<%= Html.ActionLink("Sửa", "Edit", new {item.ID}) %>
                <%= Html.ActionLink("Xóa", "Delete", new {item.ID})%>-->
                
                     <% using(Html.BeginForm("Edit", "Admin")) { %>
                    <%= Html.Hidden("ID", item.ID) %>
                    <input type="submit" value="Sửa" />
                    <% } %>
                </td>
                
                <td style="text-align:right">
                  <%=Ajax.ActionLink("Xóa", "DeleteItem", new { item.ID }, new AjaxOptions { Confirm ="Bạn có muốn xóa ?"})%>                   
                </td>
                
                
            </tr>
        <% } %>
</table>

<div style="text-align:right">
Trang:
<%= Html.PageLinks((int)ViewData["currentPage"], (int)ViewData["totalPages"], x => Url.Action("Index", new { page = x }) ) %>

</div>
</div>

<table class="Link">
    <tr>
        <th><p><%= Html.ActionLink("< Thêm sản phẩm mới > ", "Create")%></p></th>
        <th><p><%= Html.ActionLink("< Quay về trang chủ >" , "List" , "Products")%></p></th>
        <th><p><%= Html.ActionLink("< Thoát >","LogOn" , "Account") %></p></th>
    </tr>
</table>

</asp:Content> 
