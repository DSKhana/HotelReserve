<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>맛집 수정</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/signup.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- Kakao daum postcode -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<!-- 상단메뉴 -->
	<c:import url="${pageContext.request.contextPath}/nav"></c:import>
	
	<form class="container" method="POST" action="/admin/restaurant/update">
	  <fieldset>
	    <legend>${restaurant.name} 맛집 정보 수정</legend>
	    <div class="form-group">
	      <label for="name" class="form-label mt-4">상호명</label>
	      <input value="${restaurant.name}" type="text" class="form-control" id="name" name="name" placeholder="상호명을 입력하세요">
	    </div>
	    <div class="form-group">
	      <label for="address" class="form-label mt-4">주소</label>
	      <div class="input-group">
			<input value="${restaurant.address}" type="text" class="form-control" id="address" name="address" placeholder="검색 버튼을 눌러 주소를 입력하세요" value="${restaurantAddFormDto.address}">
			<input type="button" class="btn btn-outline-dark" value="검색" onclick="searchAddress()">
	    	</div>
	    </div>
	    <div class="form-group">
	      <label for="phone" class="form-label mt-4">연락처</label>
	      <input value="${restaurant.phone}" type="text" class="form-control" id="phone" name="phone" placeholder="연락처를 입력하세요">
	    </div>
	    <div class="form-group">
	      <label for="description" class="form-label mt-4">소개</label>
	      <input value="${restaurant.description}" type="text" class="form-control" id="description" name="description" placeholder="맛집에 대한 정보를 입력하세요">
	    </div>
	   	   	<input type="hidden" name="seq" value="${restaurant.seq}">
	    <button type="submit" class="btn btn-primary">수정</button>
        <a class="btn btn-primary" href="/restaurant/restaurantDetail/${restaurant.seq}">이전</a>
	 </fieldset>
	 </form>	 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>