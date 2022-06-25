<%@ page import="com.siushop.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth != null) {
        request.setAttribute("auth", auth);
    }
%>

<html>
<head>
    <title>SiuShop - Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    <style><%@include file="./css/style.css"%></style>
</head>
<body>

<%-------- Header --------%>
<header class="header">
    <div class="grid wide grid-cols-6 gap-x-8 h-100">
        <%@include file="includes/header/logo.jsp"%>
        <%@include file="includes/header/search.jsp"%>

        <div class="col-span-2 d-flex align-center justify-between">
            <ul class="account d-flex justify-center">
                <c:if test="${auth != null}">
                    <%@include file="includes/header/nav-logged-in-item.jsp"%>
                </c:if>

                <c:if test="${auth == null}">
                    <%@include file="includes/header/login-actions.jsp"%>
                </c:if>
                <%@include file="includes/header/languages.jsp"%>
            </ul>
            <%@include file="includes/header/cart-button.jsp"%>
        </div>
    </div>
</header>
<%------ End Header ------%>


<%-------- Navigations --------%>
<nav class="nav">
    <div class="grid wide grid-cols-12 gap-x-8 h-100">
        <%@include file="/includes/navigations/categories.jsp"%>

        <div class="col-span-9 d-flex justify-between">
            <ul class="nav-list d-flex justify-start align-center">
                <%@include file="/includes/navigations/list-item.jsp"%>
                <c:if test="${ auth != null && auth.isAdmin()}">
                    <%@include file="/includes/navigations/admin-item.jsp"%>
                </c:if>
            </ul>
            <%@include file="/includes/navigations/add-price-button.jsp"%>
        </div>
    </div>
</nav>
<%------ End Navigations ------%>


<!-- Main -->
<main class="main">
    <div class="grid wide grid-cols-12 gap-x-8">
        <!-- Breadcrumd -->
        <div class="col-span-12">
            <div class="breadcrumd d-flex justify-start align-center">
                <a href="/siuShop_war_exploded/home" class="breadcrumd-link">Trang chủ</a>
                <span class="separate-characters pl-1">/</span>
                <a href="/siuShop_war_exploded/home" class="breadcrumd-link">Products</a>
                <span class="separate-characters pl-1">/</span>
                <a href="/siuShop_war_exploded/home" class="breadcrumd-link active">Search</a>
            </div>
        </div>
        <div class="col-span-3">
            <div class="sidebar">
                <ul class="sidebar-list">
                    <li class="sidebar-item">
                        <a href="/siuShop_war_exploded/home" class="sidebar-heading">Trang chủ</a>
                    </li>
                    <li class="sidebar-item">
                        <div class="sidebar-filter">
                            <h4 class="sidebar-heading">Lọc theo</h4>
                            <ul class="sidebar-filter__list">
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="banner">
                <img width="100%" src="img/banner1.png" alt="Banner">
            </div>
        </div>
        <div class="col-span-9">
            <div class="grid grid-cols-3 gap-8">
                <div class="col-span-3">
                    <div class="product-title">Search: <span class="text-primary">${search}</span></div>
                </div>
                <div class="col-span-3">
                    <div class="fz-lg text-center">
                        <span>Có <span>${productsSearched != null ? productsSearched.size() : 0}</span> sản phẩm</span>
                    </div>
                </div>

                <c:forEach var="product" items="${productsSearched}">
                    <div class="col-span-1">
                        <div class="card">
                            <a href="/siuShop_war_exploded/product-details?id=${product.getId()}">
                                <div class="card-top">
                                    <img src="img/${product.getImage()}" alt="">
                                </div>
                            </a>
                            <div class="card-body">
                                <a href="/siuShop_war_exploded/product-details?id=${product.getId()}" class="text-decoration">
                                    <h4 class="card-name">${product.getTitle()}</h4>
                                </a>
                                <div class="card-price">
                                    <span class="price">${product.getPromotionPrice()} ₫</span>
                                    <span class="regular-price">${product.getPrice()} ₫</span>
                                </div>
                                <span class="card-rating">
                                    <div class="star-content d-flex">
                                      <div class="star star-on"><i class="fas fa-star"></i></div>
                                      <div class="star star-on"><i class="fas fa-star"></i></div>
                                      <div class="star star-on"><i class="fas fa-star"></i></div>
                                      <div class="star star-on"><i class="fas fa-star"></i></div>
                                      <div class="star"><i class="fas fa-star"></i></div>
                                      <div class="number">(5)</div>
                                    </div>
                                 </span>
                            </div>
                            <div class="flag-on-sale">
                                <span>-50%</span>
                            </div>
                            <c:if test="${product.isExclusive()}">
                                <div class="label-flag">
                                    <span>Độc quyền</span>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>

            <!-- page -->

        </div>
            <div class="page">
                <span> <i class="fas fa-angle-left"></i> Về trước </span>
                <span class="active">1</span>
                <span>2</span>
                <span>3</span>
                <span>4</span>
                <span> Tiếp<i class="fas fa-angle-right"></i> </span>
            </div>
    </div>
</main>

<%@include file="./partials/footer.jsp" %>

</body>
</html>