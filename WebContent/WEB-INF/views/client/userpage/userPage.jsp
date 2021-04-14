<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
		
		<jsp:include page="/WEB-INF/views/include/userMenu.jsp" />
		<!-- myMenu end -->
		
		<c:if test="${sessionScope.memId==null}">
			<script>
				alert("로그인 후에 접근 가능합니다");
				location.href='/travelMaker/mem/loginForm.tm';
			</script>
		</c:if>
		
		<h1>하하하 ${userId}님 페이지임</h1>
		
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
   
</body>
</html>