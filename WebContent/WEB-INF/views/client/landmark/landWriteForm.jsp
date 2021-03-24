<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		<h1>landWriteForm</h1>
		
		<!-- 검색창 -->
		<div>
			<input type="text" id="searchKeyword">
			<button id="searchBtn">검색</button>
			<button id="deleteBtn">삭제</button>
		</div>
		<br />
		<br />
		<!-- 지도 -->
		<div id="map" style="width: 1000px; height: 400px;"></div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dbb3c6ebdae00379cc812a1240d45848&libraries=services,clusterer,drawing"></script>
		<script>
		$(document).ready(function(){
		
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
			
			// 검색을 했을때 검색창에 적은 것의 값을 받습니다
			function search(){
				var keyword = document.getElementById('searchKeyword').value;
				
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
						bounds.extend(new kakao.maps.LatLng(data[i].y,data[i].x));
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
				// 장소를 찍어주세요
				console.log(place);// 장소명(place_name), 유형(category_name), 주소 (road_address_name)
				
				// 마커에 클릭이벤트를 등록합니다 여기서 많이 헤맸어요
				kakao.maps.event.addListener(marker,'click',function() {// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
					infowindow.setContent('<div style="padding:5px;font-size:12px;">'+ place.place_name + '</div>');
					infowindow.open(map, marker);
					// 마커를 클릭하면, 해당 정보를 태그에 추가 
					$("#place_name").val(place.place_name);
					$("#category_name").val(place.category_name);
					$("#road_address_name").val(place.road_address_name);
					$("#xLoc").val(place.y);	// place.x로 하면 y값이 들어가서 place.y로 해야 경도 가 맞음 
					$("#yLoc").val(place.x);	// 마찬가지로 place.x가 y값으로 들어가야 위도가 맞음
					
					/* $("#yLoc").val(); */
				});
			}
			// 검색 버튼 클릭 이벤트 처리 
			$("#searchBtn").on("click", function(e){
				// 검색 버튼 누르면, 기존 태그에 작성된 내용 삭제 
				$("#place_name").val("");
				$("#category_name").val("");
				$("#road_address_name").val("");
				// 검색 함수 호출 
				search();
			});
			
		});
		
		// 문자 클리어 버튼
		$('#deleteBtn').click(function(){
			$('#searchKeyword').val("");
		});
		</script>
		<form action="/travelMaker/land/landWritePro.tm" method="post">
			<table>
				<tr>
					<td>랜드마크 장소명</td>
					<td><input type="text" name="lName" id="place_name"></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" value="${sessionScope.memId}"></td>
				</tr>
				<tr>
					<td>랜드마크 유형</td>
					<td><input type="text" name="lType" id="category_name"></td>
				</tr>
				<tr>
					<td>xLoc</td>
					<td><input type="text" name="xLoc" id="xLoc"></td>
				</tr>
				<tr>
					<td>yLoc</td>
					<td><input type="text" name="yLoc" id="yLoc"></td>
				</tr>
				<tr>
					<td>랜드마크 주소</td>
					<td><input type="text" name="addr"  id="road_address_name"></td>
				</tr>
				<tr>
					<td>공개범위</td>
					<td>
						<input type="radio" name="lOpen" value="0">전체 공개
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