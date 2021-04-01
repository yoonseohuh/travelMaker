<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/adminMenu.jsp" />
	<!-- //adminMenu end -->
	
	<div class="wrapAll admin">
	
	<c:forEach var="groupAllList" items="${groupAllList}" varStatus="status"> 
		<a href="/travelMaker/travel/makingCont.tm?gNo=${groupAllList.gNo}">No.${status.count}  / 그룹번호 : ${groupAllList.gNo} / 개설자ID : ${groupAllList.id} / 그룹이름 : ${groupAllList.subject} / 여행상태 : ${groupAllList.status} </a><br/>
	</c:forEach>
	
		
		
		
	</div>
	<!-- //wrapAll end -->
   
</body>
</html>