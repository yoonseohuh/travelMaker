<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
		<script>
		$(document).ready(function(){
	        $('#cont2').hide();
	        $('#cancel').hide();
	        $('#tab1').click(function(){
	    		$('#cont2').show();
	    		$('#cancel').show();
	    		$('#tab1').hide();
	    	});    
	        $('#cancel').click(function(){
	    		$('#cont2').hide();
	    		 $('#cancel').hide();
	    		$('#tab1').show();
	    	});    
	    });
		//유효성 검사 
		function check(){
			var inputs = document.reply;
			if(!inputs.genReview.value){
				alert("내용을 입력해주세요.");
				return false;
			}else if(!input.genReply.value){
				alert("내용을 입력해주세요.");
				return false;
				}
			}
		</script>
	
		<jsp:include page="/WEB-INF/views/include/myMenu.jsp" />
		<!-- myMenu end -->
		<div class="aContWrap">
			<div class="aContHead">
				<div class="aContDate">
					[${getGroup.startDate} ~ ${getGroup.endDate}]
				</div>
				<div class="aContLine">
					<p class="aContTit">${getGroup.subject}</p>
					<p class="aContWri">개설자: ${getGroup.id} </p>
				</div>
			</div>
			<div class="aContInfo">
				<div class="aInfoTit">Info</div>
				<div class="aContBox">
					<div class="aContLeft">
						코스설명
					</div>
					<div class="aContRight">
						${getGroup.courseExpl}
					</div>	
				</div>		
				
				<div class="aContBox">
					<div class="aContLeft">
						부가설명
					</div>
					<div class="aContRight">
						${getGroup.addExpl} 
					</div>	
				</div>	
						
				<div class="aContBox">
					<div class="aContLeft">
						일정
					</div>
					<div class="aContRight">
						<c:forEach var="scheList" items="${scheList}">
							- ${scheList.sDate} : ${scheList.sCont}   </br>
						</c:forEach>
					</div>	
				</div>			
			</div>	
			<!-- aContInfo end -->		
			<div class="aInfoTit aMemTit">Member</div>			
			<p class="aMemCnt">가이드 : ${guideCnt}명</p>
			<!--  테스트 -->
			
			
			
						
			<div class="aMemPos">
				<c:forEach var="posMem" items="${posMem}" >
					<c:if test="${posMem.key ne '일반'}">
						${posMem.key} :${posMem.value}명 
					</c:if>
				</c:forEach>
			</div>
			<p class="aMemCnt">	참여 ${fn:length(gMem)}명 </p>			
			<div class="aMemPos">
				<c:forEach var="gMem" items="${gMem}">
					<c:if test="${gMem.nickname == memId}">${gMem.nickname}(개설자)</c:if>
					 ${gMem.nickname}     
				</c:forEach>
			</div>			
			<!-- aMemTit end -->			
			<div class="aInfoTit aMemTit">Gallery</div>					

			<ul>

				<li>
					<c:if test="${empty gList}">
							게시된 사진이 없습니다. </br></br></br>
					</c:if>
					<c:if test="${!empty gList}">
						<c:forEach var="gList" items="${gList}">
							<img src="/travelMaker/save/${gList.pRoot}" width="200px"/> 
						</c:forEach>
					</c:if>
				</li>
			</ul>

			
			<div class="aInfoTit aMemTit">General Review</div>		
			
			
			<c:if test="${memId == getGroup.id}">
				<c:if test="${empty getGroup.genReview}">
					<p class="aMemPos"> ${getGroup.id}님 ! 동행자들이 개설자의 후기를 기다리고있어요!</p>
				 	<button id="tab1" class="comBtn btnRight">총평작성</button>
				 	<form action="/travelMaker/travel/genReviewPro.tm" id="cont2" name="reply" onsubmit="return check()" method="get">
				 		<input type="hidden" name="id" value="${getGroup.id}" />
				 		<input type="hidden" name="gNo" value="${getGroup.gNo}" />
				 		<input type="hidden" name="from" value="myHistory" />
				 		
						<textarea cols="100" rows="10" name="genReview" placeholder="개설자 ${getGroup.id}님의 여행총평을 남겨주세요!" ></textarea>
						<button type="submit" class="comBtn btnRight">작성</button>
					</form>
					<button class="comBtn btnRight"  id="cancel">취소</button>
				</c:if>
				<!-- -> 세션아이디랑 개설자랑 아이디 똑같을때 -->
				<c:if test="${!empty getGroup.genReview}">
					 ${getGroup.genReview}   
				</c:if>
			</c:if>
			
			<c:if test="${memId != getGroup.id}">
				<c:if test="${empty getGroup.genReview}">
					<p class="aMemPos"> 개설자의 총평이 아직 작성되지 않았습니다!</p> <!--세션아이디랑 개설자랑 다를떄 --> 
				</c:if>
				<c:if test="${!empty getGroup.genReview}">
					 ${getGroup.genReview} 
					<c:forEach var="reviewList" items="${reviewList}">
								<br/>&nbsp; &nbsp; >>  ${reviewList.nickname}님 :  ${reviewList.genReply}
					</c:forEach>
					<c:if test="${result == 1 }">
						<button id="tab1" class="comBtn btnRight">답글달기</button>
					</c:if>
				</c:if>	
					 
				 	<form action="/travelMaker/travel/genReplyPro.tm" id="cont2" name="reply" method="get">
				 		<input type="hidden" name="id" value="${memId}" />
				 		<input type="hidden" name="gNo" value="${getGroup.gNo}" />
				 		<input type="hidden" name="from" value="myHistory" />
				 		
						<textarea cols="100" rows="10" name="genReply" onsubmit="return check()" placeholder="총평에 댓글로 소감을 남겨주세요!" ></textarea>
						<button class="comBtn btnRight" type="submit">답글작성</button>
					</form>
					<button class="comBtn btnRight" id="cancel">취소</button>
					 
			</c:if>
			
			<button onclick="window.location='/travelMaker/my/myHistory.tm'" class="comBtn btnRight">back</button>
		</div>
		<!-- aContWrap end -->
		
		
	
	
	
	
	  			
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->

