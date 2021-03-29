<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<jsp:include page="/WEB-INF/views/include/top.jsp" />
<!-- //top end -->

<div class="wrapAll">

	<!-- 지도 생성 -->
	<div id="map" style="width: 1000px; height: 400px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dbb3c6ebdae00379cc812a1240d45848&libraries=services,clusterer,drawing"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		
	
	</script>
	<h1>LandmarkCont</h1>
	<form method="get">
	<table>
		<tr>
			<td>${land.lName}</td>
		</tr>
		<tr>
			<td>${land.writer} 님의 랜드마크 입니다.</td>
		</tr>
		<tr>
			<td>${land.lType}</td>
		</tr>
		<tr>
			<td>${land.addr}</td>
		</tr>
		<tr>
			<td>${land.lCont}</td>
		</tr>
		<tr>
			<td><button id="boardLiked">좋아요</button></td>
			<td><button id="report">신고하기</button></td>
			<td><input type="button">삭제</td>
		</tr>
	</table>

	<input type="hidden" id="xLoc" value="${land.xLoc}" /> <input
		type="hidden" id="yLoc" value="${land.yLoc}" />

	</form>

</div>
<!-- //wrapAll end -->

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->