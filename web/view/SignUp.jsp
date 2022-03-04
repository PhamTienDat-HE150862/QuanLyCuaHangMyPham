<%-- 
    Document   : SignUp
    Created on : Feb 27, 2022, 10:19:46 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="model.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/login.css">
    <%
    ArrayList<Account> acc = (ArrayList<Account>) request.getAttribute("acc");
    %>
</head>

<body>
    <body id="particles-js"></body>
    <div class="animated bounceInDown">
        <div class="container">
            <span class="error animated tada" id="msg"></span>
            <form method="post" name="form" class="box" onsubmit="return checkStuff()">
                <h1>Wellcome!</h1>

                <input type="text" name="username" placeholder="Tên đăng nhập" autocomplete="off">
                <i class="typcn typcn-eye" id="eye"></i>
                <input type="password" name="password" placeholder="Mật khẩu" id="pwd" autocomplete="off">
                <input type="password" name="re-password" placeholder="Nhập lại mật khẩu" id="pwd" autocomplete="off">
                <p style="color: white">${error}</p>
                <input type="submit" value="Đăng ký" class="btn1">
            </form>
        </div>
    </div>
</body>

</html>