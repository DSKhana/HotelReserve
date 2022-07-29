<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<link rel="icon" href="resources/img/hotel.png">

<%-- Main Style Sheet --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/signup.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style type="text/css">
		
		.form-group{
		    width: 100%;
		}		
		.form-select {
		    float:left;
		    width:30%;
		    box-sizing: border-box;
		}		
		.form-control{
		    float:left;
		    width:50%;
		    box-sizing: border-box;
		}		
		.btn btn-primary{
		    float:left;
		    width:10%;
		    box-sizing: border-box;
		}
		.pagination{
			justify-content : center;
		}
	</style>
</head>
<body>
	<%-- Header --%>
	
	
	<%-- Navigation --%>
	<c:import url="${pageContext.request.contextPath}/nav"></c:import>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<%-- 상단 제목 --%>
	<div class="crew-topContainer" style="width: 1100px">
	
		<%-- 제목 --%>
		<div class="common-top_title" style="font-size: 30px; color: #F6CECE">
		문의하기</div><hr><br>
	</div>


	<%-- 검색바 --%>
	<form action="/inquire" class="form-inline d-flex justify-center-center" method="GET">
		<div class="form-group">	
			<select class="form-select" id="cat" name="cat" style="width:100px"> <%-- 검색조건 --%>
				<option value="title">제목</option>
				<option value="description">내용</option>
				<option value="writer">작성자</option>
			</select>
			<%-- 검색어 입력 --%>
			<input type="text" class="form-control" placeholder="검색어를 입력하세요" id="keyword" name="keyword" style="width:400px" >&nbsp&nbsp
			<%-- 검색 버튼 --%>
			<button class="btn btn-primary" type="submit"> 검색 </button>
		</div>
    </form>
	
		

	<%-- 글쓰기 버튼 --%>
	<div id="inquire-top-buttonbox" align="right">
		<button class="btn btn-outline-danger"  onclick="location.href='/inquire/write'">글쓰기</button>

	</div>

	<%-- 글 목록 --%>	
	<div class="moonTable" id="inquire-list">
		<table class="table table-hover">
		  <thead>
		    <tr align="center">
		      <th scope="col">글번호</th>
		      <th scope="col">카테고리</th>
		      <th scope="col">제목</th>
		      <th scope="col">등록일</th>
		      <th scope="col">작성자</th>
		      <th scope="col">답변상태</th>	      
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${list.content}" var="inquire">
		  		<tr class="table-active" align="center">
			      <td>${inquire.seq}</td>
			      <td>${inquire.category}</td>
			      <td><a href="<c:url value="/inquire/read/${inquire.seq}"/>">${inquire.title}</a></td>
			      <td>${inquire.day}</td>
			      <td>${inquire.username}</td>
			      <td>${inquire.status}</td>
			    </tr>		  	
		  	</c:forEach>		    
		  </tbody>
		</table>
	</div>
 	
	<!-- Pagination  -->
	<div class="text-xs-center">
		<ul class="pagination justify-content-center">
			<!-- Previous -->
			<c:choose>
				<c:when test="${pageList.first}"></c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="/inquire/?cat=${param.cat}&keyword=${param.keyword}&page=0">처음</a></li>
					<li class="page-item"><a class="page-link" href="/inquire/?cat=${param.cat}&keyword=${param.keyword}&page=${pageList.number-1}">&larr;</a></li>
				</c:otherwise>
			</c:choose>
			
			<!-- Page Group -->
			<c:forEach begin="${startBlockPage}" end="${endBlockPage}" var="i">
				<c:choose>
					<c:when test="${pageList.pageable.pageNumber+1 == i}">
						<li class="page-item disabled"><a class="page-link" href="/inquire/?cat=${param.cat}&keyword=${param.keyword}&page=${i-1}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="/inquire/?cat=${param.cat}&keyword=${param.keyword}&page=${i-1}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- Next -->
			<c:choose>
				<c:when test="${pageList.last}"></c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="/inquire/?cat=${param.cat}&keyword=${param.keyword}&page=${pageList.number+1}">&rarr;</a></li>
					<li class="page-item"><a class="page-link" href="/inquire/?cat=${param.cat}&keyword=${param.keyword}&page=${pageList.totalPages-1}">마지막</a></li>
				</c:otherwise>
			</c:choose>
		</ul>		
	</div>
</body>
</html>