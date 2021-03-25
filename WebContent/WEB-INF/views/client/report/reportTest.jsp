<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
	
		<h1>채팅 신고하기 테스트 페이지</h1>
		<h4>닉네임으로 유저 표시, 신고할 땐 아이디 넘겨줌</h4>
		<input type="button" class="clickMenu" idx="zzaaqq543" value="지존전사1"/>
		<input type="button" class="clickMenu" idx="hihi444" value="z초보법사z"/>
		<input type="button" class="clickMenu" idx="babo123" value="바보"/>
	
		<div id="divView" style="position:absolute; display:none; background-color:#ffffff; border:solid 2px #d0d0d0; width:150px; height:50px; padding: 5px 15px 0;"></div>
	
		<script>
		$('.clickMenu').click(function(e) {
			var divTop = e.clientY - 40; //상단 좌표 위치 안맞을시 e.pageY
			var divLeft = e.clientX; //좌측 좌표 위치 안맞을시 e.pageX
			var serial = $(this).attr("serial");
			var idx = $(this).attr("idx");
			$('#divView').empty().append('<div style="position:absolute;top:5px;right:5px"><span id="close" style="cursor:pointer;font-size:1.5em" title="닫기">x</span> </div><a href="#">이력보기</a><br/><a href="/travelMaker/qr/reportWriteForm.tm?rType=2&&idx=' + idx + '">채팅신고</a>');
			$('#divView').css({
				"top": divTop,
				"left": divLeft,
				"position": "absolute"
			}).show();
			$('#close').click(function(){document.getElementById('divView').style.display='none'});
		});
		</script>
	
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->