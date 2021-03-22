<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		
		<a href="/travelMaker/land/landWrite.tm"><button>랜드마크작성</button></a>
		
		<!-- 검색창 -->
		<div class="search">
			<i class="fas fa-search"></i> <input type="text"> <i
				class="fas fa-keyboard"></i> <i class="fas fa-microphone"></i>
		</div>
		<input type="button" class="box" value="장소 검색">
		
		<!-- 지도  -->
		<div id="map" style="width: 1000px; height: 400px;"></div>
	
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dbb3c6ebdae00379cc812a1240d45848"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center : new kakao.maps.LatLng(33.450701, 126.570667),
				level : 3
			};
	
			var map = new kakao.maps.Map(container, options);
			
			// 마커가 표시될 위치  
			var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

			// 마커를 생성 메서드
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			// 지도에 마커 표시
			marker.setMap(map);
			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent 
			});
			  
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker); 
		</script>
		
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
   
</body>
</html>