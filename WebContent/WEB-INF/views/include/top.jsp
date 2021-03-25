<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="top">
	<div class="ham">
		<span class="bar1"></span>
		<span class="bar2"></span>
		<span class="bar3"></span>
	</div>
	<jsp:include page="/WEB-INF/views/include/clientMenu.jsp" />
	<div class="mCover"></div>
	<a href="/travelMaker/mem/index.tm"><p class="logo">Travel Maker</p></a>
	<div class="sign">
		<c:if test="${sessionScope.memId == null}">
			<a href="/travelMaker/mem/signupForm.tm">회원가입</a>
			<a href="/travelMaker/mem/loginForm.tm">로그인</a>
		</c:if>
		<c:if test="${sessionScope.memId != null}">
			<a href="/travelMaker/mem/logout.tm">로그아웃</a>
		</c:if>
	</div>
</div>
<script>
	$(".ham").click(function(){
	    $(this).toggleClass("active");
	    $(this).nextAll().fadeToggle();
	});
	var nowUrl = window.location.pathname;
	if(nowUrl == "/travelMaker/mem/index.tm"){
		$('#clientMenuWrap').children('.menu').children('li').eq(0).addClass('on');
	}else if(nowUrl == "/travelMaker/my/myPage.tm" || "/travelMaker/cmt/comment.tm" || "/travelMaker/qr/myQnaReportList.tm"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');
	}else if(nowUrl == "/travelMaker/travel/makingList.tm" || "/travelMaker/travel/makingWrite.tm" ){ 	
		$('#clientMenuWrap').children('.menu').children('li').eq(2).addClass('on');
	}else if(nowUrl == "/travelMaker/travel/sharedList.tm"){
		$('#clientMenuWrap').children('.menu').children('li').eq(3).addClass('on');
	}else if(nowUrl == "/travelMaker/land/landmark.tm" || "/travelMaker/land/landWrite.tm"){
		$('#clientMenuWrap').children('.menu').children('li').eq(4).addClass('on');
	}else if(nowUrl == "/travelMaker/travel/makingWrite.tm"){
		$('#clientMenuWrap').children('.menu').children('li').eq(2).addClass('on');
	}	
</script>