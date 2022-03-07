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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    </head>
    <body>
        <jsp:include page="../header.jsp"></jsp:include>
            <div class="container bootdey">
                <div class="col-md-12">
                    <section class="panel">
                        <div class="panel-body">
                            <div class="col-md-6">
                                <div class="pro-img-details">
                                    <img src="${vDetail.imgUrl}" alt="">
                            </div>

                        </div>
                        <div class="col-md-6">
                            <h4 class="pro-d-title">
                                <a href="#" class="">
                                    ${vDetail.name}
                                </a>
                            </h4>
                            <p>
                                ${vDetail.detail}
                            </p>
                            <div class="product_meta">
                                <span class="posted_in"> <strong>Số Lượng Trong Kho:</strong> <b style="font-size: 20px">${vDetail.quantity}.</b></span>
                                <!--<span class="tagged_as"><strong>Tags:</strong> <a rel="tag" href="#">mens</a>, <a rel="tag" href="#">womens</a>.</span>-->
                            </div>
                            <!--<div class="m-bot15"> <strong>Price : </strong> <span class="amount-old">$544</span>  <span class="pro-price"> $300.00</span></div>-->
                            <div class="m-bot15"> <strong>Giá (Giá đã bao gồm VAT) : </strong> <span class="pro-price"> ${vDetail.price} VNĐ.</span></div>
                            <div class="form-group">
                                <label>Số lượng:</label>
                                <input type="quantiy" placeholder="1" class="form-control quantity">
                            </div>
                            <p>
                                <button class="btn btn-round btn-danger" type="button"><i class="fa fa-shopping-cart"></i>Thêm Vào Giỏ Hàng</button>
                            </p>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <jsp:include page="../footer.jsp"></jsp:include>

        <style type="text/css">


        </style>

        <script type="text/javascript">

        </script>
    </body>
</html>

