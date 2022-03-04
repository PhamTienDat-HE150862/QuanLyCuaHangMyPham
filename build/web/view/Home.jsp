<%-- 
    Document   : Home
    Created on : Feb 28, 2022, 12:04:40 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
        <!--  All snippets are MIT license http://bootdey.com/license -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="css/Home.css">
    </head>

    <div class="header">
        <nav class="container navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Home</a>
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
                            <c:forEach items= "${listCategory}" var="c" >
                                <a class="dropdown-item" href="#">${c.name}</a>

                            </c:forEach>
                            <!--                            <a class="dropdown-item" href="#">Sữa rửa mặt</a>
                                                        <a class="dropdown-item" href="#">Viên uống</a>
                                                        <a class="dropdown-item" href="#">Kem nền</a>
                                                        <a class="dropdown-item" href="#">Kem chống nắng</a>
                                                        <a class="dropdown-item" href="#">Tẩy trang</a>-->

                            <!--                            <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="#">Tất cả sản phẩm</a>-->
                        </div>
                    </li>

                    <li class="nav-item dropdown 1">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <c:if test="${account==null}">
                                Tài Khoản
                            </c:if>
                            <c:if test="${account!=null}">
                                ${account.username}
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


    <body>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">

        <div class="container">
            <div class="row clearfix">
                <c:forEach items="${listProduct}" var="o">
                    <div class="col-lg-3 col-md-4 col-sm-12">
                        <div class="card product_item">
                            <div class="body">
                                <div class="cp_img">
                                    <img src="${o.imgUrl}" alt="Product" class="img-fluid">
                                    <div class="hover">
                                        <a href="ViewDetail?id=${o.productID}" class="btn btn-primary btn-sm waves-effect"><i class="zmdi zmdi-eye"></i></a>
                                        <a href="javascript:void(0);" class="btn btn-primary btn-sm waves-effect"><i class="zmdi zmdi-shopping-cart"></i></a>
                                    </div>
                                </div>
                                <div class="product_details">
                                    <h5><a href="#">${o.name}</a></h5>
                                    <ul class="product_price list-unstyled">
                                        <!--<li class="old_price">${o.price}</li>-->
                                        <li class="new_price">${o.price} VNĐ</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>


            </div>
        </div>

        <style type="text/css">

        </style>

        <script type="text/javascript">
        </script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

        <footer class="footer_area section_padding_130_0">
            <div class="container">
                <div class="row">
                    <!-- Single Widget-->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="single-footer-widget section_padding_0_130">
                            <!-- Footer Logo-->
                            <div class="footer-logo mb-3"></div>
                            <!--<p>Appland is completely creative, lightweight, clean app landing page.</p>-->
                            <!-- Copywrite Text-->
                            <div class="copywrite-text mb-5">
                                <p class="mb-0">Made with <i class="lni-heart mr-1"></i>by<a class="ml-1" href="#">datpthe150862@fpt.edu.vn</a></p>
                            </div>
                            <!-- Footer Social Area-->
                            <div class="footer_social_area"><a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Facebook"><i class="fa fa-facebook"></i></a>
                                <a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Pinterest"><i class="fa fa-pinterest"></i></a>
                                <a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Skype"><i class="fa fa-skype"></i></a>
                                <a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Twitter"><i class="fa fa-twitter"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- Single Widget-->
                    <div class="col-12 col-sm-6 col-lg">
                        <div class="single-footer-widget section_padding_0_130">
                            <!-- Widget Title-->
                            <h5 class="widget-title">About</h5>
                            <!-- Footer Menu-->
                            <div class="footer_menu">
                                <ul>
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Corporate Sale</a></li>
                                    <li><a href="#">Terms &amp; Policy</a></li>
                                    <li><a href="#">Community</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Single Widget-->
                    <div class="col-12 col-sm-6 col-lg">
                        <div class="single-footer-widget section_padding_0_130">
                            <!-- Widget Title-->
                            <h5 class="widget-title">Support</h5>
                            <!-- Footer Menu-->
                            <div class="footer_menu">
                                <ul>
                                    <li><a href="#">Help</a></li>
                                    <li><a href="#">Support</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Term &amp; Conditions</a></li>
                                    <li><a href="#">Help &amp; Support</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Single Widget-->
                    <div class="col-12 col-sm-6 col-lg">
                        <div class="single-footer-widget section_padding_0_130">
                            <!-- Widget Title-->
                            <h5 class="widget-title">Contact</h5>
                            <!-- Footer Menu-->
                            <div class="footer_menu">
                                <ul>
                                    <li><a href="#">Call Centre</a></li>
                                    <li><a href="#">Email Us</a></li>
                                    <li><a href="#">Term &amp; Conditions</a></li>
                                    <li><a href="#">Help Center</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>


    </body>

</html>
