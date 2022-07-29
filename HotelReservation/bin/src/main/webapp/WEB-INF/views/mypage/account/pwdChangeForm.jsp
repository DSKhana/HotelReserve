<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 변경</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/signup.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- Kakao daum postcode -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<style type="text/css">
		.pwdChange-form{margin:auto; width:700px;}
		.error-msg{color:red;}
	</style>
</head>
<body>
	<c:import url="${pageContext.request.contextPath}/nav"></c:import>
	
	<form class="pwdChange-form" method="post" action="${pageContext.request.contextPath}/mypage/pwdChange">
	  <fieldset>
		<br><legend>비밀번호 변경</legend>
			<div class="form-group">
				<label for="password" class="form-label mt-4">Password</label>
				<input type="password" class="form-control" id="password" name="password" 
					placeholder="Password" oninput="passwordValid(this)" value="${signupFormDto.password}">
				<div class="invalid-feedback"><span id="idResultInValid">비밀번호가 취약합니다.</span></div>
				<div class="valid-feedback"><span id="idResultValid">비밀번호 이상 없습니다.</span></div>
				<small id="pwdHelp" class="form-text text-muted">비밀번호는 12자부터 20자까지 알파벳, 숫자, 특수문자만 사용 가능합니다.</small><br>
				<small id="pwdHelp2" class="form-text text-muted">적어도 각각 하나의 알파벳, 숫자, 특수문자가 입력되어야 합니다.</small>
				<c:if test="${valid_password ne null}">
					<br><small id="userId-error-msg" class="form-text error-msg">${valid_password}</small>
				</c:if>
			</div>
			<div class="form-group">
				<label for="passwordCheck" class="form-label mt-4">Password Check</label>
				<input type="password" class="form-control" id="passwordCheck" name="passwordCheck" 
						placeholder="Password Check" oninput="passwordCheckValid(this)" value="${signupFormDto.passwordCheck}">
				<div class="invalid-feedback"><span id="idResultInValid">비밀번호 확인이 잘못되었습니다.</span></div>
				<div class="valid-feedback"><span id="idResultValid">비밀번호 확인 이상 없습니다.</span></div>
				<c:if test="${valid_passwordCheck ne null}">
					<small id="userId-error-msg" class="form-text error-msg">${valid_passwordCheck}</small>
				</c:if>
			</div>
			<br><div>
				<button type="submit" class="btn btn-primary form-control">변경</button>
			</div>
			<br><br><br><br>
		</fieldset>
	</form>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>