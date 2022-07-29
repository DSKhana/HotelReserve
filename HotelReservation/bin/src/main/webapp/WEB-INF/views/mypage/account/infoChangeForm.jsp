<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>개인 정보 변경</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/signup.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- Kakao daum postcode -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<style type="text/css">
		.infoChange-form{margin:auto; width:700px;}
		.submit-reset{float:right;}
		.error-msg{color:red;}
	</style>
</head>
<body>
	<c:import url="${pageContext.request.contextPath}/nav"></c:import>
	
	<form class="infoChange-form" method="post" action="${pageContext.request.contextPath}/mypage/infoChange">
	  <fieldset>
		<br><legend>개인 정보 변경</legend>
			<label class="form-label mt-4" for="inputID">ID</label>
			<div class="form-group">
				<input class="form-control" type="text" id="userId" name="userId" 
					value="${infoChangeFormDto.userId}" readonly>
			</div>
			<div class="form-group">
				<label class="form-label mt-4" for="inputUsername">이름</label>
				<input type="text" placeholder="Name" class="form-control" id="username" name="username" value="${infoChangeFormDto.username}">
				<c:if test="${valid_username ne null}">
					<small id="userId-error-msg" class="form-text error-msg">${valid_username}</small>
				</c:if>
			</div>
			<div class="form-group">
				<label for="email" class="form-label mt-4">Email Address</label>
				<input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter email" value="${infoChangeFormDto.email}">
				<c:if test="${valid_email ne null}">
					<small id="userId-error-msg" class="form-text error-msg">${valid_email}</small>
				</c:if>
			</div>
			<div class="form-group">
				<label for="phone" class="form-label mt-4">Phone Number</label>
				<input type="text" class="form-control" id="phone" name="phone" placeholder="010-1234-5678" maxlength="13" 
					oninput="setPhoneForm(this)" value="${infoChangeFormDto.phone}">
				<c:if test="${valid_phone ne null}">
					<small id="userId-error-msg" class="form-text error-msg">${valid_phone}</small>
				</c:if>
			</div>
			<div class="form-group">
				<label for="address" class="form-label mt-4">Address</label>
				<div class="input-group">
					<input type="text" class="form-control" id="address" name="address" placeholder="" value="${infoChangeFormDto.address}" readonly>
					<input type="button" class="btn btn-outline-dark" value="검색" onclick="searchAddress()">
				</div>
				<c:if test="${valid_address ne null}">
					<small id="userId-error-msg" class="form-text error-msg">${valid_address}</small>
				</c:if>
				<input type="text" class="form-control" id="addressDetail" name="addressDetail" placeholder="상세 주소" value="${infoChangeFormDto.addressDetail}">
				<c:if test="${valid_addressDetail ne null}">
					<small id="userId-error-msg" class="form-text error-msg">${valid_addressDetail}</small>
				</c:if>
			</div>
			<br><div class="submit-reset">
				<button type="reset" class="btn btn-primary">Reset</button>
				<button type="submit" class="btn btn-primary">Change</button>
			</div>
			<br><br><br><br>
		</fieldset>
	</form>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>