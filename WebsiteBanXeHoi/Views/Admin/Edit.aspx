<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<DomainModel.Entities.Product>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Quản lý : Chỉnh sửa <%= Model.Name %></title>
	<style type="text/css">
	.HStyle {
	font-family: verdana, Geneva, Tahoma, sans-serif;
	color: #004080;
	background-color: #C0C0C0;
}
	.style1 {
	font-family: Verdana, Geneva, Tahoma, sans-serif;
	font-size: large;
	color: #004080;
	background-color: #CCCCFF;
}
	.newStyle1 {
	background-color: #F2F2F2;
}
	.style2 {
		font-family: Verdana, Geneva, Tahoma, sans-serif;
		font-size: small;
	}
	.style3 {
		font-family: verdana, Geneva, Tahoma, sans-serif;
		color: #004080;
		background-color: #C0C0C0;
		font-size: x-large;
	}
	.style4 {
		font-family: Verdana, Geneva, Tahoma, sans-serif;
		font-size: x-large;
	}
	</style>
</head>
<body>
    <div class="newStyle1">
        
    <h2 class="style3"><span class="style4">Chỉnh sửa:</span><span class="style2">
	</span> <%= Model.Name %></h2>
    <% using (Html.BeginForm("Edit", "Admin", FormMethod.Post,new { enctype = "multipart/form-data" }))
      {%>
        <%= Html.Hidden("ID") %>
        <%= Html.Hidden("ModelID")%>
        <%= Html.Hidden("ManufactureID")%>
        <%= Html.Hidden("ImageData")%>
        <%= Html.Hidden("ImageMimeType")%>
        <%= Html.Hidden("TSKT_ID")%>
        <%= Html.Hidden("TSHS_ID")%>
    
    <p>
        <span class="style1">Tên: </span> <%= Html.TextBox("Name") %>
             <%= Html.ValidationMessage("Name") %>
    </p>
   
    <p>
        <span class="style1">Mô tả:</br><%= Html.TextArea("Description", null, 10, 50, null) %></span>
               <%= Html.ValidationMessage("Description") %>
    </p>
    
     <p>
        <span class="style1">Nơi sản xuất: </span> <%= Html.TextBox("MadeIn") %>
       <%= Html.ValidationMessage("MadeIn") %>
    </p>
    
    <p>
        <span class="style1">Giá cả: </span> <%= Html.TextBox("Price") %>
        <%= Html.ValidationMessage("Price") %>    
     </p>
    
    <p>
         <span class="style1">Hình ảnh: </span>
        <% if(Model.ImagePath == null) { %>
        	(Chưa có)
        <% } else { %> 
	        </br>
	        <img alt="Hình ảnh sản phẩm" src="<%= Url.Action("GetImage", "Products", new { Model.ID }) %>"  width = "300" height = "250"/>
        <% } %>
    </p>
		<p>
         <span class="style1">Tải ảnh mới lên:</span> <input  type="file" name="Image" value ="Đường dẫn"/>
    </p>
    
    <p>
        <span class="style1">Hiện trạng: </span> <%= Html.TextBox("Status") %>
        <%= Html.ValidationMessage("Status") %>
    </p>
    
        <input type="submit" value="Lưu" style="width: 82px; background-color: #004080; color: #FFFFFF" /> &nbsp;
        <%=Html.ActionLink("Hủy bỏ và trở về trang chỉnh sửa", "Index") %>
    <% } %>
    </div>
</body>
</html>
