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
    <title>SiuShop - register</title>
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
        <div class="col-span-12 laber-themes mt-3">
            <h4 class="tabs-title fz-md text-upercase py-4 border-bottom pl-12 text-normal bg-white">Tìm kiếm thông tin tại đây</h4>
            <div class="grid grid-cols-12 bg-white mt-4 mb-8">
                <div class="mt-4 mb-8 col-start-4 col-end-10">
                    <form action="/siuShop_war_exploded/search-product" method="get">
                        <div class="form-group">
                            <label class="form-label" for="search-product">Bạn cần tìm gì</label>
                            <div class="d-flex flex-row">
                                <input class="form-control flex-1" id="search-product" type="text" name="search" placeholder="Nhập từ khóa" />
                                <button class="btn btn-primary text-white cursor-pointer border-none" type="submit">Tìm kiếm </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="./partials/footer.jsp" %>

</body>
</html>