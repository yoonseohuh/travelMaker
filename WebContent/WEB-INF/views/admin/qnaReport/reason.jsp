<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>reason</h1>
	<form action="reasonInsert.tm" method="get">
		<select name="rType" >
			<option>선택</option>
			<option value="0">그룹신고</option>
			<option value="1">랜마신고</option>
			<option value="2">채팅신고</option>
			<option value="3">쪽지신고</option>
			<option value="4">코멘트신고</option>
		</select>
		<input type="text" name="rCont" placeholder="사유입력" />
		<input type="submit" value="등록" />
	</form>
</body>
</html>