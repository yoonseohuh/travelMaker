<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
	
		<div class="myPageWrap myPageWrap3">
			<c:import url="/WEB-INF/views/include/userMenu.jsp">
				<c:param name="userId" value="${userId}"></c:param>
			</c:import>
			<h2 class="pageTit">${userId}님의 여행이력</h2>
			
			<c:if test="${empty travelAll}">
				<h2>
					아직 참여한 여행이 없습니다.
				</h2>
			</c:if>
			<c:if test="${!empty travelAll}">
				<div class="infoList">
					<c:forEach var="travelAll" items="${travelAll}" varStatus="status">
			             <ul>
			                 <li>
			                     <div>
			                         <h2>${travelAll.subject} <%-- <a href="/travelMaker/my/myHistoryCont.tm?gNo=${travelAll.gNo}&status=${travelAll.status}" class="posA">더 알아보기 ></a> --%></h2>
			                         <dl>
			                             <dt>날짜</dt>
			                             <dd>${travelAll.startDate} ~ ${travelAll.endDate}</dd>
			                         </dl>
			                         <dl>
			                             <dt>컨셉</dt>
			                             <dd class="cos">${travelAll.concept}</dd>
			                         </dl>
			                         <dl>
			                             <dt>코스 설명</dt>
			                             <dd class="cos">${travelAll.courseExpl}</dd>
			                         </dl>
			                     </div>
			                 </li>
			             </ul>
					</c:forEach>
		         </div>
	         <!--infoList end-->
			</c:if>
		</div>
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
   
</body>
</html>