<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Quản lý đăng nhập</title>
	<style type="text/css">
.logonheader {
	font-family: "times New Roman", Times, serif;
	font-size: x-large;
	font-weight: bold;
	font-style: normal;
	text-transform: capitalize;
	color: #FF0000;
	background-color: #000000;
	text-align: center;
	border: medium dashed #FFFF00;
}
	.divAlarm {
		background-color: #000066;
		text-decoration: underline;
		font-size: medium;
		font-weight: bolder;
		color: #FFFF00;
	}
	.divLogon {
		font-size: small;
		font-weight: bolder;
		font-style: italic;
		text-align: center;
	}
	.divBody {
		background-image: url('/ImageSkin/microsoft-windows-7.jpg');
	}
	.inputtextTDN {
	font-family: "Times New Roman", Times, serif;
	color: #FFFFFF;
	background-color: #000000;
	border: thin dashed #FF0000;
}
.inputtextPass {
	font-family: "Times New Roman", Times, serif;
	color: #FFFFFF;
	background-color: #000000;
	border: thin dashed #0000FF;
}
.newStyle1 {
	background-color: #000066;
	color: #FFFFFF;
}
	</style>
</head>
<body class="logonbody">

		<div class="divBody" style="width:100% ; height:100%">
			<h1 class="logonheader">Trang đăng nhập - Administrator</h1>
	   		<div class="divAlarm">
		        <% if((bool?)ViewData["lastLoginFailed"] == true) { %>
			         <div class="Message">
			        	Bạn đăng nhập thất bại . Xin vui lòng thử lại!
			        </div>
		        <% } %>
		        	<p>Hãy vui lòng đăng nhập để vào vùng quản lý website:</p>
		    </div>
		    <div>
		        <% using(Html.BeginForm()) { %>
		        <div class="divLogon">Tên đăng nhập:  <input name="name" type="text" class="inputtextTDN" style="width: 172px" /> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mật khẩu:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<input name="password" type="password" class="inputtextPass" style="width: 173px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </div>

		        <p class="divLogon"><input type="submit" value="Đăng nhập" class="newStyle1" /></p>        
		        <% } %>
	   		</div>
		</div>
</body>
</html>
