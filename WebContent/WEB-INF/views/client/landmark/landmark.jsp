<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<jsp:include page="/WEB-INF/views/include/top.jsp" />
<!-- //top end -->

<div class="wrapAll client">

	<c:if test="${sessionScope.memId==null}">
		<script>
			alert("로그인 후에 이용 가능합니다");
			location.href='/travelMaker/mem/index.tm';
		</script>
	</c:if>
	
	<!-- 지도 -->
	<div id="map" style="width: 1000px; height: 400px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dbb3c6ebdae00379cc812a1240d45848&libraries=services,clusterer,drawing"></script>
	<script>
		$(document).ready(function(){
			//첫 페이지에서 좋아요 버튼 숨겨놓기
			$('.like').hide();
			
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
								$('.like').show();
								$('#lNo').val(res.lNo);
								$('.content1').html("<br/><h1>"+res.lName+"</h1><br/><h2>"+res.writer+"님의 랜드마크</h2></br></br>");
								$('.content2').html("<h3>"+res.lType+"&nbsp;&nbsp;|&nbsp;&nbsp;"+res.addr+"</h3></br></br>");
								$('.content3').html("<h3>"+res.lCont+"</h3>");
							}
						});
						
					});//addListener
				}//for
			}//markers
			
			$('.likeBtn').submit(function(event){
				event.preventDefault();
				var data = {};
				$.each($(this).serializeArray(), function(index, i){
					data[i.name] = i.value;
				});
				$.ajax({
					url: "/travelMaker/land/landmarkLiked.tm",
					type: "POST",
					dataType: "json",
					cache: false,
					contentType: "application/json",
					data: JSON.stringify(data),
					success: function(res){
						$('.likeBtn').html("좋아요 한 랜드마크입니다&nbsp;"
								+"<img src=\"../resources/images/heart-colored.png\" width=\"14\"/>"
								+"<br/><input type=\"button\" onclick=\"window.location='/travelMaker/my/myLand.tm'\" value=\"나의 랜드마크\"/>"
						);
					}
				});
			});//likeBtn
			
			/* 무시됨
			var arr = new Array();
			<c:forEach var="list" items="${lList}">
				arr.push("${lList}");
			</c:forEach>
			for(var i=0 ; i<arr.length ; i++){
				alert(arr[i]);
			}
			*/
			/* 주소 값 한글자씩 나오고 난리...
			var arr = new Array();
			arr = "${lNoArr}";
			for(var i=0; i<arr.length ; i++){
				alert(arr[i]);
			}
			
			var lNoArr = "${lNoArr}";	//[I@151cf797
			var lLand = new Array();
			lLand = "${lLand}";		//[travelMaker.model.dto.LandmarkBoardDTO@294351b9, travelMaker.model.dto.LandmarkBoardDTO@2af9c3a7, travelMaker.model.dto.LandmarkBoardDTO@4dfcbdc0, travelMaker.model.dto.LandmarkBoardDTO@3f2e4ba7]
			
			for(var i=0 ; i<lLand.length() ; i++){
				alert(i);
			}
			*/
		});//ready
		
	</script>
		
	<a href="/travelMaker/land/landWrite.tm"><button>랜드마크 작성</button></a>
	
	<div class="content1"></div>
	<div class="content2"></div>
	<div class="content3"></div>
	
	
	<!-- 클릭한 랜드마크가 이미 좋아요한 랜드마크이면 좋아요 버튼 안보이게
	<c:forEach var="land" items="${lLand}">
		<c:if test="${land.lNo==lNo}">
			웅
		</c:if>
		<c:if test="${land.lNo!=lNo}">
			아니
		</c:if>
	</c:forEach>
	-->
	
	<div class="like">
		<form class="likeBtn">
			<input type="hidden" id="lNo" name="lNo"/>
			<input type="hidden" name="id" value="${sessionScope.memId}"/>
			<input type="image" id="heartIcon" src="../resources/images/heart-empty.png" width="14" alt="좋아요"/>
		</form>
	</div>
</div>
<!-- //wrapAll end -->

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->