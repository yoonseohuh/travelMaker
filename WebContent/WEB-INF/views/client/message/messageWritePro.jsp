<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		<!-- 자기자신일때도 처리..세션스코프? -->
		<c:if test="${result == 1}">
			<script>
				alert("전송완료");
				location.href = "message.tm";
			</script>
			
		</c:if>
	
		<c:if test="${result == 0}">
			<script>
				alert("아이디를 확인해주세요!");	
				history.go(-1);
			</script>
		</c:if>
		
		
		
	
		

		
		



		
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->