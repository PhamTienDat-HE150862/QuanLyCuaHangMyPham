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
        <jsp:include page="header.jsp"></jsp:include>
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
                                    <h5><a href="ViewDetail?id=${o.productID}">${o.name}</a></h5>
                                    <ul class="product_price list-unstyled">
                                        <li class="new_price">${o.price} VNĐ</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>


            </div>
        </div>
       
        <jsp:include page="footer.jsp"></jsp:include>


    </body>

</html>
