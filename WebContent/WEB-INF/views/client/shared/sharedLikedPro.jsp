<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="heartIcon"></c:if>
	<input type="image" id="heartIcon" src="../resources/images/heart-empty.png" width="14" alt="좋아요"/>
</body>
</html>