<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<jsp:include page="/WEB-INF/views/include/top.jsp" />
<!-- //top end -->

<div class="wrapAll">

	<h1>sharedList</h1>
	<c:if test="${sessionScope.memId != null}"></c:if>
	<c:if test="${count > 0}">
		<table>
			<c:forEach var="sharedList" items="${sharedList}" varStatus="status">
				<li>
					<a href="completeCont.tm?gNo=${shared.gNo}&pageNum=${pageNum}"></a>
					<p class="number">${number}</p><c:set var="number" value="${number-1}"></c:set>
					<p class=""></p>
				</li>
			</c:forEach>
		</table>
	</c:if>









</div>
<!-- //wrapAll end -->

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->