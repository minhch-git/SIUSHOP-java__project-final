<%@ page import="com.siushop.model.User" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth != null) {
        request.setAttribute("auth", auth);
    }else {
        response.sendRedirect("login");
    }
%>

<html>
<head>
    <title>SiuShop - register</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    <style><%@include file="../css/style.css"%></style>
</head>
<body>


<%-------- Header --------%>
<header class="header">
    <div class="grid wide grid-cols-6 gap-x-8 h-100">
        <%@include file="/includes/header/logo.jsp"%>
        <%@include file="/includes/header/search.jsp"%>

        <div class="col-span-2 d-flex align-center justify-between">
            <ul class="account d-flex justify-center">
                <c:if test="${auth != null}">
                    <%@include file="/includes/header/nav-logged-in-item.jsp"%>
                </c:if>

                <c:if test="${auth == null}">
                    <%@include file="/includes/header/login-actions.jsp"%>
                </c:if>
                <%@include file="/includes/header/languages.jsp"%>
            </ul>
            <%@include file="/includes/header/cart-button.jsp"%>
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
        <div class="col-span-12">
            <div class="col-span-12">
                <div class="breadcrumd d-flex justify-start align-center">
                    <a href="" class="breadcrumd-link">Trang ch???</a>
                    <span class="separate-characters pl-1">/</span>
                    <a href="/siuShop_war_exploded/orders" class="breadcrumd-link">Me</a>
                    <span class="separate-characters pl-1">/</span>
                    <a href="/siuShop_war_exploded/orders" class="breadcrumd-link active">Store</a>
                </div>
            </div>
        </div>

        <div class="col-span-12">
            <h4 class="tabs-title fz-md text-upercase py-4 border-bottom pl-12 text-normal bg-white">
                Danh s??ch s???n ph???m c???a b???n (${orders != null ? orders.size() : 0})
            </h4>
            <div class="bg-white mt-4 mb-8">
                <div class="mt-4 mb-8 col-start-4 col-end-10">
                    <table class="w-100 py-2 px-2">
                        <thead class="fz-md bg-dark text-white">
                        <tr>
                            <th class="py-4">Link</th>
                            <th>T??n s???n ph???m </th>
                            <th>S??? l?????ng</th>
                            <th>T???ng ti???n</th>
                            <th>Ng??y ?????t</th>
                            <th>?????a ch???</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${orders.size() > 0}">
                            <c:forEach var="order" items="${orders}">
                                <tr>
                                    <td class="py-3 text-center">
                                        <a class="btn btn-primary" href="/siuShop_war_exploded/product-details?id=${order.getProductId()}">View</a>
                                    </td>
                                    <td class="text-center">
                                        <c:out value = "${order.getProductId()}"/>
                                    </td>
                                    <td class="text-center">
                                        <span class="mx-2 fz-md">${order.getQuantity()}</span>
                                    </td>
                                    <td class="text-center">
                                        <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${order.getTotalPrice()}" /> ??
                                    </td>
                                    <td class="text-center">
                                        <c:out value = "${order.getCreatedAt()}"/>
                                    </td>
                                    <td class="text-center">
                                        ${order.getProvince()} - ${order.getDistrict()} - ${order.getWard()}
                                        <p>${order.getAddress()}</p>
                                    </td>
                                    <td class="text-center">
                                        <button
                                            onclick="if(confirm('Are you sure you want to continue')) {
                                                    window.location = '/siuShop_war_exploded/remove-from-order?id=${order.getId()}'
                                                    }"
                                            class="btn bg-primary text-white cursor-pointer text-hover bg-hover text-md py-1 px-1"
                                            type="submit">H???y
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>

                        <c:if test="${orders.size() == 0}">
                            <tr>
                                <td colspan="7">
                                    <h4 class="text-center tabs-title fz-md text-upercase py-4 border-bottom pl-12 text-normal bg-white">
                                        Danh s??ch c???a b???n kh??ng c?? g???
                                        <a class="mx-2" href="/siuShop_war_exploded/home">T??m ki???m s???n ph???m?</a>
                                    </h4>
                                </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</main>
<%@include file="../partials/footer.jsp" %>

</body>
</html>