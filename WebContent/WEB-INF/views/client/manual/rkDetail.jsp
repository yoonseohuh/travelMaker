<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="manualBody">
		<div class="rankHead">
			<div class="rankLeft">
				<h2>모험가 등급 안내</h2>
			</div>
			<div class="rankRight">
				<p>등급에 따라 더 많은 권한이 부여됩니다.</p>
				<p>여행 횟수를 늘려 등급을 올려보세요.</p>
			</div>
		</div>
		<div class="rankBody">
			<div class="firstRank">
					<div class="rankLeft rankRLeft">
						<h2>스타터</h2>
						<p class="rankNeed">0회</p>
					</div>
					<div class="rankRight">
						<div class="rightTit">
							<p>이제 시작하셨군요! 모험을 떠나보세요!</p>
						</div>
						<div class="rightSub">
							<p>1인 여행 개설 가능</p>
							<p>생성된 모험에 참여 가능</p>
						</div>	
					</div>
			</div>
			
			<div class="firstRank">
					<div class="rankLeft rankRLeft">
						<h2>트래블러</h2>
						<p class="rankNeed">10회</p>
					</div>
					<div class="rankRight">
						<div class="rightTit">
							<p>여행가로서의 첫번째 발걸음을 디뎠습니다.</p>
						</div>
						<div class="rightSub">
							<p>그룹 여행 개설 가능</p>
						</div>	
					</div>
			</div>
			
			<div class="firstRank">
					<div class="rankLeft rankRLeft">
						<h2>어드바이저</h2>
						<p class="rankNeed">25회</p>
					</div>
					<div class="rankRight">
						<div class="rightTit">
							<p>오, 당신의 재능을 발견할 때가 되었군요.</p>
						</div>
						<div class="rightSub">
							<p>첫번째 포지션 선택 가능</p>
						</div>	
					</div>
			</div>
			
			<div class="firstRank">
					<div class="rankLeft rankRLeft">
						<h2>마스터</h2>
						<p class="rankNeed">50회</p>
					</div>
					<div class="rankRight">
						<div class="rightTit">
							<p>Travel Maker의 끝판왕! 단언컨대 당신은 여행에 충분히 숙달되었을 거예요.</p>
						</div>
						<div class="rightSub">
							<p>두번째 포지션 선택 가능</p>
							<a href="manual.tm" class="posA rankA">메뉴얼 ></a>
						</div>	
					</div>
			</div>
			
		</div>
		<!-- rankBody -->
	</div>
	<!-- manualBody end -->
	
	
