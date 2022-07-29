<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문의상세</title>
	
	<%-- 메인 스타일 sheet --%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<style type="text/css">
		.form-group row{
			justify-center: center;
			width: 50%
		}
		.invisible {
			display: inline;
		}
		table{
			margin-left:auto; 
			margin-right:auto;
		}
		textarea{
			width:500px;
			height:500px;
			resize:none;			
		}			
	</style>
</head>

<body>
	<%-- nav --%>
	<c:import url="${pageContext.request.contextPath}/nav"></c:import>
	
	
	
		<div class="inquire-container-top">
			<%-- title --%>
			<div class="common-top_title" style="font-size: 30px; color: #F6CECE">
			문의 하기		
			</div><hr><br>
			<%-- Drill Down --%>
			<span class="common-top_drillDownBox">
				<a href="#" style="font-size: 20px; color: #F78181">문의 하기</a>
				<span> > </span>
				<a href="#" style="font-size: 20px">문의글 보기</a>
			</span>
		</div><br>
		
	<%-- Inquire main volume --%>
		<div class="read-form" style="align-center">
			<table style="margin:auto; width:800px">
				<tr>
					<td style="width:80px" align="center">Number</td>
					<td style="width:80px" align="center">
						<input class="form-control" id="readOnlyInput" type="text" placeholder="${inquire.seq}" readonly="">
					</td>
					<td style="width:80px" align="center">Date</td>
					<td style="width:140px" align="left">
						<input class="form-control" id="readOnlyInput" type="text" placeholder="${inquire.day}" readonly="">
					</td>
					
				</tr>
				<tr>
					<td style="width:80px" align="center">Category</td>
					<td colspan="2">
						<input class="form-control" id="readOnlyInput" type="text" placeholder="${inquire.category}" readonly="">
					</td>
				</tr>
				<tr>
					<td align="center">title</td>
					<td colspan="4" align="left">
						<input class="form-control" id="readOnlyInput" type="text" placeholder="${inquire.title}" readonly="">
					</td>
					
				</tr>
				<tr>
					<td>Description</td>
					<td colspan="4">
						<textarea class="form-control" id="readOnlyInput" placeholder="${inquire.description}" readonly=""></textarea>
					</td>
				</tr>
			</table>
		</div><br>
		<div class="inqbutton" align="center">
			<button type="button" class="invisible"> 목록으로 지금 당장 빨리 가기 </button>
			<button class="btn btn-outline-info" onclick="location.href='/inquire'">목록</button>
			<button class="btn btn-outline-success" onclick="location.href='/inquire/edit/${inquire.seq}'">수정</button>
			<button class="btn btn-outline-danger" onclick="location.href='/inquire/delete/${inquire.seq}'">삭제</button>
			<button class="btn btn-primary" onclick="location.href='/inquire/reply/${inquire.seq}'">답변등록</button>
		</div>
	<%-- 풋터 --%>
	
</html>