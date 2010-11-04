<%@ Import Namespace="WebsiteBanXeHoi.HtmlHelpers" %>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DomainModel.Entities.Product>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Chào mừng bạn đến với Website bán xe hơi
    <%= string.IsNullOrEmpty((string)ViewData["CurrentCategory"])
        ? " :Trang chủ"
        : " :Loại " + Html.Encode(ViewData["CurrentCategory"])   
    %>
    
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% foreach(var product in Model) { %>
        <% Html.RenderPartial("ProductSummary", product); %>
    <% } %>

<div class="pager">
Trang: <%= Html.PageLinks((int)ViewData["CurrentPage"],(int)ViewData["TotalPages"],x => Url.Action("List", new { page = x, category = ViewData["CurrentCategory"] })) %>
</div>

</asp:Content>
