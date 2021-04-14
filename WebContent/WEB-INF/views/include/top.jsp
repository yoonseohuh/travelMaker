<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="divView" style="position:absolute; display:none; background-color:#ffffff; border:solid 2px #d0d0d0; width:150px; height:50px; padding: 5px 15px 0;"></div>

<div id="top">
	<div id="ham">
		<span class="bar1"></span>
		<span class="bar2"></span>
		<span class="bar3"></span>
	</div>
	<jsp:include page="/WEB-INF/views/include/clientMenu.jsp" />
	<div id="mCover"></div>
	<a href="/travelMaker/mem/index.tm"><p id="logo"></p></a>
	<div id="sign">
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
	var didScroll;
	var lastScrollTop = 0;
	var delta = 5;
	var navbarHeight = $('#top').outerHeight();
	
	$(window).scroll(function(event){
		didScroll = true;
	});
	
	setInterval(function() {
		if (didScroll) {
			hasScrolled();
			didScroll = false;
		}
	}, 250);
	
	function hasScrolled() {
		var st = $(this).scrollTop();
		if(Math.abs(lastScrollTop - st) <= delta)
			return;
		if(st > lastScrollTop && st > navbarHeight){
			$('#top').removeClass('nav-down').addClass('nav-up');
		}else {
			if(st + $(window).height() < $(document).height()) {
				$('#top').removeClass('nav-up').addClass('nav-down');
			}
		}
		
		lastScrollTop = st;
	}
	
	$("#ham").click(function(){
	    $(this).toggleClass("active");
	    $('#logo').fadeToggle();
	    $('#sign').fadeToggle();
	    $('#clientMenuWrap').fadeToggle();
	    $('#mCover').fadeToggle();
	});
	var nowUrl = window.location.pathname;
	if(nowUrl == "/travelMaker/mem/index.tm"){
		$('#clientMenuWrap').children('.menu').children('li').eq(0).addClass('on');
	}else if(nowUrl == "/travelMaker/my/myPage.tm"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');
	}else if(nowUrl == "/travelMaker/travel/makingWrite.tm"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');	
	}else if(nowUrl == "/travelMaker/cmt/comment.tm"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');
	}else if(nowUrl == "/travelMaker/qr/myQnaReportList.tm"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');	
	}else if(nowUrl == "/travelMaker/land/landWrite.tm"){
		$('#clientMenuWrap').children('.menu').children('li').eq(1).addClass('on');	
	}else if(nowUrl == "/travelMaker/travel/makingWrite.tm"){
		$('#clientMenuWrap').children('.menu').children('li').eq(2).addClass('on');
	}else if(nowUrl == "/travelMaker/travel/makingList.tm"){ 	
		$('#clientMenuWrap').children('.menu').children('li').eq(2).addClass('on');		
	}else if(nowUrl == "/travelMaker/travel/sharedList.tm"){
		$('#clientMenuWrap').children('.menu').children('li').eq(3).addClass('on');
	}else if(nowUrl == "/travelMaker/land/landmark.tm"){
		$('#clientMenuWrap').children('.menu').children('li').eq(4).addClass('on');
	}
</script>