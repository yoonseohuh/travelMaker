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
		<a id="tab1">받은쪽지함</a> | <a id="tab2">보낸쪽지함</a>
		
		
		
		<div id="cont1">
		<h1>받은쪽지함</h1>
		<button onclick="window.location='messageWrite.tm'">쪽지쓰기</button>
		<c:if test="${recMsgCnt == 0}">
		저런 ! 받은 쪽지가 없네요^^ 
		</c:if>
		<c:if test="${recMsgCnt > 0}">
		<form action="messageDel.tm" method="get">
			<input type="submit" value="삭제" />
			<div>
			<ul>
			<c:forEach var="recMsgList" items="${recMsgList}"> 
				<li class="menu">
				<input type="checkbox" name="msgNo" value="${recMsgList.mNo}" /><a>${recMsgList.mNo} /받는사람: ${recMsgList.receiver}/ 보낸사람: ${recMsgList.sender}  / ${recMsgList.mStatus} / ${recMsgList.reg}  ▼ </a>
					<ul style="display:none;">
						<li><textarea rows="10" cols="50" readonly style="resize: none;">내용 : ${recMsgList.mCont}</textarea></li><br/>
						<input type="button" name="dap" value="답장" onclick="window.location='messageWrite.tm?reply=${recMsgList.sender}'" />
					</ul>
				</li>
			</c:forEach>
			</ul>
			</div>
		</form>
		</c:if>
		</div>
		
		
		
		<div id="cont2">
		<h1>보낸쪽지함</h1>
		<button onclick="window.location='messageWrite.tm'">쪽지쓰기</button>
		<c:if test="${senMsgCnt == 0}">
		보낸쪽지가 없습니다.
		</c:if>
		<c:if test="${senMsgCnt > 0}">
		<form action="messageDel.tm" method="get">
			<input type="submit" value="삭제" />
			<div>
			<ul>
			<c:forEach var="senMsgList" items="${senMsgList}"> 
				<li class="menu">
				<input type="checkbox" name="msgNo" value="${senMsgList.mNo}" /><a>${senMsgList.mNo} /받는사람 : ${senMsgList.receiver}/ 보낸사람: ${senMsgList.sender}  / ${senMsgList.mStatus} / ${senMsgList.reg}  ▼ </a>
					<ul style="display:none;">
						<li><textarea rows="10" cols="50" readonly style="resize: none;">내용 : ${senMsgList.mCont}</textarea></li><br/>
					</ul>
				</li>
			</c:forEach>
			</ul>
			</div>
		</form>
		</c:if>
		</div>
		
		
		
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->