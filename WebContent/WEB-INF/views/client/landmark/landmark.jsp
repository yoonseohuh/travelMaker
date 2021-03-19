<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>landmark</h1>
	
	<!-- 지도  -->
	<div id="map" style="width:500px;height:400px;"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dbb3c6ebdae00379cc812a1240d45848"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};
	
		var map = new kakao.maps.Map(container, options);
		
		// 클릭한 위치에 마커 생성
		var marker = new kakao.maps.Marker({
			// 지도 중심좌표에 마커 생성
			position: map.getCenter()
		});
		// 지도에 마커 표시
		marker.setMap(map);
		
		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
		    // 클릭한 위도, 경도 정보를 가져온다 
		    var latlng = mouseEvent.latLng; 
		    
		    // 마커 위치를 클릭한 위치로 옮긴다
		    marker.setPosition(latlng);
		});
		
		

	</script>
</body>
</html>