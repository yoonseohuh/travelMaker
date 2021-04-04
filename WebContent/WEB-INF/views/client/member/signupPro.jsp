<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
		<c:if test="${sessionScope.memId != null}">
			<script>
				alert('이용할 수 없는 페이지 입니다.')
				history.go(-1)
			</script>
		</c:if>
		<script>
			alert('회원가입이 완료되었습니다');
			document.location.href="/travelMaker/mem/index.tm";
		</script>
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->