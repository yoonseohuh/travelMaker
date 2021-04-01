<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<jsp:include page="/WEB-INF/views/include/top.jsp" />
<!-- //top end -->

<div class="wrapAll">

	<h1>sharedList</h1>
	<c:if test="${count > 0}">
		<table>
			<c:forEach var="shared" items="${sharedList}" varStatus = "status">
				<li>
					<a></a>
				</li>
			</c:forEach>
		</table>
	</c:if>
	<table>
		
	</table>








</div>
<!-- //wrapAll end -->

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->