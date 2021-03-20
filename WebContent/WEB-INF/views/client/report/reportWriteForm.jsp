<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>reportWriteForm</h1>
	<form action="reportWritePro.tm" method="get">
	  <select name="rNo" >
	    <option>선택</option>
	    <option value="1">사유1</option>
	    <option value="2">사유2</option>
	    <option value="3">사유3</option>
	    <option value="4">사유4</option>
	    <option value="5">사유5</option>
	  </select>
	  <input type="submit" value="신고하기" />
	</form>
</body>
</html>