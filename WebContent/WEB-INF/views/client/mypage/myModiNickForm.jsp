<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		
		<h2>닉네임 수정</h2>
		<form action="/travelMaker/mem/myModiNickPro.tm" method="post">
			<input type="hidden" name="id" value="${mem.id}"/>
			<input type="text" name="crNick" value="현재닉네임: ${mem.nickname}" readonly/> <br/>
			<input type="text" name="nickname" placeholder="새로운 닉네임" /> <br/>
			<input type="submit" value="닉네임 수정" />
		</form>
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->