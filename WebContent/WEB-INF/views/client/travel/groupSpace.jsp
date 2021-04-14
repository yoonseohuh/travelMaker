<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll" style="background: #ccc; position: relative;">
		
		<div class="gsLeft">
			<script>
			$(document).ready(function(){	
				$('.accepted').submit(function(event){
					event.preventDefault();
					var data = {};
					$.each($(this).serializeArray(), function(index, i){
						data[i.name] = i.value;
					});
					$.ajax({
						url: "/travelMaker/travel/accepted.tm",
						type: "POST",
						dataType: "json",
						cache: false,
						contentType: "application/json",
						data: JSON.stringify(data),
						success: function(res){
							var currentLocation = window.location;
							var result = JSON.parse(res);
							if(result==true){
								alert("수락이 완료되었습니다");
								$('#applicants').load(currentLocation + ' #applicants');	//신청자 목록 load
								$('#ingMem').load(currentLocation + ' #ingMem');			//참여 중인 멤버 목록 load
								$('#ingPos').load(currentLocation + ' #ingPos');			//참여 중인 포지션 목록 load								
							}
							if(result==false){
								alert("모집 마감! 더 이상 멤버를 받을 수 없습니다");								
								$('#applicants').load(currentLocation + ' #applicants');
							}
						}
					});
				});
				$('.rejected').submit(function(event){
					event.preventDefault();
					var data = {};
					$.each($(this).serializeArray(), function(index, i){
						data[i.name] = i.value;
					});
					$.ajax({
						url: "/travelMaker/travel/rejected.tm",
						type: "POST",
						dataType: "json",
						cache: false,
						contentType: "application/json",
						data: JSON.stringify(data),
						success: function(res){
							var currentLocation = window.location;
							alert("거절이 완료되었습니다");
							$('#applicants').load(currentLocation + ' #applicants');	//신청자 목록 load
						}
					});
				});
				//채팅 입력
				$('#chatForm').submit(function(event){
					event.preventDefault();
					var data = {};
					$.each($(this).serializeArray(), function(index, i){
						data[i.name] = i.value;
					});
					$.ajax({
						url: "/travelMaker/travel/sendChat.tm",
						type: "POST",
						dataType: "json",
						contentType: "application/json",
						data: JSON.stringify(data),
						success: function(res){
							console.log(res);
							$('#sendChat').val("");
						}
					});
				});
				
				var gn = $('#gNo').val();
				console.log(gn);
				
				setInterval(getChatLists, 10000);
				
				function getChatLists(){
					var currentLocation = window.location;
					$('#viewChatWrap').load(currentLocation + ' #viewChatWrap');			
				}
				$(".viewChatWrap").scrollTop($(".viewChatWrap")[0].scrollHeight);
				
			/*	https://songjihyeon.tistory.com/21	
				0.3초 간격으로 현재 시간과 DB에 저장된 채팅 글을 체크하는 함수 호출. 새로운 채팅 글이 입력될 때만 readAjax함수를 호출.
				var gn = $('#gNo').val();
				console.log(gn);
				
				setInterval(function(){
					$.ajax({
						url: "/travelMaker/travel/lastDate.tm",
						cache: false,
						async: false,
						data: {gNo: gn},
						success: function(res){
							if(lastDateTime < res){
								readAjax(lastDateTime);
								lastDateTime = res;
							}else{
								lastDateTime = res;
							}
						}
					});
				},100);
				
				function readAjax(compareTime){
					$.ajax({
						method: "POST",
						url: "/travelMaker/travel/read.tm",
						dataType: "json",
						cache: false,
						async: false,
						data: {
							"lastDate": compareTime
						},
						success: function(data){
							if(data.length==0){
								return;
							}else{
								$.each(data, function(index, entry){
									//채팅창 div에 맞게 글을 뿌려주자
									$('.viewChatWrap').append(res);
									$(".viewChatWrap").scrollTop($(".viewChatWrap")[0].scrollHeight);	//스크롤바 맨 밑으로 유지
								});
							}
						}
					});
				}					*/
				
				
			});		//document.ready end
			
			//여행 상태 변경 함수
			function changeStatus(gNo, status){
				event.preventDefault();
				var data = {
					"gNo":gNo,
					"status":status
				};
				$.ajax({
					url: "/travelMaker/travel/changeStatus.tm",
					type: "POST",
					dataType: "json",
					contentType: "application/json",
					data: JSON.stringify(data),
					success: function(res){
						console.log(res);	//{"gNo":50,"status":1}과 같이 들어옴
						var currentLocation = window.location;
						alert("여행 상태가 성공적으로 변경되었습니다!");
						$('#statusForLeader').load(currentLocation + ' #statusForLeader');	//여행상태 부분 load
					}
				});
			}	//changeStatus end
			
			//총평버튼
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
			//총평유효성 검사 
			function check(){
				var inputs = document.reply;
				if(!inputs.genReview.value){
					alert("내용을 입력해주세요.");
					return false;
				}else if(!input.genReply.value){
					alert("내용을 입력해주세요.");
					return false;
				}
			}
			</script>
			<!-- //accept logic end -->		
			
			<input type="hidden" id="gNo" value="${gNo}"/>
			<p class="tit1">${grpSpace.subject}의 그룹 방입니다.</p>
			
			<c:if test="${idStatus!=1}">
				<script>
					alert("해당 그룹의 멤버가 아닙니다");
					location.href="/travelMaker/travel/makingList.tm";
				</script>
			</c:if>
			
			<c:if test="${idStatus==1}">
				
				<c:if test="${id==leader}">
					<p class="tit2">새로 들어온 신청</p>
					<c:if test="${fn:length(awaiters)==0}">
						신청자가 없습니다.
					</c:if>
					<c:if test="${fn:length(awaiters)>0}">
						<table id="applicants">
							<tr>
								<th>아이디</th>
								<th>신청유형</th>
								<th>신청포지션</th>
								<th>한마디</th>
								<th>수락/거절</th>
							</tr>
							<c:forEach var="req" items="${awaiters}">
								<tr>
									<td>${req.id}</td>
									<td>
										<c:if test="${req.reqType==0}">일반</c:if>
										<c:if test="${req.reqType==1}">가이드</c:if>
									</td>
									<td>
										<c:if test="${req.posNo!=-1}">
											<c:forEach var="posName" items="${posName}">
												<c:if test="${posName.posNo == req.posNo}">
													${posName.posName}
												</c:if>
											</c:forEach>
										</c:if>
										<c:if test="${req.posNo == -1}">
											-
										</c:if>
									</td>
									<td>
										${req.reqTxt}
									</td>
									<td>
										<form class="accepted" method="post">
											<input type="hidden" name="requestId" value="${req.id}"/>
											<input type="hidden" name="gNo" value="${req.gNo}"/>
											<input type="submit" value="수락"/>
										</form>
										<form class="rejected" method="post">
											<input type="hidden" name="requestId" value="${req.id}"/>
											<input type="hidden" name="gNo" value="${req.gNo}"/>
											<input type="submit" value="거절"/>
										</form>
									</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
					
					<p class="tit2">개설자 권한(임시 위치)</p>
					<div id="statusForLeader">
					
						<c:if test="${grpSpace.status==0}">
							멤버를 모집 중입니다. 멤버가 충분히 모였다면 모집 마감을 할 수 있습니다.
							<!-- status==1로 바꾸어 모집 완료 처리 -->
							<input type="button" class="comBtn" value="모집마감" onclick="changeStatus(${gNo},1)"/>
						</c:if>
						<c:if test="${grpSpace.status==1}">
							<!-- status==2로 바꾸어 여행 시작 처리 -->
							모집이 완료되어 여행을 떠나기 전입니다. 여행을 시작할까요?							
							<input type="button" class="comBtn" value="여행시작" onclick="changeStatus(${gNo},2)"/>
						</c:if>
						<c:if test="${grpSpace.status==2}">
							여행 중이시네요! 이것은 시연을 위한 여행 종료 처리 버튼입니다.
							<input type="button" class="comBtn" value="여행종료" onclick="changeStatus(${gNo},3)"/>
							<!-- 종료일과 현재 시간 비교해서 status==3으로 바꾸어 여행 끝 처리 -->
						</c:if>
						<c:if test="${grpSpace.status==3}">
							<!-- 총평 작성하고 여행 공개여부 다 처리하면 status==4로 바꾸기 -->
							<div class="genSharedDiv">
								<c:if test="${grpSpace.status==3}">
									<c:if test="${memId == grpSpace.id}">
										<c:if test="${empty grpSpace.genReview}">
											 ${grpSpace.id}님 ! 여행이 끝났습니다! 총평을 작성하고, 여행의 공개 여부를 지정해보세요.
										 	<button id="tab1">총평작성</button>
										 	<form action="/travelMaker/travel/genReviewPro.tm" id="cont2" name="reply" onsubmit="return check()" method="get">
										 		<input type="hidden" name="id" value="${grpSpace.id}" />
										 		<input type="hidden" name="gNo" value="${grpSpace.gNo}" />
										 		<input type="hidden" name="from" value="groupspace" />
										 		
												<textarea cols="100" rows="10" name="genReview" placeholder="개설자 ${grpSpace.id}님의 여행총평을 남겨주세요!" ></textarea>
												<input type="submit" value="작성" />
											</form>
											<input type="button" value="취소" id="cancel" />
										</c:if>
										<c:if test="${!empty grpSpace.genReview}">
											개설자의 총평 : ${grpSpace.genReview}
											<c:if test="${grpSpace.shared == 0}">   <!-- 그룹스페이스 쉐어드가 0이면 공개여부 보여줌 -->
												<form action="/travelMaker/travel/groupSpace.tm" name="openOrbOpen" method="get">
													<input type="hidden" name="gNo" value="${grpSpace.gNo}" />
													
													<br/> 공개여부 : 
													<input type="radio" name="shared" value="1" />공개
													<input type="radio" name="shared" value="2" />비공개
													<input type="submit" value="확인">
												</form>
											</c:if>
										</c:if>
										<c:if test="${grpSpace.shared!=0}">
											<c:if test="${grpSpace.shared == 1}">
												<br/>공개여부 : 공개 
											</c:if>
											<c:if test="${grpSpace.shared ==2}">
												<br/>공개여부 : 비공개 
											</c:if>
										</c:if>
									</c:if>	
								</c:if>
							</div>
							
						</c:if>
					</div>
					
					
					
				</c:if>
				<!-- if: leader end -->
				
				<ul class="groupCont1">
					<li>
						<p class="tit2">참여 중인 멤버</p>
						<div id="ingMem">
							<h3>개설자 ${leader}님</h3><br/>
							<c:if test="${fn:length(grpMem)>0}">
								<c:forEach var="mem" items="${grpMem}">
									<c:if test="${mem.status==1}">
										<p>
											${mem.id}님
											<c:if test="${mem.id!=id}">
												<input type="button" onclick="window.location='/travelMaker/msg/messageWrite.tm?receiver=${mem.id}&sender=${id}'" value="쪽지쓰기"/>
											</c:if>
										</p>
									</c:if>			
								</c:forEach>
							</c:if>
						</div>
						<!-- //ingMem end -->
					</li>
									
					<li>
						<p class="tit2">모집 현황</p>
						<div id="ingPos">
						<c:forEach var="posMem" items="${posMem}">
						<c:if test="${posMem != null}">
							<p>${posMem.key} : ${posMem.value}명</p>
						</c:if>
						<c:if test="${posMem == null}">
							<p>냉무</p>
						</c:if>
						</c:forEach>
						</div>
						<!-- //ingPos end -->
					</li>
					<li>
						<p class="tit2">새로 들어온 신청</p>
						<div id="ingNew">
							<p>pos1</p>
							<p>pos2</p>
							<p>pos3</p>
							<p>pos4</p>
						</div>
						<!-- //ingNew end -->
					</li>
				</ul>
				<!-- //groupCont1 end -->
				
				<ul class="groupCont2">
					<li>
						<p class="tit2">일정</p>
						<div id="ingPlan">
							<c:forEach var="list" items="${scheList}">
							<form action="scheduleModi.tm?gNo=${gNo}&sNo=${list.sNo}&sDate=${list.sDate}&sCont=${list.sCont}" method="get">
								<input type="hidden" name="gNo" value="${list.gNo}"/>
								<input type="hidden" name="sNo" value="${list.sNo}"/>
								날짜 <input type="text" name="sDate" value="${list.sDate}"/>
								일정 <input type="text" name="sCont" value="${list.sCont}"/>
								<c:if test="${id==leader}">
								<input type="submit" value="수정"/>
								<input type="button" value="삭제" onclick="window.location='/travelMaker/travel/scheduleDel.tm?gNo=${gNo}&sNo=${list.sNo}'" />
								</c:if>
								<br/>
							</form>
							</c:forEach>
							<c:if test="${id==leader}">
								<form action="schedulePro.tm">
									<input type="hidden" name="gNo" value="${gNo}"/>
									<select name="sDate">
										<c:forEach var="i" items="${dateList}">
												<option value="${i}">${i}</option>
										</c:forEach>
									</select>
									<input type="text" name="sCont"/>
									<input type="submit" value="작성"/>
								</form>
							</c:if>
						</div>
						<!-- //plan end -->
					</li>
					<li>
						<p class="tit2">예산</p>
						<p id="ingCost"><fmt:formatNumber type="number" maxFractionDigits="3" value="${grpSpace.cost}"/>원</p>
						<!-- //cost end -->
					</li>
					<li>
						<p class="tit2">날짜 관련(임시로 이 위치에)</p>
						시작일 ${grpSpace.startDate} /
						종료일 ${grpSpace.endDate}
						<input type="hidden" value="${eDate}" id="eDate"/>					
					</li>
				</ul>
				<!-- //groupCont2 end -->
				
				<div class="groupCont3">
					<p class="tit2">채팅</p>
					<div class="chat">
						<ul id="viewChatWrap" class="viewChatWrap">
							<c:if test="${fn:length(chatList)==0}">
								아직 작성된 채팅이 없습니다.
							</c:if>
							<c:forEach var="chatList" items="${chatList}">
								<c:if test="${chatList.writer==id}">
									<li class="mine">
										${chatList.cont} (<fmt:formatDate value="${chatList.reg}" type="both" dateStyle="short" timeStyle="short"/>)
									</li>						
								</c:if>
								<c:if test="${chatList.writer!=id}">
									<li>
										${chatList.writer}님: ${chatList.cont} (<fmt:formatDate value="${chatList.reg}" type="both" dateStyle="short" timeStyle="short"/>)
									</li>						
								</c:if>
							</c:forEach>
						</ul>
						<script>
						$(".viewChatWrap").scrollTop($(".viewChatWrap")[0].scrollHeight);							
						</script>
						<div class="sendChatWrap">								
							<form action="#" id="chatForm" method="post">
								<input type="hidden" value="${gNo}" name="gNo"/>
								<input type="hidden" value="${id}" name="writer"/>
								<input type="text" id="sendChat" name="cont"/>
								<input type="submit" id="sendChatBtn" value="전송"/>
							</form>
						</div>
					</div>
					<!-- //chat end -->
				</div>
				<!-- //groupCont3 end -->
				
				
				<!-- 어디에다 놓아야할지.... -->
				
				
				<div>
					<c:if test="${memId != grpSpace.id}">
						<c:if test="${empty grpSpace.genReview}">
							개설자의 총평이 아직 작성되지 않았습니다.
						</c:if>
						<c:if test="${!empty grpSpace.genReview}">
							 ${grpSpace.genReview} 
							<c:forEach var="reviewList" items="${reviewList}">
										<br/>└ ${reviewList.nickname}님 :  ${reviewList.genReply}
							</c:forEach>
							<c:if test="${result == 1 }">
								<br/><button id="tab1">답글달기</button>
							</c:if>
						</c:if>	
						 	<form action="/travelMaker/travel/genReplyPro.tm" id="cont2" name="reply" method="get">
						 		<input type="hidden" name="id" value="${memId}" />
						 		<input type="hidden" name="gNo" value="${grpSpace.gNo}" />
						 		<input type="hidden" name="from" value="groupspace" />
						 		
								<textarea cols="100" rows="10" name="genReply" onsubmit="return check()" placeholder="총평에 댓글로 소감을 남겨주세요!" ></textarea>
								<input type="submit" value="답글작성" />
							</form>
							<input type="button" value="취소" id="cancel"/>
					</c:if>					
				</div>
				
				
			</c:if>
		</div>
		<!-- //gsLeft end -->
		
		<div class="gsRight">
			<div class="swiper-container gsGallery">
			<input type="button" value="갤러리로 이동" onclick="window.location='/travelMaker/travel/gallery.tm?gNo=${gNo}'"/>
				<div class="swiper-wrapper">
					<div class="swiper-slide add">
						<form action="/travelMaker/travel/uploadPro.tm" method="post" enctype="multipart/form-data">
							<input type="hidden" name="writer" value="${id}"/>
							<input type="hidden" name="gNo" value="${gNo}"/>
							<input type="file" name="img"/>
							<input type="submit" value="업로드"/>
						</form>
					</div>
					<c:forEach var="gList" items="${gList}">
					<div class="swiper-slide">
						<img src="/travelMaker/save/${gList.pRoot}" width="200"/>
					</div>
					</c:forEach>
					<div class="swiper-slide">Slide 1</div>
					<div class="swiper-slide">Slide 2</div>
					<div class="swiper-slide">Slide 3</div>
					<div class="swiper-slide">Slide 4</div>
					<div class="swiper-slide">Slide 5</div>
					<div class="swiper-slide">Slide 6</div>
					<div class="swiper-slide">Slide 7</div>
					<div class="swiper-slide">Slide 8</div>
					<div class="swiper-slide">Slide 9</div>
				</div>
				<!-- Add Pagination -->
				<div class="swiper-pagination"></div>
			</div>
			<!-- Initialize Swiper -->
			<script>
			$('.gsRight').height($('.gsLeft').outerHeight());
			
			var swiper = new Swiper('.swiper-container', {
				/* freeMode: true, */
				direction: 'vertical',
				pagination: {
			        el: '.swiper-pagination',
			        type: 'progressbar',
			    },
				mousewheel: true,
				slidesPerView: 4.2,
				spaceBetween: 20,
			});
			</script>
		</div>
		<!-- //gsRight end -->
		
	</div>
	<!-- //wrapAll end -->	
	
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
<!-- //footer end -->