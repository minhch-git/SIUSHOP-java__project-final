<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="cart d-flex align-center justify-center">
  <a href="/siuShop_war_exploded/cart-list" class="cart-icon">
    <i class="fas fa-cart-plus"></i>
    <c:if test="${carts != null && carts.size() > 0}">
      <span style="background: #ffb600" class="fw-bold text-white">${carts.size()}</span>
    </c:if>
  </a>
</div>