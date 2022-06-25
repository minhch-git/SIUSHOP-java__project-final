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
    <title>SiuShop - Edit product</title>
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
        <!-- Breadcrumd -->
        <div class="col-span-12">
            <div class="breadcrumd d-flex justify-start align-center">
                <a href="/siuShop_war_exploded/home" class="breadcrumd-link">Trang chủ</a>
                <span class="separate-characters pl-1">/</span>
                <a href="/siuShop_war_exploded/products" class="breadcrumd-link">Products</a>
                <span class="separate-characters pl-1">/</span>
                <a href="/siuShop_war_exploded/product-details/${product.getId()}" class="breadcrumd-link active">${product.getTitle()}</a>
            </div>
        </div>

        <div class="col-span-3">
            <%@include file="/includes/banner.jsp"%>
        </div>

        <div class="col-span-9">
            <div class="grid grid-cols-2 gap-x-4 bg-white py-4 px-4">
                <div class="product-img px-4 py-2">
                    <div class="product-img-top">
                        <img src="img/${product.getImage()}" width="100%" alt="Product Image">
                    </div>
                    <div class="product-img-bottom">
                        <ul class="product-img-list d-flex">
                            <li class="product-img-item">
                                <img src="img/${product.getImage()}" width="100%" alt="Product Image">
                            </li>
                            <li class="product-img-item ml-1">
                                <img src="img/${product.getImage()}" width="100%" alt="Product Image">
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="product-content">
                    <h1 class="product-heading">${product.getTitle()}</h1>
                    <div class="card-body product">
                        <%@include file="/includes/products/rating.jsp"%>
                        <span class="text-normal fz-small py-1">Thương hiệu:
                            <a class="text-decoration" href="/brand">Vietnamobile</a>
                        </span>

                        <div class="card-price">
                            <span class="price fz-lg text-primary-dark">${product.getPromotionPrice()} ₫</span>
                            <div class="d-flex align-end">
                                <span class="regular-price">${product.getPrice()} ₫</span> <span class="fz-md pl-1">-50%</span>
                            </div>
                        </div>
                    </div>

                    <div class="product-description-short">
                        <b>SIM Siêu DATA</b> - Miễn phí 1 tháng, Free ship khi nhập mã <b>FREESHIP2020</b> cho đơn hàng 5 sim
                    </div>

                    <div class="product-action">
                        <%@include file="/includes/products/quantity.jsp"%>
                        <span class="product-availability fz-small d-block py-2 text-primary">
                            Bạn không được mua quá 5 sim, hiện tại bạn đã mua: 1 sim
                        </span>
                        <%@include file="/includes/products/phone.jsp"%>

                        <jsp:include page="/includes/products/actions.jsp" >
                            <jsp:param name="id" value="${product.getId()}" />
                        </jsp:include>
                    </div>

                    <%-- Share buttons--%>
                    <%@include file="/includes/products/share-buttons.jsp"%>
                    <%@include file="/includes/products/reassurance.jsp"%>
                </div>
            </div>

            <%-- Description--%>
            <%@include file="/includes/products/description.jsp"%>

            <div class="grid grid-cols-1 mt-4">
                <div class="product-comments-block py-3 bg-white">
                    <!-- title -->
                    <div class="d-flex justify-between align-center text-normal fz-small px-4 py-5 border-bottom">
                        <h6 class="title flex-1 fz-md mt-0 mb-0">Đánh giá và nhận xét</h6>
                        <span class="open-comment-form cursor-pointer fz-small"><i class="fa fa-edit"></i> Nhận xét về sản phẩm</span>
                    </div>

                    <!-- customer comment -->
                    <div class="mod-reviews py-4 border-bottom">
                        <div class="d-flex justify-between align-center px-2">
                          <%@include file="/includes/products/rating.jsp"%>
                            <div class="format-time-ago fz-min text-normal">19 tháng trước</div>
                        </div>

                        <div class="d-flex justify-start align-center px-2 mt-3">
                            <%@include file="/includes/comments/author.jsp"%>
                        </div>

                        <div class="item-content px-2 py-1">
                            <span class="fz-small">Thực sự ok ko khá băn khoăn</span>
                        </div>
                    </div>
                    <div class="mod-reviews py-4 border-bottom">
                        <div class="d-flex justify-between align-center px-2">
                            <%@include file="/includes/products/rating.jsp"%>
                            <div class="format-time-ago fz-min text-normal">19 tháng trước</div>
                        </div>

                        <div class="d-flex justify-start align-center px-2 mt-3">
                            <%@include file="/includes/comments/author.jsp"%>
                        </div>

                        <div class="item-content px-2 py-1">
                            <span class="fz-small">Thực sự ok ko khá băn khoăn</span>
                        </div>
                    </div>

                </div>

                <div class="laber-themes mt-4">
                    <h4 class="tabs-title fz-md text-upercase py-4 border-bottom px-2 text-normal bg-white ">Bạn cũng có thể thích</h4>
                    <div class="grid grid-cols-3 gap-8 mt-4 mb-8">

                        <c:forEach var="product" items="${products}">
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

                    </div>
                </div>
                <div class="laber-themes mt-3 mb-8">
                    <h4 class="tabs-title fz-md text-upercase py-4 border-bottom px-2 text-normal bg-white ">16 SẢN PHẨM KHÁC TRONG CÙNG DANH MỤC:</h4>
                    <div class="grid grid-cols-3 gap-8 mt-4 mb-8">
                        <c:forEach var="product" items="${products}">
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<%@include file="../partials/footer.jsp" %>

</body>
</html>