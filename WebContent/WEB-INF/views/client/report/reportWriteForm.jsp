<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>테스트url : http://localhost:8080/travelMaker/qr/reportWriteForm.tm?rType=0</h4>
	<h4>아직 rType값 직접 넘겨줘야 보임</h4>
	<h1>
		<c:if test="${rType == 0}">그룹 신고</c:if>
		<c:if test="${rType == 1}">랜드마크 신고</c:if>
		<c:if test="${rType == 2}">채팅 신고</c:if>
		<c:if test="${rType == 3}">쪽지 신고</c:if>
		<c:if test="${rType == 4}">코멘트 신고</c:if>
	</h1>
		
	<form action="reportWritePro.tm" method="get">
	  <select name="rNo" >
	    <option>선택</option>
	    <c:forEach var="res" items="${res}">
	    	<option value="${res.rNo}">${res.rNo} / ${res.rCont}</option>
	    </c:forEach>
	  </select>
	  <input type="submit" value="신고하기" />
	</form>
	
</body>
</html>