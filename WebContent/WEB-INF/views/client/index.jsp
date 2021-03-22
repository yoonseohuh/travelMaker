<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
    <h2>세션확인 :${sessionScope.memId}</h2>  
    <h2>쿠키확인 :${cooMap.autoId}</h2>  
    <h2>check :${check}</h2>  
    <input type="button" value="로그인" onclick="window.location='loginForm.tm'"/> 
    <input type="button" value="로그아웃" onclick="window.location='logout.tm'"/>
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
   
</body>
</html>