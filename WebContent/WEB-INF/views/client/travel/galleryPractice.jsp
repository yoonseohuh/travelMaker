<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	<div class="wrapAll">
		<script>
		
		</script>
		
		<c:forEach var="list" items="${list}">
			<img src="/travelMaker/save/${list.pRoot}" width="100"/>
			<!-- 좋아요 ajax로 처리 아직 안함 -->
		</c:forEach>
		
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->