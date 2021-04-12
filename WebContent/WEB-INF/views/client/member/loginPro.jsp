<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
		<c:if test="${result != 1}">
			<script>
				alert("아이디 혹은 비밀 번호 정보가 일치 하지 않습니다!!")
				history.go(-1)
			</script>
		</c:if>
		<c:if test="${result == 1}">
			<script>
			document.location.href="/travelMaker/mem/index.tm";
			</script>	
		</c:if>		
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->

