<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
	
		<h1>reportWritePro</h1>
		<h3>rNo:${rNo}</h3>
		<h3>rType:${rType}</h3>
		<h3>신고한사람:${memId}</h3>
		<h3>신고당한사람:${idx}</h3>
		
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->