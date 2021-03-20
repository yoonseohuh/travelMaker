<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<div id="adminMenuWrap">
	<p class="logo">Travel Maker</p>
	<ul class="menu">
        <li><a href="/travelMaker/admin/index.tm">홈</a></li>
        <li><a href="#">회원관리</a></li>
        <li><a href="#">그룹관리</a></li>
        <li><a href="/travelMaker/admin/qnaReport.tm">신고/문의관리</a></li>
        <li><a href="/travelMaker/admin/reason.tm">신고사유/문의유형</a></li>
        <li><a href="#">공지사항</a></li>
        <li><a href="#">포지션/레벨</a></li>
        <li><a href="/travelMaker/mem/index.tm">클라이언트 홈(임시)</a></li>        
    </ul>
</div>
<script>
	var nowUrl = window.location.pathname;
	console.log(nowUrl)
	if(nowUrl == "/travelMaker/admin/index.tm"){
		$('#adminMenuWrap').children('.menu').children('li').eq(0).addClass('on');
	}else if(nowUrl == "/travelMaker/admin/qnaReport.tm"){
		$('#adminMenuWrap').children('.menu').children('li').eq(3).addClass('on');
	}else if(nowUrl == "/travelMaker/admin/reason.tm" || "/travelMaker/admin/reasonInsert.tm"){
		$('#adminMenuWrap').children('.menu').children('li').eq(4).addClass('on');
	}
</script>