<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
	    <h1>비밀번호 재설정</h1>
		<form action="/travelMaker/mem/modiPwForm.tm" method="post">
			<input type="text" name="id" placeholder="아이디"/>	<br />
			<input type="text" name="email" placeholder="등록된 이메일"/>	<br />
			<input type="submit" value="비밀번호 재설정" />
		</form>	 
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
