<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Success</title>
</head>
<body>
	<script type="text/javascript">
		var msg = `${msg}`;
		var type = `${type}`
		alert(msg)
		if(type === 'signup'){
			location.href='${pageContext.request.contextPath}/'
		}else if(type === 'change' || type === 'pwdchange'){
			location.href='${pageContext.request.contextPath}/mypage'
		}else{
			location.href='${pageContext.request.contextPath}/login'
		}
	</script>
</body>
</html>