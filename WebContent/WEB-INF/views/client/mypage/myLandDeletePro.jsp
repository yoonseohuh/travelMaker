<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		<h1>내가 작성한 랜드마크 삭제 pro</h1> 
		<c:if test="${result==0}">
			<script>
				alert("비밀번호를 확인하십시요");
				history.go(-1);
			</script>
		</c:if>
		<c:if test="${result==1}">
			<script>
				alert("삭제 되었습니다.");
			</script>
		</c:if>
		
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
