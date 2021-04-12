<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	<div class="wrapAll client">
		
		<img src="/travelMaker/resources/images/error500.png"/>
		<h1>잘못된 요청입니다.</h1>
		<br/>
		<h1>저희가 잘못했거나요...</h1>
		<button class="comBtn" onclick="window.location='/travelMaker/mem/index.tm'">못 본 척 메인으로</button>
		<button class="comBtn" onclick="history.back()">뒤로가기</button>
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->