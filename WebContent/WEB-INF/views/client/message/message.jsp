<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
		
		<div class="msWrap">
		
			<div class="titWrap">
				<p class="tit2" data-aos="fade-right" data-aos-duration="500">간편하게 여행 정보를 공유할 수 있습니다.</p>
				<p class="tit2" data-aos="fade-right" data-aos-delay="200" data-aos-duration="500">서로 쪽지를 주고 받아 보세요!</p>
			</div>
			
			<c:if test="${sessionScope.memId==null}">
				<script>
					alert("로그인 후에 접근 가능합니다");
					location.href='/travelMaker/mem/loginForm.tm';
				</script>
			</c:if>
				
			<script>
			$(document).ready(function(){
				
				$("input:checkbox[name=msg]").on("click",function(){
					
					var arr = new Array();
					$("input:checkbox[name=msg]:checked").each(function(){
						var checkVal = $(this).val();
						arr.push(checkVal);
					});
					$("#msgNo").val(arr);
					console.log($('#msgNo').val());
					
				});
				
		        $(".menu > li > .sub").click(function(){ 
		            $(this).parent('li').siblings().children('ul').hide();
		            $(this).next('ul').fadeToggle(200);
		        });
		        
		        $('#ms2').hide();
		        $('#tab1').click(function(){
		        	$(this).siblings().removeClass('on');
		        	$(this).addClass('on');
		    		$('#ms2').hide();
		    		$('#ms1').fadeIn();
		    	});
		    	$('#tab2').click(function(){
		    		$(this).siblings().removeClass('on');
		        	$(this).addClass('on');
		    		$('#ms1').hide();
		    		$('#ms2').fadeIn();
		    	});
		    });	
			</script>
			
			
			<ul class="gsMenu">
				<li id="tab1" class="on">받은쪽지함</li>
				<li id="tab2">보낸쪽지함</li>				
			</ul>
			
			
			
			<div id="ms1" class="msCont">			
				<c:if test="${recMsgCnt == 0}">
				저런 ! 받은 쪽지가 없네요^^ 
				</c:if>
				<c:if test="${recMsgCnt > 0}">
				<form action="messageDel.tm" method="get">
					<input type="hidden" id="msgNo" name="msgNo">
					<ul class="menu">
						<c:forEach var="recMsgList" items="${recMsgList}"> 
						<li>
							<span class="check"><input type="checkbox" name="msg" value="${recMsgList.mNo}" /></span>
							<p class="sub ${recMsgList.mStatus}"><span class="man">${recMsgList.sender}님으로부터</span><span class="ex">${recMsgList.mCont}</span><span class="date">${recMsgList.reg}</span></p>
							<%-- <input type="checkbox" name="msg" value="${recMsgList.mNo}" /><a>${recMsgList.mNo} /받는사람: ${recMsgList.receiver}/ 보낸사람: ${recMsgList.sender}  / ${recMsgList.mStatus} / ${recMsgList.reg}  ▼ </a> --%>
							<ul style="display:none;">
								<li>
									<textarea readonly style="resize: none;">${recMsgList.mCont}</textarea>
									<input type="button" name="dap" value="답장" class="btn btnY" onclick="window.location='messageWrite.tm?reply=${recMsgList.sender}'" />
								</li>								
							</ul>
						</li>
						</c:forEach>
					</ul>
					<div class="btnWrap">
						<p onclick="window.location='messageWrite.tm'" class="btn btnY">쪽지쓰기</p>
						<input type="submit" value="삭제" class="btn btnC"/>
					</div>
				</form>
				</c:if>
			</div>
			
			
			
			<div id="ms2" class="msCont">				
				<c:if test="${senMsgCnt == 0}">
				보낸쪽지가 없습니다.
				</c:if>
				<c:if test="${senMsgCnt > 0}">
				<form action="messageDel.tm" method="get">					
					<ul class="menu">
						<c:forEach var="senMsgList" items="${senMsgList}"> 
						<li>
							<%-- <input type="checkbox" name="msgNo" value="${senMsgList.mNo}" /><a>${senMsgList.mNo} /받는사람 : ${senMsgList.receiver}/ 보낸사람: ${senMsgList.sender}  / ${senMsgList.mStatus} / ${senMsgList.reg}  ▼ </a> --%>
							<span class="check"><input type="checkbox" name="msgNo" value="${senMsgList.mNo}" /></span>
							<p class="sub ${senMsgList.mStatus}"><span class="man">${senMsgList.receiver}님에게</span><span class="ex">${senMsgList.mCont}</span><span class="date">${senMsgList.reg}</span></p>
							<ul style="display:none;">
								<li><textarea readonly style="resize: none;">${senMsgList.mCont}</textarea></li><br/>
							</ul>
						</li>
						</c:forEach>
					</ul>
					<div class="btnWrap">
						<p onclick="window.location='messageWrite.tm'" class="btn btnY">쪽지쓰기</p>
						<input type="submit" value="삭제" class="btn btnC"/>
					</div>
				</form>
				</c:if>
			</div>
		
		</div>
		<!-- //msWrap end -->
		
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->