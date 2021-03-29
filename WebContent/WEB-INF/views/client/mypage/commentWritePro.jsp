<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		<c:if test="${result == 1}">
			<script>
				alert("코멘트 작성 완료");
				location.href = "comment.tm";
			</script>
			
		</c:if>
		
		<!-- 여행이나 동행자를 선택안했을때.. -->
		<c:if test="${result == 2}">
			<script>
				alert("여행 또는 동행자를 선택해주세요!");
				history.go(-1);
			</script>
			
		</c:if>

	
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->