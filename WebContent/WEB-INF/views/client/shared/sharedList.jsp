<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />

<jsp:include page="/WEB-INF/views/include/top.jsp" />
<!-- //top end -->

<div class="wrapAll client">

	<h1>sharedList</h1>
	
	<c:if test="${count == 0}">
		<table>
			<tr><td> 게시글이 없습니다. </td></tr>
		</table>
	</c:if>
	<c:if test="${count > 0 }">
		<div id="sList">
			<div id="articleTable">
				<ul class="makingList">
					<c:forEach var="article" items="${sharedList}" varStatus="status" >
						<li>
							<a href="completedCont.tm?gNo=${article.gNo}&pageNum=${pageNum}"></a>
							<p class="title">${article.subject}</p>
							<p class="maker">${article.id}</p>
							<p class="date">${article.startDate}~${article.endDate}</p>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		현재 페이지: ${pageNum}
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
				<c:if test="${start!=null && end!=null}">
					<c:if test="${startPage>pageBlock}">
						<a href="sharedList.tm?pageNum=${startPage-pageBlock}&start=${start}&end=${end}"> &lt; </a>
					</c:if>				
				</c:if>				
				<c:if test="${start==null || end==null}">
					<c:if test="${startPage>pageBlock}">
						<a href="sharedList.tm?pageNum=${startPage-pageBlock}"> &lt; </a>
					</c:if>
				</c:if>
				<!-- 페이지번호 리스트 -->				
				<c:if test="${start!=null && end!=null}">
					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
						<a href="sharedList.tm?pageNum=${i}&start=${start}&end=${end}">&nbsp; ${i} &nbsp;</a>
					</c:forEach>
				</c:if>
				<c:if test="${start==null || end==null}">
					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
						<a href="sharedList.tm?pageNum=${i}">&nbsp; ${i} &nbsp;</a>
					</c:forEach>
				</c:if>
				<!-- 뒤로 가는 기호 -->				
				<c:if test="${start!=null && end!=null}">
					<c:if test="${endPage<pageCount}">
						<a href="sharedList.tm?pageNum=${startPage+pageBlock}&start=${start}&end=${end}"> &gt; </a>
					</c:if>
				</c:if>
				<c:if test="${start==null || end==null}">
					<c:if test="${endPage<pageCount}">
						<a href="sharedList.tm?pageNum=${startPage+pageBlock}"> &gt; </a>
					</c:if>
				</c:if>
			</div>
		
	</c:if>

</div>
<!-- //wrapAll end -->

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->