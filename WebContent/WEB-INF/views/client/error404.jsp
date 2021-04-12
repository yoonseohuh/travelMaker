<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	<div class="wrapAll client">
	
		<h1>404는 저희의 잘못이 아닙니다...</h1>
		<br/>
		<h1>존재하지 않는 주소입니다.</h1>
		<br/>
		<h1>다시 확인해주세요.</h1>
		<button class="comBtn" onclick="window.location='/travelMaker/mem/index.tm'">메인으로</button>
		<button class="comBtn" onclick="history.back()">뒤로가기</button>
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->