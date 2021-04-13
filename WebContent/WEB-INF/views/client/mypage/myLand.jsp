<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/views/include/header.jsp" />

<jsp:include page="/WEB-INF/views/include/top.jsp" />
<!-- //top end -->

<div class="wrapAll client">
	<c:if test="${sessionScope.memId==null}">
		<script>
            alert("로그인 후에 이용 가능합니다");
            history.go(-1);
		</script>
	</c:if>
	
	
	<jsp:include page="/WEB-INF/views/include/myMenu.jsp" />
	<!-- myMenu end -->
	
	<!-- 지도 -->
	<div id="map" style="width: 1000px; height: 400px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dbb3c6ebdae00379cc812a1240d45848&libraries=services,clusterer,drawing"></script>
	
	<script>
		function removeCheck(){
			if(confirm("정말 진심으로 삭제하시겠습니까?")==true){
				document.removefrm.submit();
			}else{
				return false;
			}
		}
		function cancelCheck(){
			if(confirm("정말 진심으로 취소하시겠습니까?")==true){
				document.cancelfrm.submit();
			}else{
				return false;
			}
		}
	</script>
	
	
	<script>
		$(document).ready(function(){
			
		//	다중 삭제
			$("input:checkbox[name=delLnum]").on("click",function(){
				var arr = new Array();
				$("input:checkbox[name=delLnum]:checked").each(function(){
					var checkVal = $(this).val();
					arr.push(checkVal);
				});
				$("#delLNo").val(arr);
			});
		
		//	다중 좋아요 취소
			$("input:checkbox[name=cnlLnum]").on("click",function(){
				var arr = new Array();
				$("input:checkbox[name=cnlLnum]:checked").each(function(){
					var checkVal = $(this).val();
					arr.push(checkVal);
				});
				$("#cnlLNo").val(arr);
			});
		
		//	*** 좋아요한 랜드마크 ***
			var positions = [];
			$.ajax({
				type: "POST",
				url: "/travelMaker/land/myLikedLand.tm",
				dataType: "json",
				success : function(landList){ //요청 성공 콜백
					//받아온 리스트를 카카오 지도에 맞게 데이터 조합다시하고 
					for (var i = 0; i < landList.length; i ++) {
						positions.push(
							{title: landList[i].lName,
							latlng: new kakao.maps.LatLng(landList[i].xLoc,landList[i].yLoc)}
						);
					}
					likedMarkers();	//지도 뿌려라!
				}
			});
			
			// *** 지도 생성 *** 
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
				mapOption = { 
					center: new kakao.maps.LatLng(37.56683861779011, 126.97864772708567), // 지도의 중심좌표
					level: 11 // 지도의 확대 레벨
				};
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			function likedMarkers() {				
				// *** 마커 생성 *** 
				// 마커 이미지
				var imageSrc = "../resources/images/landLikedImg.png"; 
				
				for (var i=0; i<positions.length; i++) {
					// 마커 이미지의 이미지 크기
					var imageSize = new kakao.maps.Size(40, 40);
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
					
					// 마커 클릭 시 정보를 뿌려주기 위함
					kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {
						console.log(this);
						
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
			
		//	*** 작성한 랜드마크 ***
			var positions2 = [];
			$.ajax({
				type: "POST",
				url: "/travelMaker/land/myWrittenLand.tm",
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
			});
			function WrittenMarkers() {
				// *** 마커 생성 ***
				// 마커 이미지
				var imageSrc = "../resources/images/landWrittenImg.png"; 
				
				for (var i=0; i<positions2.length; i++) {
					// 마커 이미지의 이미지 크기
					var imageSize = new kakao.maps.Size(40, 40);
					// 마커 이미지 생성   
					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						map: map, // 마커를 표시할 지도
						position: positions2[i].latlng, // 마커를 표시할 위치
						title: positions2[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됨
						image: markerImage, // 마커 이미지 
						clickable: true
					});
					
					// 마커 클릭 시 정보를 뿌려주기 위함
					kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {
						console.log(this);
						
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
			
			
		});//ready
	</script>
	
	
	<h1>MyLand 페이지</h1>
	<a href="/travelMaker/land/landWrite.tm"><button>생성</button></a>
	
	<!-- 마커 클릭 시 보일 정보 -->
	<div class="content1"></div>
	<div class="content2"></div>
	<div class="content3"></div>
	<h2>-----------------------</h2>
	<h2>랜드마크 관리</h2>
	<c:if test="${fn:length(lLand)==0}">
		아직 좋아요한 랜드마크가 없습니다.
	</c:if>
	<c:if test="${fn:length(lLand)>0}">
		<h3>좋아요 한 랜드마크 | ${fn:length(lLand)}개</h3>
		<form action="/travelMaker/land/likedLandCancel.tm" name="cancelfrm" method="post" onsubmit="return cancelCheck()">
			<input type="submit" value="좋아요 취소"/>
			<input type="hidden" name="lNo" id="cnlLNo"/>
			<c:forEach var="land" items="${lLand}">
				<ul>
					<li>
						<input type="checkbox" name="cnlLnum" value="${land.lNo}"/>
					</li>
					<li>${land.lName}</li>
					<li>${land.lType}</li>
					<li>${land.addr}</li>
					<li>작성자:${land.writer}</li>
				</ul>
			</c:forEach>
		</form>
	</c:if>
	
	<c:if test="${fn:length(wLand)==0}">
		아직 작성한 랜드마크가 없습니다.	
	</c:if>
	<c:if test="${fn:length(wLand)>0}">
		<h3>작성한 랜드마크 | ${fn:length(wLand)}개</h3>
		<form action="/travelMaker/land/myLandDelete.tm" name="removefrm" method="post" onsubmit="return removeCheck()">
			<input type="submit" value="삭제"/>
			<input type="hidden" name="lNo" id="delLNo"/>
			<c:forEach var="land" items="${wLand}">
				<ul>
					<li>
						<input type="checkbox" name="delLnum" value="${land.lNo}"/>
					</li>
					<li><b>${land.lName}</b></li>
					<li>${land.lType}</li>
					<li>${land.addr}</li>
				</ul>
			</c:forEach>
		</form>
	</c:if>
	
</div>
<!-- //wrapAll end -->

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->