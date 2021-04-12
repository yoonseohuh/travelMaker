<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />

<jsp:include page="/WEB-INF/views/include/top.jsp" />
<!-- //top end -->

<div class="wrapAll client">

	<jsp:include page="/WEB-INF/views/include/myMenu.jsp" />
	<!-- myMenu end -->
	<h1>여행이력</h1>
	<c:if test="${empty travelAll}">
		<h2>
			참여한 여행이 없습니다. <br />여행을 떠나보세요!
		</h2>
		<button onclick="window.location='/travelMaker/travel/makingList.tm'">여행떠나기</button>
	</c:if>
	<c:if test="${!empty travelAll}">
		<c:forEach var="travelAll" items="${travelAll}" varStatus="status">
				${status.count}번째 여행 : <a
				href="/travelMaker/my/myHistoryCont.tm?gNo=${travelAll.gNo}&status=${travelAll.status}">${travelAll.subject}</a>
			<br />
		</c:forEach>
	</c:if>

	<h1>내가 좋아요한 여행</h1>
	
		<form action="/travelMaker/shared/sharedLikedCancel.tm" name="likeCancel" method="post">
			<input type="submit" value="취소" /> 
			
			<c:forEach var="list" items="${lsharedList}">
				<ul>
					<li><input type="checkbox" name="cancel" value="${list.gNo}" /></li>
					<li> 그룹 번호 : ${list.gNo}</li>
					<li>여행 이름 : ${list.subject}</li>
					<li></li>
				</ul>
		</c:forEach>
	</form>
</div>
<!-- //wrapAll end -->

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->

