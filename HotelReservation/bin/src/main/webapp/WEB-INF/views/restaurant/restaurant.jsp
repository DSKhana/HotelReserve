<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>맛집 리스트</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link href="${pageContext.request.contextPath}/resources/css/restaurant.css" rel="stylesheet" type="text/css">
<style>
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
	
    <!-- 배너 -->
	<div class="slideshow-container">
	  <div class="mySlides fade">
	    <img src="<c:url value="${pageContext.request.contextPath}/resources/img/restaurantBanner/banner1.jpg"/>" style="width:100%">
	  </div>
	  <div class="mySlides fade">
	    <img src="<c:url value="${pageContext.request.contextPath}/resources/img/restaurantBanner/banner2.jpg"/>" style="width:100%">
	  </div>
	  <div class="mySlides fade">
	    <img src="<c:url value="${pageContext.request.contextPath}/resources/img/restaurantBanner/banner3.jpg"/>" style="width:100%">
	  </div>
	</div>
	<br>
	
	<div style="text-align:center">
	  <span class="dot" onclick="currentSlide(1)"></span>
	  <span class="dot" onclick="currentSlide(2)"></span>
	  <span class="dot" onclick="currentSlide(3)"></span>
	</div>
    
    <script>
	let slideIndex = 0;
	showSlides();
	
	function showSlides() {
	  let i;
	  let slides = document.getElementsByClassName("mySlides");
	  let dots = document.getElementsByClassName("dot");
	  for (i = 0; i < slides.length; i++) {
	    slides[i].style.display = "none";  
	  }
	  slideIndex++;
	  if (slideIndex > slides.length) {slideIndex = 1}    
	  for (i = 0; i < dots.length; i++) {
	    dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";  
	  dots[slideIndex-1].className += " active";
	  setTimeout(showSlides, 2000); // Change image every 2 seconds
	}
	</script>
    
    <!--
    <div class="image-box">
    	<img class="image-banner" src="${pageContext.request.contextPath}/resources/img/default.png">
    </div>
    -->
		  	
    <form action="/restaurant" class="form-inline d-flex justify-content-center" method="GET">
		<div class="form-group">
			<select class="form-select" id="field" name="field">
				<option value="name">상호명</option>
				<option value="address">주소(지역)</option>
			</select>
		</div>
        <div class="input-group mb-3 search-bar">
      		<input type="text" class="form-control rounded-pill" placeholder="검색어" id="searchKeyword" name="searchKeyword" value="${searchKeyword}">
      		<button class="btn btn-primary" type="submit">검색</button>
    	</div>
	</form>
	<a class="btn btn-primary" href="/admin/restaurant/new">맛집 등록</a>

    <!-- 맛집 목록 -->
	<table class="table table-hover">
		<thead>
	    	<tr>
	      		<th scope="col">사진</th>
	      		<th scope="col">상호명</th>
	      		<th scope="col">주소</th>
	      		<th scope="col">연락처</th>
	    	</tr>
	  	</thead>
	  	<tbody>
	  		<c:forEach var="restaurant" items="${pageList.content}">
	    		<tr class="table-active">
	      		<td><img alt="" src="<c:url value="${pageContext.request.contextPath}/resources/img/restaurantImg/${restaurant.img}"/>" style="width: 100%; height: 150px; object-fit: cover;"/></td>
	      		<td><a href="<c:url value="/restaurant/${restaurant.seq}"/>">${restaurant.name}</a></td>
	      		<td>${restaurant.address}</td>
	      		<td>${restaurant.phone}</td>
	    		</tr>
	    	</c:forEach>
	  	</tbody>
	</table>
	
	<!-- 페이징 영역 -->
	<div class="text-xs-center">
		<ul class="pagination justify-content-center">
			<!-- 이전 -->
			<c:choose>
				<c:when test="${pageList.first}"></c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="/restaurant/?field=${param.field}&searchKeyword=${param.searchKeyword}&page=0">처음</a></li>
					<li class="page-item"><a class="page-link" href="/restaurant/?field=${param.field}&searchKeyword=${param.searchKeyword}&page=${pageList.number-1}">&larr;</a></li>
				</c:otherwise>
			</c:choose>
			
			<!-- 페이지 그룹 -->
			<c:forEach begin="${startBlockPage}" end="${endBlockPage}" var="i">
				<c:choose>
					<c:when test="${pageList.pageable.pageNumber+1 == i}">
						<li class="page-item disabled"><a class="page-link" href="/restaurant/?field=${param.field}&searchKeyword=${param.searchKeyword}&page=${i-1}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="/restaurant/?field=${param.field}&searchKeyword=${param.searchKeyword}&page=${i-1}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 다음 -->
			<c:choose>
				<c:when test="${pageList.last}"></c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="/restaurant/?field=${param.field}&searchKeyword=${param.searchKeyword}&page=${pageList.number+1}">&rarr;</a></li>
					<li class="page-item"><a class="page-link" href="/restaurant/?field=${param.field}&searchKeyword=${param.searchKeyword}&page=${pageList.totalPages-1}">마지막</a></li>
				</c:otherwise>
			</c:choose>
		</ul>		
	</div>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>