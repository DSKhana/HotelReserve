<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>맛집 세부정보</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link href="${pageContext.request.contextPath}/resources/css/restaurant.css" rel="stylesheet" type="text/css">
<style>
	img {
	width: 100%;
	height: 150px;
	object-fit: cover;
	}
	div {
		text-align: center;
	}
	table {
		width: 100%;
		table-layout: fixed;
	}
</style>
</head>
<body>
	<!-- 상단메뉴 -->
	<c:import url="${pageContext.request.contextPath}/nav"></c:import>

	<div class="card border-primary mb-3">
    <div class="row no-gutters">
        <div class="col-md-4" style="text-align:center; align-items:center; display: flex; justify-content:center;">
            <img alt="" src="<c:url value="${pageContext.request.contextPath}/resources/img/menuImg/${menu.img}"/>"/>        	
        </div>
            <div class="col-md-8">
            <div class="card-body">
                <h3 class="card-title">${menu.name}</h3>
                <hr>
                <p class="card-text">가격 : ${menu.price}</p>
                <hr>
                <p class="card-text">${menu.description}</p>
            </div>
        </div>
    </div>
	</div>
	
	<!-- 버튼 -->
	<a class="btn btn-primary" href="/admin/restaurant/menu/update/${menu.seq}">수정</a>
    <a class="btn btn-primary" href="/admin/restaurant/menu/delete/${menu.seq}">삭제</a>
    <a class="btn btn-primary" href="/restaurant/${restaurant.seq}">이전</a>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>