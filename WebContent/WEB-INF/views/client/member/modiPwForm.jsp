<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>result = ${result}</h2>
	<h1>비밀번호 재설정</h1>
	<c:if test="${result==1}">
		<form action="/travelMaker/mem/modiPwPro.tm" method="post">
			<input type="hidden" name="id" value="${mem.id}"/>
			<input type="password" name="pw" placeholder="새 비밀번호" /><br/>
			<input type="password" name="pwch" placeholder="새 비밀번호 확인" /><br/>
			<input type="submit" value="비밀번호 수정"/>
			<input type="button" value="뒤로가기" onclick="history.go(-1)"/>
		</form>
	</c:if>
	<c:if test="${result!=1}">
		<script>
			alert('아이디 혹은 비밀번호가 틀렸습니다')
			history.go(-1)
		</script>
	</c:if>
</body>
</html>