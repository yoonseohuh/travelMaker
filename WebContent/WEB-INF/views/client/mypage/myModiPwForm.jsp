<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
		<h1>비밀번호 재설정</h1>
			<form action="/travelMaker/mem/myModiPwPro.tm" method="post">
				<input type="hidden" name="id" value="${mem.id}"/>
				<input type="password" name="crPw" placeholder="현재 비밀번호 확인" /><br/>
				<input type="password" name="pw" placeholder="새 비밀번호" /><br/>
				<input type="password" name="pwch" placeholder="새 비밀번호 확인" /><br/>
				<input type="submit" value="비밀번호 수정"/>
				<input type="button" value="뒤로가기" onclick="history.go(-1)"/>
			</form>
			mem.id=${mem.id}
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
