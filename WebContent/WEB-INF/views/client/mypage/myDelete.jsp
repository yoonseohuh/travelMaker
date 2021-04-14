<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		
		<c:if test="${sessionScope.memId==null}">
			<script>
				alert("로그인 후에 접근 가능합니다");
				location.href='/travelMaker/mem/loginForm.tm';
			</script>
		</c:if>
	
		<h1>회원 탈퇴</h1>
		<form action="/travelMaker/mem/myDeletePro.tm" method="post">
			<input type="hidden" name="id" value="${id}"/>
			<table>
				<tr>
					<td>아이디</td>
					<td>${id}</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw"/></td>
				</tr>
				<tr>
					<td>
						<input type="button" value="취소" onclick="history.go(-1)"/>
						<input type="submit" value="탈퇴"/>
					</td>
				</tr>
			</table>
		</form>	
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
