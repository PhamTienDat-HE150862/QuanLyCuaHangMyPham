<%-- 
    Document   : login
    Created on : Feb 27, 2022, 9:54:09 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/login.css">
</head>

<body>
    <div class="animated bounceInDown">
        <div class="container">
            <span class="error animated tada" id="msg"></span>
            <form method="post" name="form1" class="box" onsubmit="return checkStuff()">
                <h4>Welcome back!<br/> <span> AnhTuyet Cosmetic</span></h4>
                <h5>Đăng nhập bằng tài khoản của bạn!</h5>
                <input type="text" name="username" placeholder="Tên đăng nhập" autocomplete="off">
                <i class="typcn typcn-eye" id="eye"></i>
                <input type="password" name="password" placeholder="Mật khẩu" id="pwd" autocomplete="off">
                <span style="color: red">${ErrorLogin}</span>
                <a href="#" class="forgetpass">Quên mật khẩu?</a>
                <input type="submit" value="Đăng nhập" class="btn1">
            </form>
         
            <a href="SignUp" class="dnthave">Chưa có tài khoản? Đăng ký!</a>
        </div>
        <div class="footer">
        </div>
    </div>
</body>

</html>
