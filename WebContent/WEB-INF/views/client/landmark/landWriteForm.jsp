<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		<h1>landWriteForm</h1>
		
		<!-- 검색창 -->
		<form id="search.keyword" class="KeywordSearch"  onsubmit="window.QUERY=this.elements[0].value;return false">
			<div class="box_searchbar">
				<input type="text" id="search.keyword.query" name="q" class="query tf_keyword bg_on" maxlength="100" autocomplete="off" accesskey="s">
				<button type="button" id="search.keyword.submit" class="go ico_search btn_search">검색</button>
			</div>
		</form>
		<br />
		<br />
		<!-- 지도 -->
		<div id="map" style="width: 1000px; height: 400px;"></div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dbb3c6ebdae00379cc812a1240d45848&libraries=services,clusterer,drawing"></script>
		<script>
			
			var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
			infowindow = new kakao.maps.InfoWindow({
				zindex : 1
			}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);
			
			
			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places();

			function search(){
				var keyword = document.getElementById('keyword').value;
				
				// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			    ps.keywordSearch( keyword, placesSearchCB); 
			}
		
			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			function placesSearchCB(data, status, pagination) {
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
				var marker = new kakao.maps.Marker({
					map : map,
					position : new kakao.maps.LatLng(place.y, place.x)
				});

				// 마커에 클릭이벤트를 등록합니다
				kakao.maps.event.addListener(marker,'click',function() {// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
					infowindow.setContent('<div style="padding:5px;font-size:12px;">'+ place.place_name + '</div>');
					infowindow.open(map, marker);
				});
			}
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
			infowindow = new kakao.maps.InfoWindow({
				zindex : 1
			}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

			// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);

			// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {searchDetailAddrFromCoords(mouseEvent.latLng,function(result, status) {
					if (status === kakao.maps.services.Status.OK) {
						var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '+ result[0].road_address.address_name+ '</div>': '';
							detailAddr += '<div>지번 주소 : '+ result[0].address.address_name+ '</div>';

						var content = '<div class="bAddr">' + '<span class="title"></span>' + detailAddr + '</div>';

						// 마커를 클릭한 위치에 표시합니다 
						marker.setPosition(mouseEvent.latLng);
						marker.setMap(map);

						// 인포윈도우에 클릭한 위치에 대한 상세 주소정보를 표시합니다
						infowindow.setContent(content);
						infowindow.open(map, marker);
						}
					});
			});

			// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
			kakao.maps.event.addListener(map, 'idle', function() {
				searchAddrFromCoords(map.getCenter(), displayCenterInfo);
			});

			function searchAddrFromCoords(coords, callback) {
				// 좌표로 주소 정보를 요청합니다
				geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
						callback);
			}

			function searchDetailAddrFromCoords(coords, callback) {
				// 좌표로 상세 주소 정보를 요청합니다
				geocoder.coord2Address(coords.getLng(), coords.getLat(),
						callback);
			}

			// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
			function displayCenterInfo(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					var infoDiv = document.getElementById('centerAddr');

					for (var i = 0; i < result.length; i++) {
						// 행정동의 region_type 값은 'H' 이므로
						if (result[i].region_type === 'H') {
							infoDiv.innerHTML = result[i].address_name;
							break;
						}
					}
				}
			}
		</script>
		<form>
			<table>
				<tr>
					<td>랜드마크 장소명</td>
					<td><input type="text" name=""></td>
				</tr>
				<tr>
					<td>공개범위</td>
					<td><input type="radio" name="lOpen" value="0">전체 공개 
						<input type="radio" name="lOpen" value="1">회원 공개
					</td>
				</tr>
				<tr>
					<td>랜드마크 소개</td>
					<td><textarea rows="3" cols=100 name="lCont"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="등록" /> 
						<input type="button" value="취소" onclick="window.location='/travelMaker/client/landmark/landmark.tm'" />
					</td>
			</table>
		</form>
		
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->