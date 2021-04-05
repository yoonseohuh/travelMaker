<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
	
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
								 <button onclick="#">총평작성</button>
							</c:if>
							<c:if test="${!empty getGroup.genReview}">
								 ${getGroup.genReview} 뜨나??
							</c:if>
						</c:if>
						<c:if test="${memId != getGroup.id}">
							<c:if test="${empty getGroup.genReview}">
								개설자의 총평이 아직 작성되지 않았습니다ㅠ_ㅠ 
							</c:if>
							<c:if test="${!empty getGroup.genReview}">
								 ${getGroup.genReview} 뜨나??   
								 <br/><button onclick="window.location='/travelMaker/my/myHistory.tm'">답글달기</button>
							</c:if>
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

