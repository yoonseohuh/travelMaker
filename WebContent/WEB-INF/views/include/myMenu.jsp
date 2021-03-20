<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<ul id="myMenuWrap">
	<li><a href="/travelMaker/my/myPage.tm">마이홈</a></li>
	<li><a href="#">여행이력</a></li>
	<li><a href="/travelMaker/cmt/comment.tm">코멘트 관리</a></li>
	<li><a href="#">나의 랜드마크</a></li>
	<li><a href="#">내정보 관리</a></li>
	<li><a href="/travelMaker/qr/myQnaReportList.tm">문의 및 신고</a></li>
</ul>
<script>
	if(nowUrl == "/travelMaker/my/myPage.tm"){
		$('#myMenuWrap').children('li').eq(0).addClass('on');
	}else if(nowUrl == "/travelMaker/cmt/comment.tm"){
		$('#myMenuWrap').children('li').eq(2).addClass('on');
	}else if(nowUrl == "/travelMaker/qr/myQnaReportList.tm"){
		$('#myMenuWrap').children('li').eq(5).addClass('on');
	}
</script>