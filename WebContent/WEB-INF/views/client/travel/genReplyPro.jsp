<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<script>
	var curr_url = document.URL;
	var new_curr_url = new URL(curr_url);

	//url 내 from이라는 파라미터의 값을 param에 넣어줌
	var param = new_curr_url.searchParams.get("from"); 

	if( param == "groupspace" ){ 
		//param값이 groupspace일 경우 실행
		alert('등록 되었습니다.');
		document.location.href="/travelMaker/travel/groupSpace.tm?gNo=${gNo}";
	}else if( param == "myHistory"){
		alert('등록 되었습니다.');
		document.location.href="/travelMaker/my/myHistoryCont.tm?gNo=${gNo}";
	}
		
	</script>
<body>

</body>
</html>