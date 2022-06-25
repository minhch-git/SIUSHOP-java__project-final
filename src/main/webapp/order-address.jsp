<%@ page import="com.siushop.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth == null) {
        response.sendRedirect("login");
    }
%>

<html>
<head>
    <title>SiuShop - Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
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
                    <%@include file="/includes/header/nav-logged-in-item.jsp"%>
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
                <a href="" class="breadcrumd-link">Trang chủ</a>
                <span class="separate-characters pl-1">/</span>
                <a href="/siuShop_war_exploded/orders" class="breadcrumd-link">Orders</a>
                <span class="separate-characters pl-1">/</span>
                <a href="/siuShop_war_exploded/orders" class="breadcrumd-link active">Address</a>
            </div>
        </div>
        <div class="col-span-12 laber-themes mt-3">
            <h4 class="tabs-title fz-md text-upercase py-4 border-bottom pl-12 text-normal bg-white ">
                Địa chỉ nhận hàng
            </h4>

            <div class="grid grid-cols-12 bg-white mt-4 mb-8">
                <div class="mt-4 mb-8 col-start-4 col-end-10">
                    <span>${error}</span>
                    <form action="/siuShop_war_exploded/${productId != null ? "order-now" :"orders"}" method="post" class="form px-8 py-1">
                        <c:if test="${ productId != null}">
                            <input class="d-none" type="text" name="productId" value="${productId}">
                        </c:if>

                        <c:if test="${ quantity != null}">
                            <input class="d-none" type="number" name="quantity" value="${quantity}">
                        </c:if>

                        <div class="form-group">
                            <label for="province" class="form-label">Tỉnh/TP: </label>
                            <input type="text" required name="province" id="province" placeholder="Nhập Tỉnh/TP" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="district" class="form-label">Quận / Huyện</label>
                            <input type="text" required name="district" id="district" placeholder="Nhập Quận/Huyện" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="ward" class="form-label">Phường / Xã</label>
                            <input type="text" required name="ward" id="ward" placeholder="Nhập Phường/Xã" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="address" class="form-label">Địa chỉ cụ thể</label>
                            <input type="text" required name="address" id="address" placeholder="Địa chỉ cụ thể" class="form-control" />
                        </div>
                        <div class="form-group">
                            <input type="submit" value="Đặt Hàng" class="form-control bg-primary fz-md text-white cursor-pointer" />
                        </div>
                    </form>
                </div>

                <div class="col-span-12 py-6 border-top">
                    <div class="text-center">
                        <a href="/siuShop_war_exploded/cancel-order-address?productId=${productId}" class="text-decoration py-4 text-normal fz-md text-hover">
                            Để đặt hàng sau
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<%@include file="./partials/footer.jsp" %>

</body>
</html>