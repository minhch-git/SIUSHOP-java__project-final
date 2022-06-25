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
                <a href="" class="breadcrumd-link active">Trang chủ</a>
                <span class="separate-characters pl-1">/</span>
                <a href="" class="breadcrumd-link">Liên hệ chúng tôi</a>
            </div>
        </div>
        <div class="col-span-4">
            <div class="contact-info">
                <h4 class="title fz-md text-dark text-upercase fw-normal mt-4 py-2">Thông tin cửa hàng</h4>

                <div class="d-flex align-center border-bottom py-4">
                    <div class="icon fz-lg text-normal">
                        <i class="fas fa-map-marker-alt"></i>
                    </div>
                    <div class="data">
                        <ul class="address-list pl-6 text-dark">
                            <li class="address-item">Hà Nội: 203 Xã Đàn</li>
                            <li class="address-item">Hồ Chí Minh: 125 Bis Hai bà Trưng, Q1</li>
                            <li class="address-item">Đà Nẵng: 150 Hàm Nghi, Q Thanh Khê</li>
                        </ul>
                    </div>
                </div>
                <div class="d-flex align-center border-bottom py-4">
                    <div class="icon fz-lg text-normal">
                        <i class="fas fa-phone"></i>
                    </div>
                    <div class="data pl-6 text-normal">
                        <span class="text-dark">Gọi cho chúng tôi: </span>
                        <p class="py-0 mt-0 mb-0">0387776243</p>
                    </div>
                </div>
                <div class="d-flex align-center py-4">
                    <div class="icon fz-lg text-normal">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <div class="data pl-6 text-normal">
                        <span class="text-dark">Email của chúng tôi: </span>
                        <a href="" class="d-block text-decoration py-0 mt-0 mb-0">CSKH@snowshop.com.vn</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-span-8 mb-8">
            <div class="bg-white">
                <div class="form px-8 py-4">
                    <h4 class="form-heading fz-md text-upercase py-4 text-normal">Liên hệ với chúng tôi</h4>
                    <div class="form-group">
                        <label for="" class="form-label">Địa chỉ e-mail</label>
                        <input type="text" name="" id="" placeholder="your@email.com" class="form-control ">
                    </div>
                    <div class="form-group">
                        <label for="" class="form-label">Điện thọai</label>
                        <input type="text" name="" id="" placeholder="0xxx" class="form-control ">
                    </div>
                    <div class="form-group">
                        <label for="" class="form-label">Đính kèm</label>
                        <div class="d-flex">
                            <input type="text" name="" id="" class="form-control flex-1 mr-3">
                            <span class="btn text-upercase border-none cursor-pointer text-white bg-success">chọn tập tin</span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="form-label">Tin nhắn</label>
                        <textarea class="px-3 py-2" name="" id="" placeholder="Message..."></textarea>
                    </div>

                    <div class="form-group py-4">
                        <input type="submit" value="Gửi" class="form-control bg-success fz-md text-white cursor-pointer">
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="./partials/footer.jsp" %>

</body>
</html>