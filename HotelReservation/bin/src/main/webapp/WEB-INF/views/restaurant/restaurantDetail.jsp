<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>맛집 세부정보</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link href="${pageContext.request.contextPath}/resources/css/restaurant.css" rel="stylesheet" type="text/css">
<style>
	img {
	width: 100%;
	height: 150px;
	object-fit: cover;
	}
	div {
		text-align: center;
	}
	table {
		width: 100%;
		table-layout: fixed;
	}
</style>
</head>
<body>
	<!-- 상단메뉴 -->
	<c:import url="${pageContext.request.contextPath}/nav"></c:import>

	<div class="card border-primary mb-3">
    <div class="row no-gutters">
        <div class="col-md-4" style="text-align:center; align-items:center; display: flex; justify-content:center;">
            <img alt="" class="detail-restaurant-img" src="<c:url value="${pageContext.request.contextPath}/resources/img/restaurantImg/${restaurant.img}"/>"/>        	
        </div>
            <div class="col-md-8">
            <div class="card-body">
                <h3 class="card-title">${restaurant.name}</h3>
                <hr>
                <p class="card-text">주소 : ${restaurant.address}</p>
                <p class="card-text">TEL : ${restaurant.phone}</p>
                <hr>
                <p class="card-text">${restaurant.description}</p>
                <hr>
				<div id="map" style="width:100%;height:350px;"></div>
				
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d50d8549d368fe1631e1623bf9f97404&libraries=services"></script>
				<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch('${restaurant.address}', function(result, status) {
				// 정상적으로 검색이 완료됐으면 
					if (status === kakao.maps.services.Status.OK) {
						var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">${restaurant.name}</div>'
				        });
				        infowindow.open(map, marker);
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});    
				</script>
            </div>
        </div>
    </div>
	</div>
	
	<!-- 메뉴 -->
	<table class="table table-hover">
		<thead>
	    	<tr>
	      		<th scope="col">사진</th>
	      		<th scope="col">메뉴명</th>
	      		<th scope="col">가격</th>
	      		<th scope="col">소개</th>
	    	</tr>
	  	</thead>
	  	<tbody>
	  		<c:forEach var="menu" items="${menuList}">
	    		<tr class="table-active">
	      		<td><img alt="" src="<c:url value="/resources/img/menuImg/${menu.img}"/>"/></td>
	      		<td><a href="<c:url value="/restaurant/menu/${menu.seq}"/>">${menu.name}</a></td>
	      		<td>${menu.price}</td>
	      		<td>${menu.description}</td>
	    		</tr>
	    	</c:forEach>
	  	</tbody>
	</table>
	
	<!-- 버튼 -->
	<a class="btn btn-primary" href="/admin/${restaurant.seq}/new">메뉴등록</a>
	<a class="btn btn-primary" href="/admin/restaurant/update/${restaurant.seq}">수정</a>
    <a class="btn btn-primary" href="/admin/restaurant/delete/${restaurant.seq}">삭제</a>
    <a class="btn btn-primary" href="/restaurant">이전</a>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>