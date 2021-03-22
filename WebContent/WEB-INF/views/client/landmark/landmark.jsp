<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		
		<a href="/travelMaker/land/landWrite.tm"><button>랜드마크 작성</button></a>
		
	
		
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
			// 지도 생성하기 
			var map = new kakao.maps.Map(container, options);
			
			
			
		</script>
		
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
   
</body>
</html>