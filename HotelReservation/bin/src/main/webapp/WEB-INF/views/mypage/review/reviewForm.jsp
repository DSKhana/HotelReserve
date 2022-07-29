<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리뷰 작성</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style type="text/css">
 		.title{vertical-align: middle;}
		.img-field{display: flex; justify-content: center; align-items: center; height: 100%}
		.review-img{width: 100%;}
		.button-area{float: right;}
		.table{table-layout: fixed;}
	</style>
</head>
<body>
	<c:import url="${pageContext.request.contextPath}/nav"></c:import><br>
	
	<div class="container">
		<fieldset class="form-group">
			<legend>리뷰 작성</legend>
			<form method="post">
			    <table class="table">
				  <thead>
				    <tr>
				      <th>Image</th>
				      <th>Input</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row" rowspan="4" style="height: 0px">
				      	<div class="img-field">
				      		<c:if test="${type eq 'hotel'}">
				      			<img class="review-img" src="${pageContext.request.contextPath}/resources/img/hotel/${img}" alt="review-target-image" id="image" style="vertical-align: middle;">
				      		</c:if>
				      		<c:if test="${type eq 'restaurant'}">
				      			<img class="review-img" src="${pageContext.request.contextPath}/resources/img/restaurantImg/${img}" alt="review-target-image" id="image">
				      		</c:if>
				      	</div>
				      </th>
				      <th class="title">${name}</th>
				    </tr>
				    <tr>
				    	<th class="title d-flex">
				    		<span style="margin-right: 15px;">평점</span>
				  			<select class="form-select-sm" id="score" name="score">
						        <option value="0">☆☆☆☆☆</option>
						        <option value="1">★☆☆☆☆</option>
						        <option value="2">★★☆☆☆</option>
						        <option value="3">★★★☆☆</option>
						        <option value="4">★★★★☆</option>
						        <option value="5">★★★★★</option>
						    </select>
				    	</th>
				    </tr>
				    <tr>
				    	<th class="title">리뷰 내용</th>
				    </tr>
				    <tr>
				    	<td><textarea class="form-control" id="reviewDesc" name="reviewDesc" rows="16"></textarea></td>
				    </tr>
				  </tbody>
				</table>
				<section class="button-area">
				  	<button type="submit" class="btn btn-outline-secondary">리뷰 등록</button>
				  	<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/mypage'">리뷰 취소</button>
			  	</section>
			</form>
		</fieldset>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>