<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	<title>Home</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
</head>
<body>
	<c:import url="${pageContext.request.contextPath}/nav"></c:import>
	
	<br>
	<hr>
	<br>
	<!-- 팀원 소개 -->
	<h3 style="text-align: center">Kingsman Member</h3>
	<br>
	<div class="card-group">
	  <div class="card">
	    <img src="<c:url value="${pageContext.request.contextPath}/resources/img/home/man2.jpg"/>" class="card-img-top" alt="...">
	    <div class="card-body">
	      <h5 class="card-title" style="text-align: center">팀장 : 신기훈</h5>
	    </div>
	  </div>
	  <div class="card">
	    <img src="<c:url value="${pageContext.request.contextPath}/resources/img/home/man1.jpg"/>" class="card-img-top" alt="...">
	    <div class="card-body">
	      <h5 class="card-title" style="text-align: center">팀원 : 김진용</h5>
	    </div>
	  </div>
	  <div class="card">
	    <img src="<c:url value="${pageContext.request.contextPath}/resources/img/home/man1.jpg"/>" class="card-img-top" alt="...">
	    <div class="card-body">
	      <h5 class="card-title" style="text-align: center">팀원 : 양치열</h5>
	    </div>
	  </div>
	  <div class="card">
	    <img src="<c:url value="${pageContext.request.contextPath}/resources/img/home/man3.jpg"/>" class="card-img-top" alt="...">
	    <div class="card-body">
	      <h5 class="card-title" style="text-align: center">팀원 : 김상연</h5>
	    </div>
	  </div>
	</div>
	<br>
	<hr>
	<br>
	
	<!-- 벤치마킹 사이트 -->
	<h3 style="text-align: center">벤치마킹 사이트</h3>
	<br>
	  <div class="card">
	  	<div class="slideshow-container">
	  <div class="mySlides fade">
	    <img src="<c:url value="${pageContext.request.contextPath}/resources/img/home/tripbtoz.jpg"/>" style="width:100%">
	  		<div class="text">Tripbtoz</div>
	  </div>
	  <div class="mySlides fade">
	    <img src="<c:url value="${pageContext.request.contextPath}/resources/img/home/yanolja.jpg"/>" style="width:100%">
	  		<div class="text">야놀자</div>
	  </div>
	  <div class="mySlides fade">
	    <img src="<c:url value="${pageContext.request.contextPath}/resources/img/home/here.jpg"/>" style="width:100%">
	  		<div class="text">여기어때</div>
	  </div>
	</div>
	<br>
	<div style="text-align:center">
	  <span class="dot" onclick="currentSlide(1)"></span>
	  <span class="dot" onclick="currentSlide(2)"></span>
	  <span class="dot" onclick="currentSlide(3)"></span>
	</div>
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
	  setTimeout(showSlides, 2000);
	}
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>