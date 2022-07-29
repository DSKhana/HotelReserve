<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>resign</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style type="text/css">
		warning li::marker{content: '- ';}
		ul{padding-left: 10px;}
	</style>
</head>
<body>
	<div class="card mb-3 mt-4" style="max-width: 40rem; margin: auto;">
	  <h4 class="card-header">회원 탈퇴</h4>
	  <div class="card-body">
	    <h5 class="card-title">정말로 탈퇴하시겠습니까?</h5>
	    <ul class="text-muted">
	    	<li>탈퇴 후 해당 계정은 이용불가 상태로 전환되며, 로그인 하실 수 없습니다.<br></li>
	    	<li> 이용 간 불편 사항 및 문의 사항은 문의 게시판을 통해 문의 주시면 빠른 시일 내에 성심 성의껏 답변 드리겠습니다.</li>
	    </ul>
	  </div>
	  <div class="card-body">
		<p class="card-text">
			1. 탈퇴 시 유의사항을 확인해 주시기 바랍니다.
		</p>
		<ul class="warning text-muted">
			<li>회원 탈퇴 시 회원전용 웹 서비스 이용이 불가합니다.</li>
			<li>탈퇴 후에도, 문의 내역 및 리뷰 작성 기록은 보존됩니다.</li>
			<li>삭제를 원하시는 경우 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하시기 바랍니다.</li>
			<li>이미 예약이 완료된 건은 탈퇴로 취소되지 않습니다.</li>
			<li>탈퇴 후에도 예약 내역은 보존됩니다.</li>
		</ul>
		<div class="form-check">
	        <input class="form-check-input" type="checkbox" id="resignAgreeCheck">
	        <label class="form-check-label" for="flexCheckDefault">
	         	상기 유의사항을 확인하였으며, 회원 탈퇴에 동의합니다.
	        </label>
		</div>
	  </div>
	  <div class="card-body btn-group">
		<button type="button" class="btn btn-outline-secondary" onclick="resignConfirm()">탈퇴</button>
		<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/mypage'">취소</button>
	  </div>
	  <div class="card-footer text-muted">
	    by Hotel Reservation
	  </div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script>
		function getContextPath() {
		    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
		}
		function resignConfirm(){
			var resignAgree = $('#resignAgreeCheck').is(':checked')
			if(resignAgree){
				if(confirm("정말 탈퇴하시겠습니까?")){
					$.ajax({
						url:`${pageContext.request.contextPath}/mypage/resign`,
						type:"POST",
						success: function(result){
							if(result == true){
								alert("회원 탈퇴가 완료되었습니다.\n그동안 이용해주셔서 감사합니다.")
								location.href='${pageContext.request.contextPath}/'
							}else{
								alert("알 수 없는 이유로 인하여 회원 탈퇴가 실패하였습니다. 다시 시도해 주세요.")
							}
						},
						error: function(error){
							alert("알 수 없는 이유로 인하여 회원 탈퇴가 실패하였습니다. 다시 시도해 주세요.")
						}
					});
				}
			}else{
				alert("회원 탈퇴 동의를 체크해주세요.")
			}
		}
	</script>
</body>
</html>