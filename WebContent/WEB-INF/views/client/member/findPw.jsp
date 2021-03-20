<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<h1>비밀번호 찾기</h1>
	<form action="/travelMaker/findPwPro.tm">
		<input type="text" name="id" placeholder="아이디"/>	<br />
		<input type="text" name="email" placeholder="등록된 이메일"/>	<br />
		<input type="submit" value="비밀번호 찾기" />
	</form>	
</body>
</html>