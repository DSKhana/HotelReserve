<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 확인</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style type="text/css">
		.pwdck-form{ margin: auto; width: 700px; }
	</style>
</head>
<body>
	<c:import url="${pageContext.request.contextPath}/nav"></c:import>
	
	<form class="pwdck-form" method="post" action="${pageContext.request.contextPath}/mypage/pwdcheck?menu=${param.menu}">
		<fieldset>
			<legend>비밀번호 확인</legend>
			<div class="form-group">
				<label for="password" class="form-label mt-4">Password</label>
				<input type="password" class="form-control" id="password" name="password" placeholder="Password">
			</div>
			<c:if test="${not empty errorMsg}">
				<div>
					<p class="error" style="color:red; font-weight:bold;">${errorMsg}</p>
				</div>
			</c:if>
			<div class="d-grid gap-2">
			  <br><button class="btn btn-lg btn-primary" type="submit">확인</button>
			</div>
		</fieldset>
	</form>	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>