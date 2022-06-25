<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="sort-by d-flex justify-end align-center">
  <span class="sort-by__label mr-8">Sắp xếp theo: </span>
  <form action="" class="flex-1">
    <select class="form-control" name="" id="">
      <option> -- Liên quan -- </option>
      <option value="AZ">Tên: A đến Z</option>
      <option value="ZA">Tên: Z đến A</option>
      <option value="minmax">Giá: thấp đến cao</option>
      <option value="maxmin">Giá: cao đến thấp</option>
    </select>
  </form>
</div>