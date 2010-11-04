<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DomainModel.Entities.Product>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Trang xem chi tiết sản phẩm
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2 style="background-color:ThreeDFace">Chi tiết xe : <%=Model.Name%></h2>
    
   <ul>
         <li><h3 style="background-color:Gray ; border-color:Black">Tên xe:</h3> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%="- "+Model.Name%> </li>
         <li><h3 style="background-color:Gray ; border-color:Black">Mô tả:</h3> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%="- "+Model.Description %></li>
         <li><h3 style="background-color:Gray ; border-color:Black">Nhà sản xuất:</h3> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%="- "+Model.Manufacture.Name %></li>
        <li><h3 style="background-color:Gray ; border-color:Black">Nơi sản xuất:</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%="- "+Model.MadeIn %></li>
        <li><h3 style="background-color:Gray ; border-color:Black">Thời trang:</h3> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%="- "+Model.Model.Name %></li>
        <li><h3 style="background-color:Gray ; border-color:Black">Giá cả:</h3> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%="- "+((decimal)Model.Price).ToString("c") %></li>
        <li><h3 style="background-color:Gray ; border-color:Black">Thông số hộp số:</h3> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%="- "+Model.ThongSoHopSo.LHSo.Value %></li>
        <li><h3 style="background-color:Gray ; border-color:Black">Thông số kích thước:</h3> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%="- "+Model.ThongSoKichThuoc.KSGX1.Value%></li>
        <li><h3 style="background-color:Gray ; border-color:Black">Sản xuất tại:</h3> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%="- "+Model.MadeIn %></li>
        <li><h3 style="background-color:Gray ; border-color:Black">Năm xuất xưởng:</h3> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%="- "+Model.Model.Year %></li>
        <li><h3 style="background-color:Gray ; border-color:Black">Hình ảnh: </h3></li>
   </ul>
    
    <% if(Model.ImagePath == null) { %>
        	(Chưa có)</br>
        <% } else { %> 
	        <img alt="Hình ảnh sản phẩm" src="<%= Url.Action("GetImage", "Products", new { Model.ID }) %>"  width = "400" height = "350"/> </br>
        <% } %>
    
   
    <h4 style="background-color:ActiveBorder" ><a href="<%= Html.Encode(ViewData["returnUrl"]) %>">Quay về trang trước</a></h4>
</asp:Content>
