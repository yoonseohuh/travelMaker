<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="manualBody">
		<div class="rankWrap">
			<div class="rankHead">
				<h2>등급에 따라 더 많은 권한이 부여됩니다. <br/>여행 횟수를 늘려 등급을 올리세요.</h2>
				<p>Rank System</p>
			</div>
			<div class="rankBody">
			
				<c:forEach var="rk" items="${rkList}" varStatus="status">
					<div class="firstRank">
						<div class="rankLeft rankRLeft">
							<h2>${rk.rkName}</h2>
							<p class="rankNeed">${rk.rkNeed}회</p>
						</div>
						<div class="rankRight">
							<div class="rightTit">
								<p>${rk.rkExpl}</p>
							</div>
							<div class="rightSub">
								<c:forTokens items="${rk.rkAddExpl}" delims="," var="item">
									<p>${item}</p>
									<!-- 마지막 랭크 아래에만 매뉴얼 버튼을 표시하기 위함 -->
									<c:set var="nextVal" value="${rkList[status.count]}"/>
								</c:forTokens>
							</div>
						</div>
						<c:if test="${nextVal==null}">
							<a href="manual.tm" class="posA rankA">매뉴얼 ></a>
						</c:if>
					</div>
				</c:forEach>
			</div>	
		</div>
			<!-- rankBody -->
	</div>
	<!-- manualBody end -->
	
	
