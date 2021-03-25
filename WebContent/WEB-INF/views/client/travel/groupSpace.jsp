<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
	<h1>${grpSpace.subject}의 그룹 방입니다.</h1>

	
	<h2>신청자 리스트</h2>
	<c:if test="${fn:length(grpReq)==0}">
		신청자가 없습니다. 
	</c:if>
	<c:if test="${fn:length(grpReq)>0}">
		<c:forEach var="req" items="${grpReq}">
			${req.id}님<br/>
		</c:forEach>
	</c:if>
	
	<h2>참여 멤버 리스트</h2>
	<c:if test="${fn:length(grpMem)>0}">
		<c:forEach var="mem" items="${grpMem}">
			<c:if test="${mem.status==1}">
				${mem.id}님<br/>
			</c:if>			
		</c:forEach>
	</c:if>
	
	
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<!-- //footer end -->