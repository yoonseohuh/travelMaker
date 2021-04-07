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
				success : function(landList){ //요청 성공 콜백
					//받아온 리스트를 카카오 지도에 맞게 데이터 조합다시하고 
					for (var i = 0; i < landList.length; i ++) {
						positions.push(
							{title: landList[i].lName,
							latlng: new kakao.maps.LatLng(landList[i].xLoc,landList[i].yLoc)}
						);
					}
					markers();	//지도 뿌려라!
				}
			});
			function markers() {
				// *** 지도 생성 *** 
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
					mapOption = { 
						center: new kakao.maps.LatLng(37.56683861779011, 126.97864772708567), // 지도의 중심좌표
						level: 11 // 지도의 확대 레벨
					};
				
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				// *** 마커 생성 *** 
				// 마커 이미지
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
				
				for (var i=0; i<positions.length; i++) {
					// 마커 이미지의 이미지 크기
					var imageSize = new kakao.maps.Size(24, 35);
					// 마커 이미지 생성   
					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						map: map, // 마커를 표시할 지도
						position: positions[i].latlng, // 마커를 표시할 위치
						title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됨
						image: markerImage, // 마커 이미지 
						clickable: true
					});
					
					console.log(positions[i].latlng);
					
					// 마커 클릭 시 정보를 뿌려주기 위함
					kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {
						//console.log(mouseEvent); undefined
						//var latlng = mouseEvent.latLag;
						//console.log("경도:"+latlng.getLng());
						//console.log(positions);
						console.log("--marker--");
						console.log(marker);
						//console.log(marker.position); undefined
						console.log("--this--");
						console.log(this);
						//console.log(this.n.La); 나오는데 찾는 값 아님
						$('.title').val(this.Fb);
						
						event.preventDefault();
						var lName = this.Fb;
						var data = { "lName": lName };
						$.ajax({
							url: "/travelMaker/land/landmarkCont.tm",
							type: "POST",
							dataType: "json",
							contentType: "application/json",
							data: JSON.stringify(data),
							success: function(res){
								console.log(res);
								$('.content1').html("<h1>"+res.lName+"</h1><h2>"+res.writer+"님의 랜드마크</h2></br></br>");
								$('.content2').html("<h3>"+res.lType+"&nbsp;"+res.addr+"</h3></br></br>");
								$('.content3').html("<h3>"+res.lCont+"</h3>");
							}
						});
						
					});
				/*	var iwContent = '<div style="padding:5px;">Hello World!</div>';
					var	iwRemoveable = true;
					
					// 인포 윈도우 생성
					var infowindow = new kakao.maps.infoWindow({
						content : iwContent,
						removable : iwRemoveable
					});
					// 마커에 클릭이벤트를 등록
					kakao.maps.event.addListener(marker, 'click', function() {
						// 마커 위에 인포윈도우를 표시
						infowindow.open(map, marker);
					});		*/
				}//for
			}//markers
		});//ready
		
		</script>
	<a href="/travelMaker/land/landWrite.tm"><button>랜드마크 작성</button></a>
	
	<div class="content1"></div>
	<div class="content2"></div>
	<div class="content3"></div>
	
	
</div>
<!-- //wrapAll end -->

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->