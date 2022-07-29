<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HotelDetail</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
</head>
<body>
	<c:import url="${pageContext.request.contextPath}/nav"></c:import>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<div style="display: inline-flex;">
		<div class="card mb-3" style="width: 35%; height: 30%; display:inline-flex;">
			<div style="margin-bottom: 60%; height: 30%; display:inline;">
				<h3 class="card-header">Card header</h3>
				<div class="card-body">
					<h5 class="card-title">Special title treatment</h5>
					<h6 class="card-subtitle text-muted">Support card subtitle</h6>
				</div>
				<svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="200" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle">
					<rect width="100%" height="100%" fill="#868e96"></rect>
					<text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
				</svg>
				<div class="card-body">
					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				</div>
				<div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">Cras justo odio</li>
						<li class="list-group-item">Dapibus ac facilisis in</li>
						<li class="list-group-item">Vestibulum at eros</li>
					</ul>
				</div>
				
				
				<div style="margin-top: 20%;">
					<div class="card-footer text-muted">
							 리뷰
					</div>
					<div class="accordion" id="accordionExample">
						<c:forEach var="i" begin="0" end="2">
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
										리뷰<c:out value="${i}"/>
									</button>
								</h2>
								<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
									<div class="accordion-body">
										<strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			
			
			</div>
		</div>
		
	
		<div style="width: 100%; position: relative; margin-left: 7%">
			<div style="width : 80%; top: 0px; right: 0;">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">Type</th>
							<th scope="col" colspan="3">호텔정보</th>
						</tr>
					</thead>
					<tbody>
						<tr class="table-active">
							<th scope="row">호텔명</th>
							<td colspan="3">Column content</td>
						</tr>
						<tr>
							<th scope="row">주소</th>
							<td colspan="3">Column content</td>
						</tr>
						<tr class="table-primary">
							<th scope="row">연락처</th>
							<td colspan="3">Column content</td>
						</tr>
						<tr class="table-secondary" height="300">
							<th scope="row">호텔 소개</th>
							<td colspan="3">Column content</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="margin-top: 15%">
				<c:forEach var="i" begin="0" end="2">
					<div style="width: 80%; position: obsolute; display: inline-flex; right: 0; bottom: 0px; height: 290px">
						<div class="card bg-light mb-3" style="width: 30%;">
							<div class="card-header">객실 사진</div>
							<div class="card-body">
								<h4 class="card-title">이곳에 사진이 올라간다</h4>
							</div>
						</div>
						<div class="card" style="width: 70%;">
							<div class="card-body">
								<h4 class="card-title">방 이름</h4>
								<h6 class="card-subtitle mb-2 text-muted">n명(인원수)</h6>
								<p class="card-text">방 설명</p>
								<a href="#" class="card-link">이 방으로</a>
								<a href="#" class="card-link">당장 예약</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
		</div>
	</div>
	

		
		
</body>
</html>