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
    }
%>

<html>
<head>
    <title>SiuShop - Carts</title>
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
                    <li class="account-item">
                        <a href="/siuShop_war_exploded/orders" class="account-link sign-up">Order</a>
                    </li>
                    <li class="account-item">
                        <a href="/siuShop_war_exploded/logout" class="account-link sign-in">Logout</a>
                    </li>
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
        <!-- Breadcrumd -->
        <div class="col-span-12">
            <div class="breadcrumd d-flex justify-start align-center">
                <a href="/siuShop_war_exploded/home" class="breadcrumd-link">Trang chủ</a>
                <span class="separate-characters pl-1">/</span>
                <a href="/siuShop_war_exploded/products" class="breadcrumd-link active">Carts</a>
            </div>
        </div>

        <div class="col-span-12">
            <h4 class="tabs-title fz-md text-upercase py-4 border-bottom pl-12 text-normal bg-white">
                Giỏ hàng của bạn (${carts != null ? carts.size() : 0})
            </h4>
            <div class="bg-white mt-4 mb-8">
                <div class="mt-4 mb-8 col-start-4 col-end-10">
                    <table class="w-100 py-2 px-2">
                        <thead class="fz-md bg-dark text-white">
                        <tr>
                            <th class="py-4">STT</th>
                            <th>Tên sản phẩm </th>
                            <th>Category</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Tổng tiền</th>
                            <th>Xóa</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${carts.size() > 0}">
                            <c:forEach var="cart" items="${carts}">
                               <tr>
                                   <td class="py-3 text-center">
                                       <c:out value = "${cart.getId()}"/>
                                   </td>
                                   <td class="text-center">
                                       <c:out value = "${cart.getTitle()}"/>
                                   </td>
                                   <td class="text-center">Sim</td>
                                   <td class="text-center">
                                       <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${cart.getPrice()}" /> đ
                                   </td>
                                   <td class="text-center">
                                       <div class="d-flex align-center justify-center">
                                           <a href="/siuShop_war_exploded/quantity-inc-dec?action=dec&id=${cart.getId()}">
                                               <button class="fz-small border-none cursor-pointer ">-</button>
                                           </a>
                                           <span class="mx-2 fz-md">${cart.getQuantity()}</span>
                                           <a href="/siuShop_war_exploded/quantity-inc-dec?action=inc&id=${cart.getId()}">
                                            <button class="fz-small border-none cursor-pointer ">+</button>
                                           </a>
                                       </div>
                                   </td>
                                   <td class="text-center">
                                       <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${cart.getPrice()*cart.getQuantity()}" /> đ
                                   </td>
                                   <td class="text-center">
<%--                                       <a class="mt-1" href="/siuShop_war_exploded/remove-from-cart?id=${cart.getId()}">--%>
                                           <button
                                                   onclick="if(confirm('Are you sure you want to continue')) {
                                                        window.location = '/siuShop_war_exploded/remove-from-cart?id=${cart.getId()}'
                                                   }"
                                                   class="btn bg-primary text-white cursor-pointer text-hover bg-hover text-md py-1 px-1" type="submit" href="/">Xóa</button>
<%--                                       </a>--%>
                                   </td>
                               </tr>
                            </c:forEach>
                        </c:if>

                        <c:if test="${carts.size() == 0}">
                            <tr>
                                <td colspan="7">
                                    <h4 class="text-center tabs-title fz-md text-upercase py-4 border-bottom pl-12 text-normal bg-white">
                                        Giỏ hàng của bạn không có gì?
                                        <a class="mx-2" href="/siuShop_war_exploded/home">Tìm kiếm sản phẩm?</a>
                                    </h4>
                                </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>

                    <c:if test="${totalPrice != null && totalPrice != 0}">
                        <div class="d-flex align-end justify-center mx-2 my-4 p-2 pb-4 flex-column" >
                            <span style="font-size: 18px">Tổng tiền:
                                <b style="font-size: 18px" class="text-primary">
                                    <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${totalPrice} " /> VNĐ
                                </b>
                            </span>
                            <a href="/siuShop_war_exploded/order-address.jsp" class="btn my-4 fw-bold border-none border-radius-2 cursor-pointer text-white"
                                    style="background: #6720ed; padding: 14px 24px; font-size: 20px">Đặt hàng
                            </a>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="../partials/footer.jsp" %>

</body>
</html>