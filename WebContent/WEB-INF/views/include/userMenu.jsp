<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="myMenu">
<ul class="menu">
	<li><a href="/travelMaker/mem/userHistory.tm?userId=<c:out value="${param.userId}"/>">여행이력</a></li>
	<li><a href="/travelMaker/mem/userComment.tm?userId=<c:out value="${param.userId}"/>">코멘트</a></li>
	<li><a href="/travelMaker/mem/userLand.tm?userId=<c:out value="${param.userId}"/>">작성한 랜드마크</a></li>
</ul>
</div>
<script>
	if(nowUrl == "/travelMaker/mem/userHistory.tm"){
		$('#myMenu').children('.menu').children('li').eq(0).addClass('active');
	}else if(nowUrl == "/travelMaker/mem/userHistoryCont.tm"){
		$('#myMenu').children('.menu').children('li').eq(0).addClass('active');
	}else if(nowUrl == "/travelMaker/mem/userComment.tm"){
		$('#myMenu').children('.menu').children('li').eq(1).addClass('active');
	}else if(nowUrl == "/travelMaker/mem/userLand.tm"){
		$('#myMenu').children('.menu').children('li').eq(2).addClass('active');
	}
</script>
