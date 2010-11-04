﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DomainModel.Entities.Cart>" %>

<% if(Model.Lines.Count > 0) { %>
<div id="cart">
<span class="caption">
    <b>Giỏ hàng của bạn có:</b>
    <%= Model.Lines.Sum(x => x.Quantity) %> xe.
    <br />        
    Tổng tiền: <%= Model.ComputeTotalValue().ToString("c") %>
</span>

<%= Html.ActionLink("Xem giỏ hàng", "Index", "Cart", new { returnUrl = Request.Url.PathAndQuery }, null)%>
</div>
<% } %>
