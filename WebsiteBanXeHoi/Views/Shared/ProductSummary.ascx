<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DomainModel.Entities.Product>" %>
<div class="item">

   <% if(Model.ImagePath != null) { %>
<div style="float:left; margin-right:20px">
<img src="<%=Url.Action("GetImage", "Products", new { Model.ID }) %>"  width="100" , alt="", height="100"/>

</div>
<% } %>

    <h3><%= Model.Name %></h3>
        <%= Model.Description %>
       
    <h4><%= ((decimal)Model.Price).ToString("c")%></h4>
    
     <%using (Html.BeginForm("XemChiTiet", "Products"))
        { %>
            <%=Html.Hidden("ID") %>
            <%= Html.Hidden("returnUrl",ViewContext.HttpContext.Request.Url.PathAndQuery) %>
            
            <input type="submit" value="Xem chi tiết sản phẩm" />
      <%} %> 
      
     
      <% using(Html.BeginForm("AddToCart", "Cart")) { %>
    <%= Html.Hidden("ID") %>
    <%= Html.Hidden("returnUrl",ViewContext.HttpContext.Request.Url.PathAndQuery) %>
        <%if (Model.Status == true)
          {%>
            <input type="submit" value="+ Thêm vào giỏ hàng" />
          <%} %>
          <%else
            { %> 
            
            <input type="submit" value="+ Thêm vào giỏ hàng" disabled="disabled"/>
            
            <%} %>
  
<% } %>
   
        <h5><%= "Sản xuất tại: " + Model.MadeIn %></h5>
        <h5>Có hàng</h5>
     
</div>