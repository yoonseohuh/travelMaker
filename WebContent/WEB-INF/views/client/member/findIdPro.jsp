<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
	
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	
	<div class="wrapAll">
		<h1>findIdPro</h1>
		<c:if test="${mem != null}">
			<h2>해당 아이디는 : ${comId}입니다</h2>
		</c:if>
	
		<c:if test="${mem == null}">
			<script>
				alert('등록된 email이 아닙니다')
				history.go(-1)
			</script>
		</c:if>
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->

</body>
</html>