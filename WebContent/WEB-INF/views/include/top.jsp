<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="top">
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
	<div class="btnRightOpen"></div>
</div>
<jsp:include page="/WEB-INF/views/include/clientMenu.jsp" />
<script>
	//rightMenu toggle
	$('.btnRightOpen').click(function(){
		$('.mCover').fadeIn();
		$('#clientMenuWrap').fadeIn();
		$('body').css('overflow','hidden')
	});
	$('.btnRightClose').click(function(){
		$('.mCover').fadeOut();
		$('#clientMenuWrap').fadeOut();
		$('body').css('overflow','auto')
	});
	$('.mCover').click(function(){
		$('.mCover').fadeOut();
		$('#clientMenuWrap').fadeOut();
		$('body').css('overflow','auto')
	});
</script>