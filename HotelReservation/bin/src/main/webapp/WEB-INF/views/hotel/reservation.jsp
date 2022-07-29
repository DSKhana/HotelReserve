<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약</title>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<style type="text/css">
		.table{table-layout: fixed;}
		.title{vertical-align: middle;}
		.button-area{float: right;}
		.img-field{display: flex; align-items: center; justify-content: center;}
		.option-title{border-bottom: none;}
		.warning li::marker{content: '- ';}
	</style>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/reserve.js"></script>
</head>
<body>
	<c:import url="${pageContext.request.contextPath}/nav"></c:import>
	
	<div class="container">
		<fieldset class="form-group">
			<legend>예약</legend>
			<form method="post" onsubmit="return submitCheck()">
				<input type="hidden" id="seq" name="seq" value="${seq}">
				<input type="hidden" id="basePrice" name="basePrice" value="${basePrice}" disabled="disabled">
				<input type="hidden" id="dateCheck" name="dateCheck" value="0">
				<input type="hidden" id="checkin" name="checkin" value="${now}">
				<input type="hidden" id="checkout" name="checkout" value="${next}">
			    <table class="table">
				  <thead>
				    <tr>
				      <th>Room</th>
				      <th>Info</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th rowspan="4">
				      	<div style="imgfield">
							<img src="${pageContext.request.contextPath}/resources/img/room/${img}" alt="review-target-image" id="img" style="width: 100%">
				      	</div>
				      </th>
				      <th class="title">${roomName}</th>
				    </tr>
				    <tr>
				      <th class="title">수용인원 : ${roomPeople}인</th>
				    </tr>
				    <tr>
				      <th class="title">1박당 가격 : ${roomPrice}원</th>
				    </tr>
				    <tr>
				      <th class="title">세부사항 : ${roomDesc}</th>
				    </tr>
				    <tr>
				    	<th rowspan="8">
				    		<p>
				    			유의사항
				    		</p>
				    		<ul class="warning text-muted">
								<li>예약 취소는 체크인 하루 전까지 가능합니다.</li>
								<li>당일 예약은 취소 불가합니다.</li>
								<li>추가 인원이 발생하는 경우 해당 호텔로 미리 연락하시기 바랍니다.</li>
								<li>전체 투숙 인원이 최대 수용인원을 초과해서는 안 됩니다.</li>
								<li>위 사항을 어길 경우 숙박을 거절당할 수 있습니다.</li>
								<li>모든 예약은 타인에게 매매하거나 양도할 수 없습니다.</li>
								<li>객실 사진과 실제 객실은 상이할 수 있습니다.</li>
								<li>기타 질문(문의) 사항이 있을 경우 해당 호텔로 연락해 주시기 바랍니다.</li>
							</ul>
				    	</th>
				    	<th class="title option-title">예약일자 선택(체크인 / 체크아웃)</th>
				    </tr>
				    <tr>
				    	<th>
				    		<div>
								<input class="form-control" type="text" id="daterange" name="daterange" oninput="setPrice(this)"/>
				    		</div>
				    		<small id="dateCheckMsg" class="form-text">체크인 / 체크아웃 일자를 선택해주세요.</small>
				    	</th>
				    </tr>
				    <tr>
				    	<th class="title option-title">인원수</th>
				    </tr>
				    <tr>
				    	<th>
				  			<select class="form-select form-control" id="people" name="people">
				  				<!-- 이부분 forEach 사용하기 -->
				  				<c:forEach var="i" begin="1" end="${roomPeople}">
							        <option value="${i}">${i}</option>
						        </c:forEach>
						    </select>
				    	</th>
				    </tr>
				    <tr>
				    	<th class="title option-title">가격</th>
				    </tr>
				    <tr>
				    	<th style="text-align: right; font-size: 18px;"><span  id="priceField">${roomPrice}</span>원
				    		<input type="hidden" id="price" name="price" value="${roomPrice}">
				    	</th>

				    </tr>
				  </tbody>
				</table>
				<section class="button-area">
				  	<button type="submit" class="btn btn-outline-secondary">예약 등록</button>
				  	<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/mypage'">예약 취소</button>
			  	</section>
			</form>
		</fieldset>
	</div>
	<script>
		$("#daterange").daterangepicker({
			   "locale": {
		        "format": "YYYY-MM-DD",
		        "separator": " ~ ",
		        "applyLabel": "확인",
		        "cancelLabel": "취소",
		        "fromLabel": "From",
		        "toLabel": "To",
		        "customRangeLabel": "Custom",
		        "weekLabel": "W",
		        "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
		        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		    },
		    "startDate": new Date(),
		    "endDate": new Date(),
		    "minDate": new Date(),
		    "drops": "auto"
			}, function(start, end, label) {
				var startDate = start.format('YYYY-MM-DD')
				var endDate = end.format('YYYY-MM-DD')
				setPrice(startDate, endDate)
				$('#checkin').val(startDate)
				$('#checkout').val(endDate)
			});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>