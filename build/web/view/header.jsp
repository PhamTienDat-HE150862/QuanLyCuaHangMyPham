<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="header">
    <nav class="container navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="home">Home</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">

                <!--                    <li class="nav-item">
                                        <a class="nav-link" href="#">Sản Phẩm</a>
                                    </li>-->

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Phân Loại
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <c:forEach items="${listCategory}" var="c">
                            <a class="dropdown-item" href="?categoryID=${c.categoryID}">${c.name}</a>
                        </c:forEach>

                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="home" style="color: #fc5959">Tất cả sản phẩm...</a>
                    </div>
                </li>

                <li class="nav-item dropdown 1">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <c:if test="${account==null}">
                            Tài Khoản   
                        </c:if>
                        <c:if test="${account!=null}">
                            <b style="color: #ff9999"> <span style="color: #66ff66"> Welcome!</span> ${account.username} </b>
                        </c:if>

                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="Login">Đăng Nhập</a>
                        <a class="dropdown-item" href="SignUp">Đăng ký</a>
                        <c:if test="${account!=null}">
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="logout">Đăng xuất</a>
                        </c:if>
                    </div>
                </li>

                <c:if test="${account.role=='1'}">
                    <li class="nav-item dropdown 1">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Quản lý
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="listPoductsController">Kho hàng</a>
                            <a class="dropdown-item" href="#">Tài khoản</a>
                        </div>
                    </li>
                </c:if>
                <li class="nav-item">
                    <!-- <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Liên Hệ</a> -->
                </li>
            </ul>

            <form class="form-inline my-2 my-lg-0">
                <a id="cart" href="javascript:void(0);" class="btn btn-primary btn-sm waves-effect"><i class="zmdi zmdi-shopping-cart"> Giỏ hàng</i></a>
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
</div>
