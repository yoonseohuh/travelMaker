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
				$('#accepted').submit(function(event){
					event.preventDefault();
					var data = {};
					$.each($(this).serializeArray(), function(index, i){
						data[i.name] = i.value;
					});
					$.ajax({
						url: "/travelMaker/travel/accepted.tm",
						type: "POST",
						dataType: "json",
						contentType: "application/json",
						data: JSON.stringify(data),
						success: function(res){
							$('#ingMem').append(res);
						}
					});
				});
				$('#rejected').submit(function(event){
					event.preventDefault();
					var data = {};
					$.each($(this).serializeArray(), function(index, i){
						data[i.name] = i.value;
					});
					$.ajax({
						url: "/travelMaker/travel/rejected.tm",
						type: "POST",
						dataType: "json",
						contentType: "application/json",
						data: JSON.stringify(data),
						success: function(res){
							console.log(res);
							
						}
					});
				});
			});
			</script>
			<!-- //accept logic end -->		
			
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
										<c:if test="${req.posNo!=-1}">${req.posNo}</c:if>
									</td>
									<td>
										${req.reqTxt}
									</td>
									<td>
										<form action="#" id="accepted" method="post">
											<input type="hidden" name="requestId" value="${req.id}"/>
											<input type="hidden" name="gNo" value="${req.gNo}"/>
											<input type="submit" value="수락"/>
										</form>
										<form action="#" id="rejected" method="post">
											<input type="hidden" name="requestId" value="${req.id}"/>
											<input type="hidden" name="gNo" value="${req.gNo}"/>
											<input type="submit" value="거절"/>
										</form>
									</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</c:if>
				
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
							<p>${posMem.key} : ${posMem.value}명</p>
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
								<input type="submit" name="수정" />
								<!--  <button onclick="window.location='scheduleModi.tm?gNo=${gNo}&sNo=${list.sNo}&sDate=${list.sDate}&sCont=${list.sCont}'">수정</button> -->
								<input type="button" value="삭제" onclick="window.location='/travelMaker/travel/scheduleDel.tm?gNo=${gNo}&sNo=${list.sNo}'" />
								
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
						<ul class="viewChatWrap">
							<li>hi1</li>
							<li>hi2</li>
							<li>hi3</li>
							<li class="mine">hi4</li>
							<li>hi5</li>
							<li>hi1</li>
							<li>hi2</li>
							<li>hi3</li>
							<li class="mine">hi4</li>
							<li>hi5</li>
						</ul>
						<script>
						$(".viewChatWrap").scrollTop($(".viewChatWrap")[0].scrollHeight);							
						</script>
						<div class="sendChatWrap">								
							<form action="" method="get">
								<input type="text" id="sendChat" />
								<input type="submit" id="sendChatBtn" value="전송" />
							</form>
						</div>
					</div>
					<!-- //chat end -->
				</div>
				<!-- //groupCont3 end -->
				
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