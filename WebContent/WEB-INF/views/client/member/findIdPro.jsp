<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	
	<div class="wrapAll">
		<h1>findIdPro</h1>
		<c:if test="${mem != null}">
			<h2>해당 아이디는 : ${comId}입니다</h2>
			<input type="button" value="로그인" onclick="window.location='/travelMaker/mem/loginForm.tm'"/>
			<input type="button" value="비밀번호 수정" onclick="window.location='/travelMaker/mem/myModiNick.tm'"/>
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
