<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<WebsiteBanXeHoi.Controllers.NavLink>>" %>

<div class="item">
    <% foreach(var link in Model) { %>
        <a href="<%= Url.RouteUrl(link.RouteValues) %>" class="<%= link.IsSelected ? "selected" : "" %>" >
        <%= link.Text %>
    </a>
<% } %>


</div>
