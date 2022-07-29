<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>문의 수정</title>
<link rel="icon" href="/img/hotel.png">
<!-- include css -->
   	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style type="text/css">
		.inquire-form{margin:auto; width:700px;}
		.cat-select {
		    width: 100%;
		}		
		.form-select {
		    float:left;
		    width:50%;
		    box-sizing: border-box;
		}		
		.form-select {
		    float:left;
		    width:50%;
		    box-sizing: border-box;
		}
		.invisible {
			display: inline;
		}
		textarea{
			width:500px;
			height:500px;
			resize:none;			
		}
		
	</style>
</head>
<body>
<%-- 네비 --%>
	<c:import url="${pageContext.request.contextPath}/nav"></c:import>

<%-- 제목 --%>
	<div class="common-iuTop--title" style="font-size: 30px; color:#F4B7B4">
		문의 수정
	</div>
	<br><br>

		<%-- 글쓰기 폼 카테고리/제목/내용/ --%>
	<div class="inquire-form" style="align-center">
        <form class="inquire-form" action="/inquire/write" method="post">
            <table>
				
				<%-- 카테고리 : select --%>
                <tr>
                    <td style="width: 170px" align="center"> Category </td>
                    <td>
						<div class="cat-select">
                        <select id="category" name="category" class="form-select" style="width:150px;height:40px;">
                            <option selected disabled> 선택 </option>
                            <option value="hotel"> 숙소 </option>
                            <option value="rest"> 맛집 </option>
                            <option value="account"> 계정 </option>
                            <option value="site"> 사이트이용 </option>
                            <option value="improve"> 개선사항 </option>
                            <option value="guituar"> 기타 </option>
                        </select>
                        
                        <c:if test="${category eq 'hotel'}">
							<select name="hotelCode" class="form-select" style="width:200px;height:40px;">
	                        	<%-- 호텔코드 선택하는 메뉴 출력--%>
	                        	<option selected disabled> hotelcode 선택 </option>
	                        	<option value="${hotel.code}">${hotel.code}</option>
	                            <option value="${hotel.code}">${hotel.code}</option>
	                        </select>
                        </c:if>
                        </div>
                    </td>
                </tr>

                <%-- 제목 : text --%>
                <tr class="common-tbl__item">
                    <td style="width: 170px" align="center">
                        title
                    </td>
                    <td>
                        <input  name="title" class="form-control" style="width: 600px" type="text"/>
                    </td>
                </tr>

                <%-- 내용 : textarea --%>
                <tr class="common-tbl__item">
                    <td style="width: 170px" align="center">
                        Description
                    </td>
                    <td>
                        <textarea class="form-control" name="description" rows="30" cols="84"></textarea>
                    </td>
                </tr>
            </table>
			<br>
			<%-- 등록 버튼 --%>
            <div id="reviewIU-container--bottom" align="center">
            	<button type="button" class="invisible">목록으로</button>
            	&nbsp
				<button type="submit" onclick="uploadCanvasData(save);" id="inquire-btn-submit"
                        class="btn btn-danger"> 수정</button>
				&nbsp
				<button type="button" onclick="location.href='/inquire'" class="btn btn-success">목록으로</button>
            </div>
        </form>
	</div>
	 <br><br>
	<%-- footer --%>
	
</body>
</html>