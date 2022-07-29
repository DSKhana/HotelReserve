<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이 페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style type="text/css">
		.mypage{width: 60%; margin: auto;}
		.review-btn-field{width: 15%; text-align: center;}
		td{vertical-align: middle;}
	</style>
</head>
<body>
	<c:import url="${pageContext.request.contextPath}/nav"></c:import><br>
	
	<fieldset class="mypage">
		<legend>마이 페이지</legend><hr>
		<div class="accordion" id="accordionExample">
		  <div class="accordion-item bg-secondary text-white">
		  	<div class="accordion-body">
				<b><sec:authentication property="principal.username"/>님</b> 어서오세요.
		  	</div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingOne">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
				<b>예약 현황</b>
		      </button>
		    </h2>
		    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
		      <div class="accordion-body">
				<table class="table">
		        	<thead>
						<tr>
							<th style="width: 20%">호텔명</th>
							<th style="width: 40%">방이름</th>
							<th style="width: 14%">예약자</th>
							<th style="width: 13%">예약일</th>
							<th style="width: 13%">종료일</th>
						<tr>
					</thead>
					<tbody>
					<c:forEach var="rbooking" items="${reserveBookingList}" varStatus="status" end="4">
							<tr>
								<td>${rbooking.hotel}</td>
								<td>${rbooking.room}</td>
								<td>${rbooking.reserver}</td>
								<td>${rbooking.reserveDate}</td>
								<td>${rbooking.reserveEndDate}</td>
							</tr>
					</c:forEach>
					</tbody>
				</table>
				<small class="form-text"><a href="${pageContext.request.contextPath}/" style="float:right;">상세 보기</a></small><br>
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingTwo">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				<b>이용 내역</b>
		      </button>
		    </h2>
		    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample" style="">
		      <div class="accordion-body">
		        <table class="table">
		        	<thead>
						<tr>
							<th style="width: 15%">호텔명</th>
							<th style="width: 35%">방이름</th>
							<th style="width: 14%">예약자</th>
							<th style="width: 13%">예약일</th>
							<th style="width: 13%">종료일</th>
							<th class="review-btn-field" style="width: 10%"></th>
						<tr>
					</thead>
					<tbody>
					<c:forEach var="pbooking" items="${progressedBookingList}" varStatus="status" end="4">
							<tr>
								<td>${pbooking.hotel}</td>
								<td>${pbooking.room}</td>
								<td>${pbooking.reserver}</td>
								<td>${pbooking.reserveDate}</td>
								<td>${pbooking.reserveEndDate}</td>
								<td class="review-btn-field"><a class="text-muted" href="${pageContext.request.contextPath}/mypage/review/hotel/write/${pbooking.hotelSeq}">리뷰 작성</a></td>
							</tr>
					</c:forEach>
					</tbody>
				</table>
				<small class="form-text"><a href="${pageContext.request.contextPath}/" style="float:right;">상세 보기</a></small><br>
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingThree">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				<b>리뷰 관리</b>
		      </button>
		    </h2>
		    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample" style="">
		      <div class="accordion-body">
		        <table class="table">
		        	<thead>
						<tr>
							<th style="width: 20%">호텔명</th>
							<th style="width: 10%">별점</th>
							<th style="width: 50%">내용</th>
							<th style="width: 20%">작성일</th>
						<tr>
					</thead>
					<tbody>
					<c:forEach var="hotelScore" items="${hotelScoreList}" varStatus="status" end="2">
							<tr>
								<td>${hotelScore.hotelName}</td>
								<td>${hotelScore.scoreString}</td>
								<td>${hotelScore.desc}</td>
								<td>${hotelScore.day}</td>
							</tr>
					</c:forEach>
					</tbody>
				</table>
				<small class="form-text"><a href="${pageContext.request.contextPath}/" style="float:right;">상세 보기</a></small><br>
				<table class="table">
		        	<thead>
						<tr>
							<th style="width: 20%">점포명</th>
							<th style="width: 10%">별점</th>
							<th style="width: 50%">내용</th>
							<th style="width: 20%">작성일</th>
						<tr>
					</thead>
					<tbody>
					<c:forEach var="restaurantScore" items="${restaurantScoreList}" varStatus="status" end="2">
							<tr>
								<td>${restaurantScore.restaurantName}</td>
								<td>${restaurantScore.scoreString}</td>
								<td>${restaurantScore.desc}</td>
								<td>${restaurantScore.day}</td>
							</tr>
					</c:forEach>
					</tbody>
				</table>
				<small class="form-text"><a href="${pageContext.request.contextPath}/" style="float:right;">상세 보기</a></small><br>
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingFour">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
				<b>문의 관리</b>
		      </button>
		    </h2>
		    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample" style="">
		      <div class="accordion-body">
		        <strong>Four</strong>
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingFive">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
				<b>나의 맛집</b>
		      </button>
		    </h2>
		    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample" style="">
		      <div class="accordion-body">
		        <table class="table">
		        	<thead>
						<tr>
							<th>점포명</th>
							<th>점포 전화번호</th>
							<th class="review-btn-field"></th>
						<tr>
					</thead>
					<tbody>
					<c:forEach var="stars" items="${starsDtoList}" varStatus="status" end="4">
							<tr>
								<td>${stars.restaurantName}</td>
								<td>${stars.restaurantPhone}</td>
								<td class="review-btn-field"><a class="text-muted" href="${pageContext.request.contextPath}/mypage/review/restaurant/write/${stars.restaurantSeq}">리뷰 작성</a></td>
							</tr>
					</c:forEach>
					</tbody>
				</table>
				<small class="form-text"><a href="${pageContext.request.contextPath}/" style="float:right;">상세 보기</a></small><br>
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingSix">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
				<b>계정 관리</b>
		      </button>
		    </h2>
		    <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix" data-bs-parent="#accordionExample" style="">
		      <div class="accordion-body">
		        <table class="table table-hover">
					<tr>
						<td onclick="location.href='${pageContext.request.contextPath}/mypage/pwdcheck?menu=1'">개인정보 변경</td>
					</tr>
					<tr>
						<td onclick="location.href='${pageContext.request.contextPath}/mypage/pwdcheck?menu=2'">비밀번호 변경</td>
					</tr>
					<tr>
						<td onclick="location.href='${pageContext.request.contextPath}/mypage/pwdcheck?menu=3'">회원 탈퇴</td>
					</tr>
				</table>
		      </div>
		    </div>
		  </div>
		</div>
	</fieldset>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>