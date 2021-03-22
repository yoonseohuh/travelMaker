<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
   
   <jsp:include page="/WEB-INF/views/include/top.jsp" />
   <!-- //top end -->
   
   <div class="wrapAll">
    	landWriteForm
    	<h4>장소 혹은 주소를 검색하시오.</h4>
    	<!-- 검색창 -->
		<div class="search">
			<i class="addressSearch"></i> <input type="text">
				<input type="button" class="box" value="검색">
		</div>
		<!-- 지도 -->
		<div id="map" style="width: 1000px; height: 400px;"></div>
	
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dbb3c6ebdae00379cc812a1240d45848&libraries=services,clusterer,drawing"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			   mapOption = {center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			        };  
		
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
		
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
		
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('서울시 중구 만리재로 199 1층', function(result, status) {
		
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
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">만리 199</div>'
			        });
			        infowindow.open(map, marker);
		
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			        
			   
			    } 
			});    
		</script>
   </div>
   <!-- //wrapAll end -->
   
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
   <!-- //footer end -->
   
</body>
</html>