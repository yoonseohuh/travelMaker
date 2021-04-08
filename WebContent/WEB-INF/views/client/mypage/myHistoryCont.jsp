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
		
		<div>
			<table>
				<tr>
					<td>
						${getGroup.startDate} ~ ${getGroup.endDate} <br/>
						개설자 :${getGroup.id}
						<h1>${getGroup.subject}</h1>
					</td>
				</tr>
				<tr>
					<td>
						<h2>Info</h2>
						<h4>코스설명</h4>
							${getGroup.courseExpl}<br/>
						<h4>부가설명</h4>
							${getGroup.addExpl} <br/>
						<h4>일	  정</h4>
						<c:forEach var="scheList" items="${scheList}">
							${scheList.sDate} : ${scheList.sCont} <br/>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>
						<h2>Member</h2>
							가이드  ${fn:length(gMem) - fn:length(posMem)} <br/>
						<c:forEach var="posMem" items="${posMem}" >
							${posMem.key} :${posMem.value}명 
						</c:forEach>
						<br/>참여 ${fn:length(gMem)}<br/>						
						<c:forEach var="gMem" items="${gMem}">
							${gMem.nickname}     
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>
						<h2>Gallery</h2>	
						<table>
						<c:forEach var="gList" items="${gList}">
							<c:if test="${!empty gList.pRoot}">
								<tr>
									<td>
										사진1:<img src="/travelMaker/save/${glist.pRoot}" width="200"/> <br/> <!-- 사진안된다.. -->
									</td>
								</tr>
							</c:if>
							<c:if test="${empty gList.pRoot}">
								<h1>게시된 사진이 없습니다.</h1>
							</c:if>
						</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<h2>General Review</h2>	
						개설자의 여행총평 : 
						
						<c:if test="${memId == getGroup.id}">
							<c:if test="${empty getGroup.genReview}">
								 ${getGroup.id}님 ! 동행자들이 개설자의 후기를 기다리고있어요!
							 	<button id="tab1">총평작성</button>
							 	<form action="/travelMaker/travel/genReviewPro.tm" id="cont2" name="reply" onsubmit="return check()" method="get">
							 		<input type="hidden" name="id" value="${getGroup.id}" />
							 		<input type="hidden" name="gNo" value="${getGroup.gNo}" />
							 		<input type="hidden" name="from" value="myHistory" />
							 		
									<textarea cols="100" rows="10" name="genReview" placeholder="개설자 ${getGroup.id}님의 여행총평을 남겨주세요!" ></textarea>
									<input type="submit" value="작성" />
								</form>
								<input type="button" value="취소" id="cancel" />
							</c:if>
							<c:if test="${!empty getGroup.genReview}">
								 ${getGroup.genReview}   -> 세션아이디랑 개설자랑 아이디 똑같을때
							</c:if>
						</c:if>
						
						<c:if test="${memId != getGroup.id}">
							<c:if test="${empty getGroup.genReview}">
								개설자의 총평이 아직 작성되지 않았습니다ㅠ_ㅠ  -> 세션아이디랑 개설자랑 다를떄
							</c:if>
							<c:if test="${!empty getGroup.genReview}">
								 ${getGroup.genReview} 
								<c:forEach var="reviewList" items="${reviewList}">
											<br/>└ ${reviewList.nickname}님 :  ${reviewList.genReply}
								</c:forEach>
								<c:if test="${result == 1 }">
									<br/><button id="tab1">답글달기</button>
								</c:if>
							</c:if>	
							
								 
							 	<form action="/travelMaker/travel/genReplyPro.tm" id="cont2" name="reply" method="get">
							 		<input type="hidden" name="id" value="${memId}" />
							 		<input type="hidden" name="gNo" value="${getGroup.gNo}" />
							 		<input type="hidden" name="from" value="myHistory" />
							 		
									<textarea cols="100" rows="10" name="genReply" onsubmit="return check()" placeholder="총평에 댓글로 소감을 남겨주세요!" ></textarea>
									<input type="submit" value="답글작성" />
								</form>
								<input type="button" value="취소" id="cancel" />
								 
						</c:if>
						<br/><button onclick="window.location='/travelMaker/my/myHistory.tm'">뒤로</button>
					</td>
				</tr>
			</table>
		</div>
		
		
		
	
	
	
	
	  			
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->

