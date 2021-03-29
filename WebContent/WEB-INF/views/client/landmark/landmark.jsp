<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<jsp:include page="/WEB-INF/views/include/top.jsp" />
<!-- //top end -->

<div class="wrapAll">



	<!-- 지도 -->
	<div id="map" style="width: 1000px; height: 400px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dbb3c6ebdae00379cc812a1240d45848&libraries=services,clusterer,drawing"></script>
	<script>
		$(document).ready(function(){
		// *** ajax로 랜드마크 DB에서 가져오기 *** 
		var positions = [];
		$.ajax({
			type: "POST",
			url: "/travelMaker/land/landmarkList.tm",
			dataType: "json",
			success : function(landList){ // 요청 성공 콜백
				// 받아온 리스트를 카카오 지도에 맞게 데이터 조합다시하고 
				for (var i = 0; i < landList.length; i ++) {
					positions.push(
				        {title: landList[i].lName,
				        latlng: new kakao.maps.LatLng(landList[i].xLoc,landList[i].yLoc)}
				    );
				} 
				//test();
				// 지도 뿌려라! 
				markers();
			}
		});
		function test() {
			//console.log(lList);
			console.log(positions);
		}
		function markers() {
			// *** 지도 생성 *** 
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			    mapOption = { 
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 13 // 지도의 확대 레벨
			    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			// *** 마커 생성 *** 
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			    
			for (var i = 0; i < positions.length; i ++) {
			    
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			   
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커를 표시할 위치
			        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage, // 마커 이미지 
			        clickable: true
			    });
			  
			}// for
			
			
			 // 마커에 클릭이벤트를 등록합니다
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
				
			
		}//markers
		
		
		});//ready
		
		</script>
	<a href="/travelMaker/land/landWrite.tm"><button>랜드마크 작성</button></a>

	<!-- 
 		<c:forEach var="land" items="${land}">
			<h4>writer : ${land.writer}</h4>
			<h4>lName : ${land.lName}</h4>
			<h4>addr : ${land.addr}</h4>
			<h4></h4>
		</c:forEach>
		</form> -->
</div>
<!-- //wrapAll end -->

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->