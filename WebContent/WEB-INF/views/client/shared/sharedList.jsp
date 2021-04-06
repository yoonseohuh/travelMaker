<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />

<jsp:include page="/WEB-INF/views/include/top.jsp" />
<!-- //top end -->

<div class="wrapAll">

	<h1>sharedList</h1>
	<c:if test="${count == 0}">
		<table>
			<tr><td> 게시글이 없습니다. </td></tr>
		</table>
	</c:if>
	<c:if test="${count !=0 }">
		<table>
			<tr>
				<td>No.</td>
				<td>작성자</td>
				<td>시간</td>
			</tr>
			<c:forEach var="shared" items="${articleList}">
				<tr>
					<td>${number}
					<c:set var="number" value="${number-1}" />
					</td>
				</tr>
			</c:forEach>
		</table>
		<h4> 현재 페이지 </h4>
		<c:set var="pageBlock" value="8" />
		<fmt:parseNumber var="res" value="${count / pageSize}" integerOnly="true" />
		<c:set var="pageCout" value="${rest + (count % pageSize == 0 ? 0 :1)}" />
		<fmt:parseNumber var="result" value="${(currPage -1)/pageBlock}" integerOnly="true" />
		<fmt:parseNumber var="startPage" value="${result * pageBlock + 1}" />
		<fmt:parseNumber var="endPage" value="${startPage + pageBlock - 1}" />
		<c:if test="${endPage > pageCount}">
			<c:set var="endPage" value="${pageCount}" />
		</c:if>
		
		<c:if test="${startPage > pageBlock}">
			<a href="/travelMaker/shared/sharedList.tm?pageNum=${startPage-pageBlock}" class="pageNums"> &lt; </a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1"  >
			<a href="/travelMaker/shared/sharedList.tm?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp; </a>
		</c:forEach>
		
		
	</c:if>
	








</div>
<!-- //wrapAll end -->

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->