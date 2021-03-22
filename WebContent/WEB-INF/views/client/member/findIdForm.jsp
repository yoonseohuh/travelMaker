<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
	    <h1>아이디 찾기</h1>
		<form action="/travelMaker/mem/findIdPro.tm" method="post">
			<input type="text" name="email" placeholder="등록된 email"/>
			<input type="submit" value="아이디 확인" />
		</form>
		<jsp:include page="/WEB-INF/views/include/top.jsp" />
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
