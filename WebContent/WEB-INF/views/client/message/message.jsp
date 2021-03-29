<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		
		<script>
		$(document).ready(function(){
	        $(".menu>a").click(function(){      //클래스가 menu의 아랫놈인 a를 클릭하면
	            var submenu = $(this).next("ul");      //a 다음에있는 "ul을 submenu에 담고 
	 
	            if( submenu.is(":visible") ){     // ul display: none 아닐떄         -->display: none false 를 반환 한다.
	                submenu.slideUp();			//ul이 슬라이드업
	            }else{						// display: none이면 
	                submenu.slideDown();	//ul부분 슬라이드다운
	            }
	        });
	        $('#cont2').hide();
	        $('#tab1').click(function(){
	    		$('#cont2').hide();
	    		$('#cont1').fadeIn();
	    	});
	    	$('#tab2').click(function(){
	    		$('#cont1').hide();
	    		$('#cont2').fadeIn();
	    	});
	    });	
		</script>
		
		<br/><br/><br/><br/>
		<h1>이곳은 쪽지함이다</h1>
		<a id="tab1">보낸쪽지함</a> | <a id="tab2">받은쪽지함</a>
		
		
		
		<div id="cont1">
		
		<h1>보낸쪽지함</h1>
		<button onclick="window.location='messageWrite.tm'">쪽지쓰기</button>
		<form action="messageDel.tm" method="get">
			<input type="submit" value="삭제" />
			<c:forEach var="senMsgList" items="${senMsgList}"> 
				<input type="checkbox" name="msgNo" value="${senMsgList.mNo}" />${senMsgList.mNo} / ${senMsgList.receiver}/ ${senMsgList.sender} / ${senMsgList.mCont} /${senMsgList.mStatus} / ${senMsgList.reg}<br/>
			</c:forEach>
		</form>

		</div>
		
		
		
		<div id="cont2">
		<h1>받은쪽지함</h1>
		<button onclick="window.location='messageWrite.tm'">쪽지쓰기</button>
			<form action="messageDel.tm" method="get">
				<input type="submit" value="삭제" />
				<c:forEach var="recMsgList" items="${recMsgList}"> 
					<input type="checkbox" value="${recMsgList.mNo}">${recMsgList.mNo} / ${recMsgList.receiver}/ ${recMsgList.sender} / ${recMsgList.mCont} /${recMsgList.mStatus} / ${recMsgList.reg}<br/>
				</c:forEach>
			</form>
		</div>
		
		
		
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->