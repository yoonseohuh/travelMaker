<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<ul id="myMenuWrap">
	<li><a href="/travelMaker/mem/userPage.tm">유저홈</a></li>
	<li><a href="/travelMaker/mem/userHistory.tm">여행이력</a></li>
	<li><a href="/travelMaker/mem/userLand.tm">작성한 랜드마크</a></li>
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