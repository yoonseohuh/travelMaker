<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
		<c:if test="${sessionScope.memId != null}">
			<script>
				alert('로그아웃 후 사용해주세요')
				history.go(-1)
			</script>
		</c:if>
	    <h1>아이디 찾기</h1>
		<form action="/travelMaker/mem/findIdPro.tm" method="post">
			<input type="text" name="email" placeholder="등록된 email"/>
			<input type="submit" value="아이디 확인" />
		</form>
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
