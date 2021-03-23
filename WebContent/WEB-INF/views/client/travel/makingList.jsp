<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		<h1>Making List</h1>
		
		<c:if test="${id==null}">
			로그인하시면 여행에 함께할 수 있습니다!
		</c:if>
		<c:if test="${id!=null}">
			${id}님 환영합니다!
			<c:if test="${rkInfo.rkNo==1}">
			${rkInfo.rkName} 단계에서는 아직 여행을 만들 수 없어요. 가이드와 함께 하는 여행에 참여해볼까요?			
			</c:if>
			<c:if test="${rkInfo.rkNo>1}">
				${rkInfo.rkName} 단계이시군요! 직접 여행을 만들어볼까요?	
				<input type="button" value="여행 만들기" onclick="window.location='/travelMaker/travel/makingWrite.tm'"/>
			</c:if>
		</c:if>
		
		<h2>대기 중인 여행</h2>
		<c:if test="${fn:length(waitingList)==0}">
			대기 중인 여행이 없습니다.
		</c:if>
		<c:if test="${fn:length(waitingList)>0}">
			<c:forEach var="wArticle" items="${waitingList}">
				<a href="makingCont.tm?gNo=${wArticle.gNo}">${wArticle.subject}</a>
			</c:forEach>
		</c:if>
		
		<h2>참여 중인 여행</h2>
		<c:if test="${fn:length(joiningList)==0}">
			참여 중인 여행이 없습니다.
		</c:if>
		<c:if test="${fn:length(joiningList)>0}">
			<c:forEach var="jArticle" items="${joiningList}">
				<a href="groupSpace.tm?gNo=${jArticle.gNo}">${jArticle.subject}</a>
			</c:forEach>
		</c:if>
		
		<h2>모집 중인 여행</h2>
		<c:if test="${count==0 || count==null}">
			<h2>모집 중인 여행이 없습니다</h2>
		</c:if>
		
		<c:if test="${count>0}">
			<table>
				<c:forEach var="article" items="${articleList}" varStatus="status">
				<tr>
					<td>${number}</td>
					<c:set var="number" value="${number-1}"/>
					<td>
						<a href="makingCont.tm?gNo=${article.gNo}&pageNum=${pageNum}">${article.subject}</a>					
					</td>
				</tr>
				</c:forEach>
			</table>
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
				<c:if test="${startPage>pageBlock}">
					<a href="makingList.tm?pageNum=${startPage-pageBlock}"> &lt; </a>
				</c:if>
				<!-- 페이지번호 리스트 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<a href="makingList.tm?pageNum=${i}">&nbsp; ${i} &nbsp;</a>
				</c:forEach>
				<!-- 뒤로 가는 기호 -->
				<c:if test="${endPage<pageCount}">
					<a href="makingList.tm?pageNum=${startPage+pageBlock}"> &gt; </a>
				</c:if>				
			</div>
			<!-- pageNumbers end -->
		</c:if>
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->