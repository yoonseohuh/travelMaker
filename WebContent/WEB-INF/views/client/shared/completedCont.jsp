<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<jsp:include page="/WEB-INF/views/include/top.jsp" />
<!-- //top end -->

<div class="myPageWrap myPageWrap2">

	<c:if test="${sessionScope.memId==null}">
		<script>
			alert("자세한 정보를 보시려면 로그인을 해주세요.");
			location.href='/travelMaker/mem/loginForm.tm';
		</script>
		<script>
		
		</script>
	</c:if>
	<c:if test="${sessionScope.memId!=null}">
	<div class="aContWrap">
			<div class="aContHead">
				<h2 class="pageTit">"${getGroup.subject}"</h2>
				<div class="aContLine">
					<p>[${getGroup.startDate} ~ ${getGroup.endDate}]</p>
					<p class="aContWri">개설자: ${getGroup.id} </p>
					<p>조회수 : ${article.readCnt}</p>
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
				<!--aContBox-->
				<div class="aContBox">
					<div class="aContLeft">
						부가설명
					</div>
					<div class="aContRight">
						<c:if test="${getGroup.addExpl eq null}">
							등록된 부가설명이 없습니다.
						</c:if>
						<c:if test="${getGroup.addExpl ne null}">
							${getGroup.addExpl}
						</c:if>
					</div>	
				</div>	
				<!--aContBox-->
				<div class="aContBox">
					<div class="aContLeft">
						일정
					</div>
					<div class="aContRight">
						<c:if test="${scheCnt == 0}">
							등록된 일정이 없습니다.
						</c:if>
						<c:if test="${scheCnt != 0}">
							<c:forEach var="schedules" items="${schedules}">
								${schedules.sDate} : ${schedules.sCont} <br />
							</c:forEach>
						</c:if>							
					</div>	
				</div>		
				<!--aContBox-->	
			</div>	
			<!-- aContInfo end -->		
			<div class="aInfoTit aMemTit">Member</div>		
				<c:if test="${guideCnt == 0}">
					참여한 가이드가 없습니다.
				</c:if>
				<c:if test="${guideCnt != 0}">
					<p class="aMemCnt">가이드 ${guideCnt}명</p>
				</c:if>
			<div class="aMemPos">
				<c:forEach var="posMem" items="${posMem}" >
					<c:if test="${posMem.key ne '일반'}">
						${posMem.key} &nbsp;
					</c:if>
				</c:forEach>
			</div>
			<p class="aMemCnt">	참여 ${fn:length(gMem)}명 </p>			
			<div class="aMemPos">
				<c:forEach var="gMem" items="${gMem}">
					${gMem.nickname}
				</c:forEach>
				
			</div>			
			<!-- aMemTit end -->			
			<div class="aInfoTit aMemTit">Gallery</div>					
			<ul>
				<li>
					<c:if test="${empty gList}">
							게시된 사진이 없습니다. <br/><br/><br/>
					</c:if>
					<c:if test="${!empty gList}">
						<c:forEach var="gList" items="${gList}">
							<img src="/travelMaker/save/${gList.pRoot}" width="200px"/> 
						</c:forEach>
					</c:if>
				</li>
			</ul>
			<div class="lastWrap">
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
				</c:if>
			</div>
			<button onclick="window.location='/travelMaker/shared/sharedList.tm'" class="comBtn btnRight">back</button>
		</div>
		</c:if>
		<!-- aContWrap end -->


	<%-- <h1>completeCont</h1>

	<c:if test="${sessionScope.memId==null}">
		<script>
			alert("자세한 정보를 보시려면 로그인을 해주세요.");
			location.href='/travelMaker/mem/loginForm.tm';
		</script>
		<script>
		
		</script>
	</c:if>
	<c:if test="${sessionScope.memId!=null}">
		<table>
			<tr>
				<td>${article.startDate}~${article.endDate}<br /> 
					개설자: ${article.id}
					<h1>${article.subject}</h1>
				</td>
			</tr>
			<tr>
				<td> 조회수 : ${article.readCnt}</td>
				<td>좋아요 수: ${article.likedCnt}</td>
			</tr>
			
			<tr>
				<td>
					<h2>Info</h2>
					<h4>코스설명</h4> ${article.courseExpl}<br />
					<h4>부가설명</h4> ${article.addExpl} <br />
					<h4>성별</h4> ${aritlce.dongsung} <br/>
					<h4>일 정</h4> <c:forEach var="schedules" items="${schedules}">
						${schedules.sDate} : ${schedules.sCont} <br />
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td>
					<h2>Member</h2> 가이드 ${fn:length(gMem) - fn:length(posMem)}명 <br />
					<c:forEach var="posMem" items="${posMem}">
						${posMem.key} :${posMem.value}명 
					</c:forEach> <br /> 참여 ${fn:length(gMem)}명<br /> <c:forEach var="gMem" items="${gMem}">
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
									<td>사진1:<img src="/travelMaker/save/${glist.pRoot}" width="200" /> <br /> <!-- 사진안된다.. -->
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
								총평을 작성 합시다.
							</c:if>
						<c:if test="${!empty getGroup.genReview}">
								 ${getGroup.genReview}
							</c:if>
					</c:if> 
					<c:if test="${memId != getGroup.id}">
						<c:if test="${empty getGroup.genReview}">
								개설자의 총평이 작성되지 않았습니다.
						</c:if>
						<c:if test="${!empty getGroup.genReview}">
								 ${getGroup.genReview}
						</c:if>
					</c:if>
				</td>
			</tr>
		</table>
		<c:if test="${check == 0}">
			<form class="likeForm" action="/travelMaker/shared/sharedLikedPro.tm" method="post">
				<input type="hidden" name="gNo" value="${article.gNo}">
				<input type="hidden" name="id" value="${sessionScope.memId}">
				<input type="image" id="heartIcon" src="../resources/images/heart-empty.png" width="14" alt="좋아요"/>
			</form>
		</c:if>
		<c:if test="${check == 1}">
			<img src="../resources/images/heart-colored.png" width="14">
		</c:if>
	</c:if> --%>
</div>
<!-- //wrapAll end -->

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->