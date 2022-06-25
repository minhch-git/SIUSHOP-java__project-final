<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="col-span-3 d-flex align-center">
  <form action="/siuShop_war_exploded/search-product" method="get" class="form form-search ml-8">
    <div class="form-group form-search__group">
      <input type="text" id="search" name="search" class="form-control" placeholder="Nhập từ khóa...">
      <button type="submit" class="form-search__icon">
              <i class="fas fa-search"></i>
            </button>
    </div>
  </form>
</div>