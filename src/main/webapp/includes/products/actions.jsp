<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="buy-now mt-5">
    <div class="d-flex align-center">
        <a href="/siuShop_war_exploded/order-now?productId=${param.id}">
            <span class="btn bg-primary-light border-none text-white px-11 py-3 cursor-pointer">
                Mua ngay
            </span>
        </a>
        <a href="/siuShop_war_exploded/add-to-cart?id=${param.id}">
            <span class="btn bg-primary border-none ml-4 text-white px-3 py-3 cursor-pointer">
                Thêm vào giỏ hàng
            </span>
        </a>
    </div>
</div>