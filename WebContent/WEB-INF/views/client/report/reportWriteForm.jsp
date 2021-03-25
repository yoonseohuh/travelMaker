<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
		<h1>
			<c:if test="${rType == 0}">그룹 신고</c:if>
			<c:if test="${rType == 1}">랜드마크 신고</c:if>
			<c:if test="${rType == 2}">채팅 신고</c:if>
			<c:if test="${rType == 3}">쪽지 신고</c:if>
			<c:if test="${rType == 4}">코멘트 신고</c:if>
		</h1>
		
		<form action="reportWritePro.tm" method="get">
		<input type="hidden" name="rType" value="${rType}" />
		<input type="hidden" name="idx" value="${idx}" />
		<input type="hidden" name="id" value="${sessionScope.memId}" />
		<select name="rNo" >
			<option>선택</option>
			<c:forEach var="res" items="${res}">
				<option value="${res.rNo}">${res.rNo} / ${res.rCont}</option>
			</c:forEach>
		</select>
		<input type="submit" value="신고하기" />
		</form>
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->