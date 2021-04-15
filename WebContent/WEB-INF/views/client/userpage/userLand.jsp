<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
	
		<div class="myPageWrap myPageWrap3">
		
			<c:import url="/WEB-INF/views/include/userMenu.jsp">
				<c:param name="userId" value="${userId}"></c:param>
			</c:import>
			<h2 class="pageTit">${userId}님의 랜드마크</h2>
			
			<!-- 지도 -->
			<div id="map" style="width: 1000px; height: 400px;"></div>
		
			<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dbb3c6ebdae00379cc812a1240d45848&libraries=services,clusterer,drawing"></script>
			
			<script>
			$(document).ready(function(){
			//	*** 지도 생성 *** 
				var mapContainer = document.getElementById('map'),  
					mapOption = {
						center: new kakao.maps.LatLng(37.56683861779011, 126.97864772708567),
						level: 11
					};
				var map = new kakao.maps.Map(mapContainer, mapOption);
			//	*** 작성한 랜드마크 ***
				var userId = "${userId}";
				
				var positions2 = [];
				$.ajax({
					type: "POST",
					url: "/travelMaker/land/userWrittenLand.tm?userId=${userId}",
					
					dataType: "json",
					success : function(landList){
						for (var i = 0; i < landList.length; i ++) {
							positions2.push(
								{title: landList[i].lName,
								latlng: new kakao.maps.LatLng(landList[i].xLoc,landList[i].yLoc)}
							);
						}
						WrittenMarkers();
					}
				});//ajax end
				
				function WrittenMarkers() {
					// *** 마커 생성 ***
					// 마커 이미지
					var imageSrc = "../resources/images/landWrittenImg.png"; 
					
					for (var i=0; i<positions2.length; i++) {
						var imageSize = new kakao.maps.Size(40, 40);
						var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
						var marker = new kakao.maps.Marker({
							map: map, 
							position: positions2[i].latlng, 
							title: positions2[i].title, 
							image: markerImage, 
							clickable: true
						});
						// 마커 클릭 시 정보를 뿌려주기 위함
						kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {
							
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
									$('#lNo').val(res.lNo);
									$('.content1').html("<br/><h1>"+res.lName+"</h1><br/><h2>"+res.writer+"님의 랜드마크</h2></br></br>");
									$('.content2').html("<h3>"+res.lType+"&nbsp;&nbsp;|&nbsp;&nbsp;"+res.addr+"</h3></br></br>");
									$('.content3').html("<h3>"+res.lCont+"</h3>");
								}
							});
							
						});//addListener
					}//for
				}//markers
				
			});//ready end
			</script>
			
			<!-- 마커 클릭 시 보일 정보 -->
			<div class="content1"></div>
			<div class="content2"></div>
			<div class="content3"></div>
		</div>
		
		
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
   
</body>
</html>