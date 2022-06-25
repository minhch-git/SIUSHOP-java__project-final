<%@ page import="com.siushop.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth != null) {
        response.sendRedirect("home");
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
        <!-- Breadcrumd -->
        <div class="col-span-12">
            <div class="breadcrumd d-flex justify-start align-center">
                <a href="/siuShop_war_exploded/home" class="breadcrumd-link">Trang chủ</a>
                <span class="separate-characters pl-1">/</span>
                <a href="/siuShop_war_exploded/register" class="breadcrumd-link active">Đăng ký</a>
            </div>
        </div>
        <div class="col-span-12 laber-themes mt-3">
            <h4
                class="tabs-title fz-md text-upercase py-4 border-bottom pl-12 text-normal bg-white ">
                Tạo tài khoản mới
            </h4>

            <div class="grid grid-cols-12 bg-white mt-4 mb-8">

                <div class="col-span-12 py-4 px-4">
                    <span class="text-normal fz-small">Đã có một tài khoản? </span>
                    <a href="login.jsp"
                       class="text-normal fz-small text-decoration text-primary text-hover">
                        Thay vào đó hãy đăng nhập!
                    </a>
                </div>

                <div class="mb-8 col-start-4 col-end-10">
                    <form action="register" method="post" class="form px-8 py-1">
                        <div class="form-group">
                            <label for="name" class="form-label">Tên đầy đủ</label>
                            <input type="text" name="name" id="name" placeholder="VD: Chìu Cắm Minh" class="form-control ">
                        </div>

                        <div class="form-group">
                            <label for="email" class="form-label">Email</label>
                            <input type="text" name="email" id="email" placeholder="VD: minhcc01.vn@gmail.com" class="form-control ">
                        </div>

                        <div class="form-group">
                            <label for="dateOfBirth" class="form-label">Ngày sinh</label>
                            <input type="date" class="form-control" name="dateOfBirth" id="dateOfBirth"
                                   required
                                   min="1990-01-01" max="2010-12-12"
                            >
                        </div>

                        <div class="form-group">
                            <label for="password" class="form-label">Mật khẩu</label>
                            <input type="password" name="password" id="password" placeholder="Nhập mật khẩu" class="form-control flex-1">
                        </div>

                        <div class="form-group py-4">
                            <input type="submit" value="Đăng Ký" class="form-control bg-success fz-md text-white cursor-pointer">
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