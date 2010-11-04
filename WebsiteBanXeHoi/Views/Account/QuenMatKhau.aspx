<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Quên mật khẩu</title>
	<style type="text/css">
.newStyle1 {
	text-align: center;
	background-color: #C0C0C0;
	color: #800080;
	font-size: large;
	font-weight: bolder;
	text-decoration: none;
}
</style>
</head>
<body>
    <div class="newStyle1">
    
        <% using(Html.BeginForm("QuenMatKhau", "Account")) { %>
            <div>Bạn đã đăng nhập sai quá 3 lần!</div>
            <i>Xin vui lòng nhập địa chỉ email để chúng tôi xác nhận và gửi lại mật khẩu và tài khoản đăng nhập.</i>
            
            <div>Nhập email của bạn: <%= Html.TextBox("email")%></div>
            <h3>Mã xác nhận:</h3>
            <p>Hãy điền mã xác nhận sau:</p>
            <%= Html.Captcha("myCaptcha") %> 
            <div>Gõ lại mã xác nhận: <%= Html.TextBox("attempt") %></div>
            <%if ((bool?)ViewData["KiemTraCaptcha"] == false)
              { %>
                <div>Bạn đã nhập sai chuỗi nhận dạng. Vui lòng nhập lại!</div>
            <%} %>
            <p>
			<input type="submit" value="Gửi email" style="width: 136px; background-color: #004080; color: #FFFFFF; font-family: 'Segoe UI', Tahoma, Geneva, Verdana; font-size: medium; font-style: normal; font-weight: bold;" /></p>
        <% } %>
        
    </div>
</body>
</html>
