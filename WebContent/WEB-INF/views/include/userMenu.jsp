<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul id="myMenuWrap">
	
	<li><a href="/travelMaker/mem/userPage.tm?userId=<c:out value="${param.userId}"/>">유저홈</a></li>
	<li><a href="/travelMaker/mem/userHistory.tm?userId=<c:out value="${param.userId}"/>">여행이력</a></li>
	<li><a href="/travelMaker/mem/userLand.tm?userId=<c:out value="${param.userId}"/>">작성한 랜드마크</a></li>
</ul>
<script>
	if(nowUrl == "/travelMaker/mem/userPage.tm"){
		$('#myMenuWrap').children('li').eq(0).addClass('on');
	}else if(nowUrl == "/travelMaker/mem/userHistory.tm"){
		$('#myMenuWrap').children('li').eq(1).addClass('on');
	}else if(nowUrl == "/travelMaker/mem/userHistoryCont.tm"){
		$('#myMenuWrap').children('li').eq(1).addClass('on');
	}else if(nowUrl == "/travelMaker/mem/userLand.tm"){
		$('#myMenuWrap').children('li').eq(2).addClass('on');
	}
</script>