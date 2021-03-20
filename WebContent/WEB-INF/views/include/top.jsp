<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<div id="top">
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