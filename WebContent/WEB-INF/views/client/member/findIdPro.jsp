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
<h1>findIdPro</h1>

<h2>mem 확인: ${mem.id}</h2>
	<c:if test="${mem != null}">
		<h2>해당 아이디는 : ${mem.id }입니다</h2>
	</c:if>

	<c:if test="${mem == null}">
		<script>
			alert('등록된 email이 아닙니다')
			history.go(-1)
		</script>
	</c:if>


</body>
</html>