<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> -->
<!-- <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %> -->
<c:set var="dateYMD" value="${DateTimeFormatUtil.changeToYMD(review.WDate)}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변페이지</title>

<%-- 메인 스타일 sheet --%>

<%-- jQuery --%>


</head>
<body>
	<%-- nav --%>
	<c:import url="${pageContext.request.contextPath}/nav"></c:import>
	
	<%-- 메인 컨테이너 --%>
	<div class="inquire-container-main" style="height: auto;">
		<%-- 네비게이션 --%>
		<nav class="inquire-container_navi" style="height: 1200px">
		</nav>
	</div>
	
	<%-- 섹션 --%>
	<section id="inquireD-container">
		<div class="inquire-container-top">
			<%-- 제목 --%>
			<div class="common-top__title" style="color: #F6CECE;">
			문의하기		
			</div>
			<%-- 드릴타운 --%>
			<span class="common-top__drilldownbox">
				<a href="#" style="color: #F78181;">답변 작성</a>
				<span> > </span>
				<a href="#">문의 답변 작성</a>
			</span>
		</div>
		
	<%-- 문의글 본문 --%>
		<table class="inquire-tableLayout">
			<tr>
				<td>Number</td>
				<td>
					<span id="in_seq">${inquire.seq}</span>
				</td>
				<td>Date</td>
				<td>
					<span id="in_day">${inquire.regDate}</span>
				</td>
			</tr>
			<tr>
				<td>Category</td>
				<td>
					<span id="in_cat">${inquire.category}</span>
				</td>
				<td>
					<span id="in_hotel">${inquire.hotelcode}</span>
				</td>
			</tr>
			<tr>
				<td>title</td>
				<td>
					<span id="in_title">${inquire.title}</span>
				</td>
			</tr>
			<tr>
				<td>Description</td>
				<td>
					<p id="in_desc">
						${inquire.description}
					</p>
				</td>
			</tr>
			<tr>
				<td>reply</td>
				<td>
					<p id="in_desc">
						${inquire.reply}
					</p>
				</td>
			</tr>
		</table>	
		
	</section>
		<button type="button" class = "btn btn-outline-info" onclick="location.href='/inquire'">목록</button>
		<button type="button" class = "btn btn-outline-success" onclick="location.href='/inquire/edit'">답변등록</button>	
	<%-- 풋터 --%>
	
</html>