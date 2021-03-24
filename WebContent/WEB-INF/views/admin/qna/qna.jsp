<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/adminMenu.jsp" />
	<!-- //adminMenu end -->
	
	<div class="wrapAll admin">
	
		<h1>문의관리</h1>
		<h3>${count}/${startPage}/현재 페이지: ${pageNum}</h3>
		<c:if test="${count>0}">
		<table>
			<tr>
				<th>No</th>
				<th>분류</th>
				<th>내용</th>
				<th>작성일</th>
				<th>처리여부</th>
			</tr>
			<c:forEach var="article" items="${qnaList}">
			<tr>
				<td>${number}</td>
				<c:set var="number" value="${number-1}"/>
				<td>${article.rCont}</td>
				<td>
					${article.content}		
				</td>
				<td>${article.reg}</td>
				<td>
					<c:if test="${article.status == 0}">N</c:if>
					<c:if test="${article.status == 1}">Y</c:if>
				</td>
			</tr>
			<%-- <tr>
				<td></td>
				<td colspan="2">${qnaList.feedback}</td>
				<td colspan="2">${qnaList.fbReg}</td>
			</tr> --%>
			</c:forEach>
		</table>
		<div class="pageNumbers">
			<c:set var="pageBlock" value="5"/>
			<fmt:parseNumber var="res" value="${count/pageSize}" integerOnly="true"/>
			<c:set var="pageCount" value="${res+(count%pageSize==0 ? 0 : 1)}"/>
			<fmt:parseNumber var="result" value="${(currPage-1)/pageBlock}" integerOnly="true"/>
			<c:set var="startPage" value="${result*pageBlock+1}"/>
			<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			<c:if test="${endPage>pageCount}">
				<c:set var="endPage" value="${pageCount}"/>
			</c:if>
			
			<!-- 앞으로 가는 기호 -->
			<c:if test="${startPage>pageBlock}">
				<a href="myQnaReportList.tm?pageNum=${startPage-pageBlock}"> &lt; </a>
			</c:if>
			<!-- 페이지번호 리스트 -->
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="myQnaReportList.tm?pageNum=${i}">&nbsp; ${i} &nbsp;</a>
			</c:forEach>
			<!-- 뒤로 가는 기호 -->
			<c:if test="${endPage<pageCount}">
				<a href="myQnaReportList.tm?pageNum=${startPage+pageBlock}"> &gt; </a>
			</c:if>				
		</div>
		<!-- pageNumbers end -->
		</c:if>
		
	</div>
	<!-- //wrapAll end -->
   
</body>
</html>