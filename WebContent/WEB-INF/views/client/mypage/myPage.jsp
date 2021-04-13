<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
		
		<script>
			//포지션 선택 함수
			function posDcsn(num,posNo){
				event.preventDefault();
				var data = {
					"num":num,
					"posNo":posNo
				};
				$.ajax({
					url: "/travelMaker/my/posDcsn.tm",
					type: "POST",
					dataType: "json",
					contentType: "application/json",
					data: JSON.stringify(data),
					success: function(res){
						var currentLocation = window.location;
						alert("포지션 선택이 완료되었습니다!");
						$('#posDiv').load(currentLocation + ' #posDiv');
					}
				});
			}
		</script>
		
		<jsp:include page="/WEB-INF/views/include/myMenu.jsp" />
		<!-- myMenu end -->
		
		<c:if test="${sessionScope.memId==null}">
			<script>
				alert("로그인 후에 접근 가능합니다");
				history.go(-1);
			</script>
		</c:if>
		
		<h1>myPage</h1><br/><br/>
		<h2>${id}님 [랭킹 ${ranking}위]</h2>
		
		<!-- 여행 부분 -->
		<div>
			<h2>대기 및 참여 중인 여행</h2>
			<c:forEach var="list" items="${allList}">
				 ${list.gNo} / ${list.startDate}~${list.endDate} / ${list.subject} / ${list.myStatus} / ${list.myPos} <br/>
			</c:forEach>
		</div>
		<!-- 랭크 부분 -->
		<div>
			<h2>랭크 현황</h2>
			<c:forEach var="rk" items="${rkList}" varStatus="status">
				<c:if test="${memInfo.rk==rk.rkNo}">
					NOW: ${rk.rkName}<br/>
					<c:set var="nextVal" value="${rkList[status.count]}"/>
					<!-- 만렙일 때 -->
					<c:if test="${nextVal==null}">
						다음 레벨은 준비 중에 있습니다. ${id}님은 최고의 트래블메이커!<br/>
						<progress max="100" value="100"></progress> ${memInfo.travelCnt}/${rk.rkNeed}
					</c:if>
					<!-- 만렙 아닐 때 -->
					<c:if test="${nextVal!=null}">
						NEXT: ${nextVal.rkName}<br/>
						UNTIL NEXT RANK <progress max="${nextVal.rkNeed}" value="${memInfo.travelCnt}"></progress> ${memInfo.travelCnt}/${nextVal.rkNeed}<br/>
						<c:if test="${rk.rkNo==1}">
							스타터 ▶ 트래블러 설명란
						</c:if>
						<c:if test="${rk.rkNo==2}">
							트래블러 ▶ 어드바이저 설명란
						</c:if>
						<c:if test="${rk.rkNo==3}">
							어드바이저 ▶ 마스터 설명란
						</c:if>
					</c:if>
				</c:if>
			</c:forEach>
		</div>
		
		<!-- 포지션 부분 [posModi:스타터,트래블러,어드바이저 초기 상태 0/어드바이저에서 포지션 정하면 1/마스터에서 포지션 추가하면 2] -->
		<div id="posDiv">
			<h2>포지션 선택</h2>
			<c:if test="${memInfo.rk<3}">
				"어드바이저 이상이 되면 포지션을 정할 수 있습니다!" 대충 이런 메시지 보여주기
			</c:if>
			<c:if test="${memInfo.rk>=3}">
				<!-- 첫번째 포지션 결정 전 -->
				<c:if test="${memInfo.posModi==0}">
					<div>
						<c:forEach var="pos" items="${posList}">
						<ul>
							<li>
							${pos.posName}: "${pos.posExpl}" <input type="button" value="선택" onclick="posDcsn(1,${pos.posNo})"/>
							</li>
						</ul>
						</c:forEach>
					</div>
				</c:if>
				<!-- 첫번째 포지션 결정 후 -->
				<c:if test="${memInfo.posModi==1}">
					YOUR 1st POSITION: ${pos1.posName}<br/>
				</c:if>
			</c:if>
			<c:if test="${memInfo.rk==4}">
				<!-- 두번째 포지션 결정 전 -->
				<c:if test="${memInfo.posModi==1}">
					<div>
						<c:forEach var="pos" items="${posList}">
						<ul>
							<li>
							${pos.posName}: "${pos.posExpl}" <input type="button" value="선택" onclick="posDcsn(2,${pos.posNo})"/>
							</li>
						</ul>
						</c:forEach>
					</div>
				</c:if>
				<!-- 두번째 포지션 결정 후 -->
				<c:if test="${memInfo.posModi==2}">
					YOUR 1st POSITION: ${pos1.posName}<br/>
					YOUR 2nd POSITION: ${pos2.posName}<br/>
				</c:if>
			</c:if>
		</div>
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
   
</body>
</html>