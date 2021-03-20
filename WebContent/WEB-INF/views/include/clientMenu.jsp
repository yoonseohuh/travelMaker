<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="clientMenuWrap">
	<div class="btnRightClose"></div>
	<ul class="menu">
        <li><a href="/travelMaker/mem/index.tm">홈</a></li>
        <li><a href="/travelMaker/my/myPage.tm">내정보</a></li>
        <li><a href="">여행떠나기</a></li>
        <li><a href="">여행공유</a></li>
        <li><a href="">랜드마크</a></li>
        <li><a href="">랭크/포지션 안내</a></li>
        <li><a href="">쪽지함</a></li>
        <li><a href="">공지사항</a></li>
        <li><a href="">관리자 페이지</a></li>
    </ul>
</div>
<script>
	var nowUrl = window.location.pathname;
	if(nowUrl == "/travelMaker/mem/index.tm"){
		$('#clientMenuWrap').children('.menu').children('li').eq(0).addClass('on');
	}else if(nowUrl == "/travelMaker/my/myPage.tm" || "/travelMaker/cmt/comment.tm" || "/travelMaker/qr/myQnaReportList.tm"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');
	}
</script>
<div class="mCover"></div>