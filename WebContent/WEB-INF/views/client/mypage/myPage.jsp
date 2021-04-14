<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
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
			
			//포지션 목록 토글
			$(document).ready(function(){
		        $('#cont2').hide();
		        $('#cancel').hide();
		        $('#tab1').click(function(){
		    		$('#cont2').show();
		    		$('#cancel').show();
		    		$('#tab1').hide();
		    	});    
		        $('#cancel').click(function(){
		    		$('#cont2').hide();
		    		 $('#cancel').hide();
		    		$('#tab1').show();
		    	});    
		    });
			
			
			  
			  
			  
		</script>
		<c:if test="${sessionScope.memId==null}">
			<script>
				alert("로그인 후에 접근 가능합니다");
				location.href='/travelMaker/mem/loginForm.tm';
			</script>
		</c:if>
		<div class="myContainer">
            <div class="myBg">
                <div class="topCont">
                    <p class="tit">MYPAGE HOME</p>
                    <p class="sub">${id}님의 마이페이지 홈입니다. <br/>
                       	 나의 여행관련 정보를 확인해보세요!
                    </p>
                </div>
            </div>
        </div>
        <!--myContainer end-->
		<jsp:include page="/WEB-INF/views/include/myMenu.jsp" />
		<!-- myMenu end -->
		<!-- 여행 리스트 -->
		<div class="myPageWrap">
			
			<div class="travelList">
			
				<c:if test="${!empty allList}">
					<p class="HomeSubTit">참여중인 여행</p>
        			<p class="HomeSubCont">현재 참여중인 여행, 신청 대기중인 여행의 정보를 확인하세요.<br/>그룹 공간에서 팀원과 일정을 같이 만들어보세요.</p>
				</c:if>
				<c:if test="${empty allList}">
					<p class="HomeSubTit">참여중인 여행</p>
        			<p class="HomeSubCont">현재 참여중인 여행이 없습니다.</p>
				</c:if>
				<c:forEach var="list" items="${allList}">
				<ul>
					<li>
						<c:if test="${list.myStatus eq '대기중'}">
						<a href="/travelMaker/travel/makingCont.tm?gNo=${list.gNo}">
							<div>
								<p class="date">${list.startDate}~${list.endDate}</p>
								<p class="title">${list.subject}</p>
								<p>${list.myStatus}</p>
								<p class="position">${list.myPos}</p>
							</div>
						</a>
						</c:if>
						<c:if test="${list.myStatus eq '참여중'}">						
						<a href="/travelMaker/travel/groupSpace.tm?gNo=${list.gNo}">
							<div>
								<p class="date">${list.startDate}~${list.endDate}</p>
								<p class="title">${list.subject}</p>
								<p>${list.myStatus}</p>
								<p class="position">${list.myPos}</p>
							</div>
						</a>
						</c:if>
					</li>
	            </ul>
				</c:forEach>
			</div>
			<!--travelList End-->
			<p class="HomeSubTit">나의 랭크/포지션</p>
            <p class="HomeSubCont">현재 랭크에서 할 수 있는 활동을 확인하세요. 남은 여행 횟수를 채워 다음 랭크에 도전해보세요!<br/>
             	   나의 포지션을 선택하고 전문 가이드가 되어보세요  
            </p>
			
			<!-- 랭크 부분 -->
			<div class="rpinner">
                <div class="rank">
                    <h2>RANK</h2>
                    <div class="rankCont">
                   		<c:forEach var="rk" items="${rkList}" varStatus="status">
							<c:if test="${memInfo.rk==rk.rkNo}">
							<div class="barArea">
								<p>${rk.rkName}<p/>
								<div class="bar">
									<c:set var="nextVal" value="${rkList[status.count]}"/>
									<!-- 만렙일 때 -->
									<c:if test="${nextVal==null}">
										<progress max="100" value="100"></progress>
										<span>${memInfo.travelCnt}/${rk.rkNeed}</span>
									</c:if>
									<!-- 만렙 아닐 때 -->
									<c:if test="${nextVal!=null}">
										<progress max="${nextVal.rkNeed}" value="${memInfo.travelCnt}"></progress> 
										<span>${memInfo.travelCnt}/${nextVal.rkNeed}</span>
									</c:if>
								</div>
								<!-- bar End -->
			                    </div>
                       		<!-- bar Area -->
                       		<div class="auth">
	                        	<c:if test="${rk.rkNo == 1}">
	                        		<p>1인 여행 개설 가능</p>
	                            	<p>생성된 모험에 참여 가능</p>
	                        	</c:if>
	                        	<c:if test="${rk.rkNo == 2}">
	                        		<p>그룹 여행 개설 가능</p>
	                        	</c:if>
	                        	<c:if test="${rk.rkNo == 3}">
	                        		<p>첫 번째 포지션 선택 가능</p>
	                        	</c:if>
	                        	<c:if test="${rk.rkNo == 4}">
	                            	<p>두 번째 포지션 선택 가능</p>
	                        	</c:if>
	                        </div>
	                        <!-- auth End -->
							</c:if>
						</c:forEach>
                   </div>
                   <!-- rankCount --> 
                </div>
                <!-- rankEnd -->
                
                <div class="position">
                	<!-- 포지션 부분 [posModi:스타터,트래블러,어드바이저 초기 상태 0/어드바이저에서 포지션 정하면 1/마스터에서 포지션 추가하면 2] -->
                	<h2>POSITION</h2>
					<div id="posDiv">
						<c:if test="${memInfo.rk<3}">
							<p class="xPos">어드바이저 이상이 되면 포지션을 정할 수 있습니다!</p>
						</c:if>
						<c:if test="${memInfo.rk>=3}">
							<!-- 첫번째 포지션 결정 전 -->
							<c:if test="${memInfo.posModi==0}">
								<div>
									<ul class="posList">
				                        <li>
				                            <strong>당신의 첫 번째 포지션을 선택해주세요!</strong>
				                 			<a style="cursor:pointer" id="tab1">첫 번째 포지션 선택</a> <a style="cursor:pointer" id="cancel">접기</a> 
				                        </li>
				                    </ul>
				        
				                    <div id="cont2">
									<c:forEach var="pos" items="${posList}">
									<ul>
										<li>
											${pos.posName}:"${pos.posExpl}" <input type="button" value="선택" onclick="posDcsn(1,${pos.posNo})"/>
										</li>
									</ul>
									</c:forEach>
									</div>
									
								</div>
							</c:if>
							<!-- 첫번째 포지션 결정 후 -->
							<c:if test="${memInfo.posModi==1}">
								 <ul class="posList">
			                        <li>
			                            <strong>Your 1st Position - ${pos1.posName}</strong>
			                            <span>${pos1.posExpl}</span>
			                        </li>
			                    </ul>
							</c:if>
						</c:if>
						<c:if test="${memInfo.rk==4}">
							<!-- 두번째 포지션 결정 전 -->
							<c:if test="${memInfo.posModi==1}">
								<div>
									<ul class="posList">
				                        <li>
				                            <strong>당신의 두 번째 포지션을 선택해주세요!</strong>
				                            <a style="cursor:pointer" id="tab1">포지션 선택</a> <a style="cursor:pointer" id="cancel">접기</a>
				                        </li>
				                    </ul>
				                    <div id="cont2">
										<c:forEach var="pos" items="${posList}">
										<ul>
											<li>
											${pos.posName}: "${pos.posExpl}" <input type="button" value="선택" onclick="posDcsn(2,${pos.posNo})"/>
											</li>
										</ul>
										</c:forEach>
									</div>
								</div>
							</c:if>
							<!-- 두번째 포지션 결정 후 -->
							<c:if test="${memInfo.posModi==2}">
		                    <ul class="posList">
		                        <li>
		                            <strong>Your 1st Position - ${pos1.posName}</strong>
		                            <span>${pos1.posExpl}</span>
		                        </li>
		                        <li>
		                            <strong>Your 2nd Position - ${pos2.posName}</strong>
		                            <span>${pos2.posExpl}</span>
		                        </li>
		                    </ul>
							</c:if>
						</c:if>
					</div>
					<!-- posDiv End -->
                    
                </div>
                <!-- position end -->
			
			
		</div>
		<!-- rpinner end -->
	</div>
	<!-- mypageWrap End -->
	<%-- 윤서코드
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
			--%>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
   
</body>
</html>