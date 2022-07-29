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
<title>문의상세</title>

<%-- 메인 스타일 sheet --%>

<%-- jQuery --%>


</head>
<body>
	<%-- nav --%>
	<c:import url="${pageContext.request.contextPath}/nav"></c:import>
	
	
	<%-- Section --%>
	<section id="inquireD-container">
		<div class="inquire-container-top">
			<%-- title --%>
			<div class="common-top_title" style="color: #F6CECE;">
			문의 하기		
			</div>
			<%-- Drill Down --%>
			<span class="common-top_drillDownBox">
				<a href="#" style="color: #F78181;">문의 하기</a>
				<span> > </span>
				<a href="#">문의글 보기</a>
			</span>
		</div>
		
	<%-- Inqruie main volume --%>
		<table class="table table-hover">
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
		</table>	
		
	</section>
		<button type="button" class = "btn btn-outline-info" onclick="location.href='/inquire'">목록</button>
		<button type="button" class = "btn btn-outline-success" onclick="location.href='/inquire/edit'">수정</button>
		<button type="button" class = "onclick-outline-danger=" onclick="location.href='/inquire/delete'">삭제</button>
		<button type="button" class = "btn btn-primary" onclick="location.href='/inquire/reply'">답변등록</button>
	
	<%-- 풋터 --%>
	
</html>