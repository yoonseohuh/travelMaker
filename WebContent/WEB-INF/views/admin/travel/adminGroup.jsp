<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/adminMenu.jsp" />
	<!-- //adminMenu end -->
	
	<div class="wrapAll admin">
		
		<h1>그룹관리</h1>
	
		<div class="searchBar">
			<input type="text" />
			<input type="submit" value="검색" />
		</div>
		<!-- //searchBar end -->
	
		<ul class="adminGroup">
			<c:forEach var="groupAllList" items="${groupAllList}" varStatus="status">
			<li>
				<a href="/travelMaker/travel/makingCont.tm?gNo=${groupAllList.gNo}"></a>
				<p>No.${status.count}</p>
				<p>그룹번호 : ${groupAllList.gNo}</p>
				<p>개설자ID : ${groupAllList.id}</p>
				<p>그룹이름 : ${groupAllList.subject}</p>
				<p>여행상태 : ${groupAllList.status}</p>
			</li>
			</c:forEach>
		</ul>
		<!-- //adminGroup end -->		
		
	</div>
	<!-- //wrapAll end -->
   
</body>
</html>