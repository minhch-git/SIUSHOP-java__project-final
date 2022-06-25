<%@ page import="com.siushop.model.User" %>
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
  <title>SiuShop - New product</title>
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
    <!-- Breadcrumd-->
    <div class="col-span-12">
      <div class="breadcrumd d-flex justify-start align-center">
        <a href="/siuShop_war_exploded/home" class="breadcrumd-link">Trang chủ</a>
        <span class="separate-characters pl-1">/</span>
        <a href="/siuShop_war_exploded/home" class="breadcrumd-link">Products</a>
        <span class="separate-characters pl-1">/</span>
        <a href="/siuShop_war_exploded/my-store" class="breadcrumd-link">Update</a>
        <span class="separate-characters pl-1">/</span>
        <a href="/siuShop_war_exploded/new-product" class="breadcrumd-link active">${product.getTitle()}</a>
      </div>
    </div>
    <div class="col-span-12 laber-themes mt-3">
      <h4 class="tabs-title fz-md text-upercase py-4 border-bottom pl-12 text-normal bg-white">
        Update sản phẩm ${product.getId()}
      </h4>

      <div class="grid grid-cols-12 bg-white mt-4 mb-8">
        <div class="mt-4 mb-8 col-start-4 col-end-10">

          <form class="form px-8 py-1" action="/siuShop_war_exploded/edit-product" method="post">
            <input type="number" value="${product.getId()}" name="id" id="id" hidden>
            <div class="form-group">
              <label class="form-label" for="title">Tên sản phẩm</label>
              <input class="form-control" value="${product.getTitle()}" type="text" name="title" id="title"
                     placeholder="combo 9 siêu data sim 4g" />
            </div>

            <div class="form-group">
              <label class="form-label" for="price">Giá</label>
              <input value="${product.getPrice()}"  class="form-control flex-1" type="number" name="price" id="price"
                     placeholder="400000" />
            </div>

            <div class="form-group">
              <label class="form-label" for="promotionPrice"> Giá khuyến mãi</label>
              <input value="${product.getPromotionPrice()}" class="form-control flex-1" type="number" name="promotionPrice" id="promotionPrice"
                     placeholder="400000" />
            </div>

            <div class="form-group">
              <label class="form-label" for="exclusive">Độc quyền</label>
              <input value="${product.isExclusive() ? 1 : 0}" class="form-control flex-1" type="number" name="exclusive" id="exclusive"
                     value="1"/>
            </div>

            <div class="form-group">
              <label class="form-label" for="image">Link hình ảnh</label>
              <input value="${product.getImage()}"  class="form-control flex-1"
                     type="text" name="image" id="image"
                     placeholder="sim-tam-free-1-thang-tang-sim-cam-on-.jpg" />
            </div>

            <div class="form-group">
              <input class="mt-4 form-control bg-success fz-md text-white cursor-pointer" type="submit" value="Cập nhập" />
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</main>
<%@include file="/partials/footer.jsp" %>

</body>
</html>