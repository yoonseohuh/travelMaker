<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>Insert title here</title>
</head>
<body>
	<h1>landmark</h1>

	<div class="search">
		<i class="fas fa-search"></i> <input type="text"> <i
			class="fas fa-keyboard"></i> <i class="fas fa-microphone"></i>
	</div>
	<input type="button" class="box" value="장소 검색">

	<!-- 지도  -->
	<div id="map" style="width: 500px; height: 400px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dbb3c6ebdae00379cc812a1240d45848"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			level : 3
		};

		var map = new kakao.maps.Map(container, options);

		// 클릭한 위치에 마커 생성
		var marker = new kakao.maps.Marker({
			// 지도 중심좌표에 마커 생성
			position : map.getCenter()
		});
		// 지도에 마커 표시
		marker.setMap(map);

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder('map');

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('제주특별자치도 제주시 첨단로 242',function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,position : coords
								});

								// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
								var infowindow = new kakao.maps.InfoWindow({zIndex : 1});

								var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
								mapOption = {center : new kakao.maps.LatLng(37.566826,126.9786567), // 지도의 중심좌표
									level : 3
								// 지도의 확대 레벨
								};

								
								// 장소 검색 객체를 생성
								var ps = new kakao.maps.services.Places();

								// 키워드로 장소를 검색합니다
								ps.keywordSearch('이태원 맛집', placesSearchCB);

								// 키워드 검색 완료 시 호출되는 콜백함수 입니다
								function placesSearchCB(data, status,pagination) {
									if (status === kakao.maps.services.Status.OK) {

										// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
										// LatLngBounds 객체에 좌표를 추가합니다
										var bounds = new kakao.maps.LatLngBounds();

										for (var i = 0; i < data.length; i++) {
											displayMarker(data[i]);
											bounds.extend(new kakao.maps.LatLng(data[i].y,
															data[i].x));
										}

										// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
										map.setBounds(bounds);
									}
								}

								// 지도에 마커를 표시하는 함수입니다
								function displayMarker(place) {

									// 마커를 생성하고 지도에 표시합니다
									var marker = new kakao.maps.Marker({map : map,position : new kakao.maps.LatLng(place.y, place.x)
									});

									// 마커에 클릭이벤트를 등록합니다
									kakao.maps.event.addListener(marker,'click',function() {
														// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
														infowindow.setContent('<div style="padding:5px;font-size:12px;">'+ place.place_name + '</div>');
														infowindow.open(map,marker);
													});
								}

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
		
	</script>
</body>
</html>