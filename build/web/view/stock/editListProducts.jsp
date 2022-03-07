<%-- 
    Document   : listProductsInStock
    Created on : Mar 6, 2022, 1:37:11 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Shop cart</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="css/stock.css">
    </head>
    <body>
        <div class="container pb-5 mt-n2 mt-md-n3">
            <div class="row">

                <div class="col-xl-12 col-md-8">
                    <h2 class="h6 d-flex flex-wrap justify-content-between align-items-center px-4 py-3 bg-secondary"><span>Products</span><a class="font-size-sm" href="home"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left" style="width: 1rem; height: 1rem;"><polyline points="15 18 9 12 15 6"></polyline></svg>Back to Home</a></h2>


                    <div class="item">
                        <!-- Item-->
                        <form action="UpdateProduct" method="get">
                            <c:forEach items="${listProduct}" var="ls">
                                <div class="d-sm-flex justify-content-between my-4 pb-4 border-bottom">
                                    <div class="media d-block d-sm-flex text-center text-sm-left"><input type="text" style="display: none" name="id" value="${ls.productID}">
                                        <a class="cart-item-thumb mx-auto mr-sm-4" href="listPoductsController?id=${ls.productID}"><img src="${ls.imgUrl}" alt="Product"></a>
                                        <div class="media-body pt-3">
  



                                            <div class="font-size-lg text-primary pt-2">Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="name" value="${ls.name}"></div><i class="fa-solid fa-pen-line"></i>
                                            <div class="font-size-lg text-primary pt-2">Price:&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="price" value="${ls.price}"></div><i class="fa-solid fa-pen-line"></i>
                                            <div class="font-size-lg text-primary pt-2">Quantity:&nbsp;&nbsp;<input type="number" name="quantity" value="${ls.quantity}"></div>
                                            <i class="fa-solid fa-pen-line"></i>


                                        </div>
                                    </div>

                                    <div class="pt-2 pt-sm-0 pl-sm-3 mx-auto mx-sm-0 text-center text-sm-left" style="max-width: 10rem;">


                                        <button class="btn btn-outline-editstocksecondary btn-sm btn-block mb-2" type="submit" >
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-refresh-cw mr-1">
                                            <polyline points="23 4 23 10 17 10"></polyline>
                                            <polyline points="1 20 1 14 7 14"></polyline>
                                            <path d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"></path>
                                            </svg>Save</button>


                                        <button class="btn btn-outline-danger btn-sm btn-block mb-2" type="button">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2 mr-1">
                                            <polyline points="3 6 5 6 21 6"></polyline>
                                            <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                            <line x1="10" y1="11" x2="10" y2="17"></line>
                                            <line x1="14" y1="11" x2="14" y2="17"></line>
                                            </svg>Remove</button>


                                    </div>
                                </div>
                            </c:forEach>
                        </form>

                    </div>

                </div>


            </div>
        </div>

        <style type="text/css">

        </style>

        <script type="text/javascript">

        </script>
    </body>
</html>