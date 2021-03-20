<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>clientIndex</h1>
<h2>세션확인 :${sessionScope.memId}</h2>  
<h2>쿠키확인 :${cooMap.autoId}</h2>  
<h2>check :${check}</h2>  
<input type="button" value="로그인" onclick="window.location='loginForm.tm'"/> 
<input type="button" value="로그아웃" onclick="window.location='logout.tm'"/>
</body>
</html>