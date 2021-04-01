<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/adminMenu.jsp" />
	<!-- //adminMenu end -->
	
	<div class="wrapAll admin">
		
		<h1>그룹관리</h1>
	
		<div class="searchBar">
			<form action="/travelMaker/admin/adminGroup.tm">
				<select name="sel">
					<option value="null">선택하세요</option>
					<option value="id" >개설자</option>
					<option value="subject">여행명</option>
					<option value="loc">지역</option>
				</select>
				<input type="text" name="search" />
				<input type="submit" value="검색" />
			</form>
		</div>
		<!-- //searchBar end -->
		
		
		<ul class="adminGroup">
			<c:forEach var="groupAllList" items="${groupAllList}" varStatus="status">
			<li>
				<a href="/travelMaker/travel/makingCont.tm?gNo=${groupAllList.gNo}">
				<p>No.${status.count}</p>
				<p>그룹번호 : ${groupAllList.gNo}</p>
				<p>개설자ID : ${groupAllList.id}</p>
				<p>그룹이름 : ${groupAllList.subject}</p>
				<p>여행상태 : ${groupAllList.status}</p>
				</a>
			</li>
			</c:forEach>
		</ul>
		<!-- //adminGroup end -->		
		
	</div>
	<!-- //wrapAll end -->
   
</body>
</html>