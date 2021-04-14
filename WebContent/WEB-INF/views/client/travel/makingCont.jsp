<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
		<c:if test="${sessionScope.memId==null}">
			<script>
				alert("로그인 후에 이용 가능합니다");
				location.href='/travelMaker/mem/index.tm';
			</script>
		</c:if>
		
		<script>
			function removeCheck(){
				if(confirm("정말 삭제하시겠습니까?")==true){
					document.removefrm.submit();
				}else{
					return false;
				}
			}
		</script>
		
		<form action="makingDel.tm?gNo=${content.gNo}" name="removefrm" method="post"></form>
		<input type="hidden" id="sDate" value="${content.startDate}"/>
		<input type="hidden" id="eDate" value="${content.endDate}"/>
		<input type="hidden" id="cDate" value="${content.closingDate}"/>
		<c:if test="${sessionScope.memId eq 'admin'}">
			<button onclick="window.location='/travelMaker/admin/adminGroupDel.tm?gNo=${content.gNo}'">그룹삭제</button>
		</c:if>
		
		<div class="makingContWrap">
			<div class="titWrap">
				<p class="tit2" data-aos="flip-down" data-aos-duration="600">"${content.subject}"</p>
				<p class="txt" data-aos="flip-down" data-aos-duration="600">여행 사전계획을 자세히 살펴보고 참여신청 할 수 있습니다!</p>
			</div>
			
			<div class="fl">			
				<div class="txtWrap">
					<p class="sub">작성자</p>
					<p class="txt">${content.id}</p>
				</div>
				
				<div class="txtWrap">
					<p class="sub">여행 컨셉</p>
					<p class="txt">${content.concept}</p>
				</div>
				
				<div class="txtWrap">
					<p class="sub">모집 유형</p>
					<p class="txt">
					<c:forEach var="i" items="${posList}">
						${i} /
					</c:forEach>
					</p>
				</div>
				
				<div class="txtWrap">
					<p class="sub">모집 인원</p>
					<p class="txt">현재 ${content.actualNum}명 / 최대 ${content.maxNum}명</p>
				</div>
			</div>
			
			<div class="fl mz">
				<div class="txtWrap">
					<p class="sub">지역</p>
					<p class="txt">${content.loc}</p>
				</div>
				<div class="txtWrap">
					<p class="sub">날짜</p>
					<p class="txt">
					<c:if test="${esGap==0}">
						${content.startDate} (당일치기)
					</c:if>
					<c:if test="${esGap>0}">
						${content.startDate} ~ ${content.endDate}
						(${esGap}박 ${esGap+1}일)
					</c:if>
					</p>
				</div>
				<div class="txtWrap">
					<p class="sub">모집 마감일</p>
					<p class="txt">
					<c:if test="${ctGap==0}">
						${content.closingDate} (오늘 마감)
					</c:if>
					<c:if test="${ctGap>0}">
						${content.closingDate} (D-${ctGap})
					</c:if>
					</p>
				</div>				
				<div class="txtWrap">
					<p class="sub">모집 성별</p>
					<p class="txt">
					<c:if test="${content.dongsung==0}">
						모두 참여 가능
					</c:if>
					<c:if test="${content.dongsung==1}">
						<c:if test="${writerGender==0}">
							남성만
						</c:if>
						<c:if test="${writerGender==1}">
							여성만
						</c:if>
					</c:if>
					</p>
				</div>
			</div>
			
			<p class="line"></p>
			
			<div class="txtWrap">
				<p class="sub">코스 설명</p>
				<p class="txt">${content.courseExpl}</p>
			</div>
			
			<div class="txtWrap">
				<p class="sub">부가 설명</p>
				<p class="txt">${content.addExpl}</p>
			</div>
			
			<div class="txtWrap">
				<p class="sub">예산</p>
				<p class="txt">약 <fmt:formatNumber type="number" maxFractionDigits="3" value="${content.cost}"/>원</p>
			</div>			
		</div>
		
		<div class="btnWrap">			
			<c:if test="${sessionScope.memId!=content.id && content.status==0 && memStatus==-1}">
				<c:if test="${memIdGender==writerGender || content.dongsung==0}">
				<a href="/travelMaker/travel/makingReq.tm?gNo=${content.gNo}"><p class="btn btnY">신청</p></a>
				<a href="/travelMaker/travel/makingList.tm?pageNum=${pageNum}"><p class="btn btnC">뒤로</p></a>
				</c:if>						
				<c:if test="${memIdGender!=writerGender && content.dongsung==1}">
					<c:if test="${memIdGender==0}">
						<p class="txt">남성 회원은 신청할 수 없습니다.</p> 
					</c:if>
					<c:if test="${memIdGender==1}">
						<p class="txt">여성 회원은 신청할 수 없습니다.</p> 
					</c:if>
				</c:if>
			</c:if>
			<c:if test="${sessionScope.memId!=content.id && content.maxNum<=content.actualNum}">
				<p class="txt">모집이 완료되었습니다.</p> 
			</c:if>
			<c:if test="${sessionScope.memId!=content.id && memStatus==0}">
				<p class="txt">이미 신청하셨습니다.</p> 
			</c:if>
			<c:if test="${sessionScope.memId!=content.id && memStatus==1}">
				<p class="txt">이미 참여 중입니다.</p> 
				<a href="/travelMaker/travel/groupSpace.tm?gNo=${content.gNo}"><p class="btn btnY">그룹 공간으로</p></a>
			</c:if>
			<c:if test="${sessionScope.memId!=content.id && memStatus==2}">
				<p class="txt">이미 거절되었습니다.</p> 
			</c:if>
			<c:if test="${sessionScope.memId!=content.id && memStatus==3}">
				<p class="txt">개설자에 의해 강제퇴장된 여행입니다.</p> 
			</c:if>
			<%-- <c:if test="${memId eq 'admin'}"> 
				<input type="button" value="리스트" onclick="window.location='/travelMaker/admin/adminGroup.tm'"/>	
			</c:if>
			<c:if test="${memId ne 'admin'}"> 
				<input type="button" value="리스트" onclick="window.location='/travelMaker/travel/makingList.tm?pageNum=${pageNum}'"/>		
			</c:if> --%>
			<c:if test="${sessionScope.memId==content.id}">
			<a onclick="removeCheck()"><p class="btn btnC">삭제</p></a>
			<!-- <input type="button" value="삭제" onclick="removeCheck()"/> -->											
			</c:if>			
		</div>
		
		
					<%-- <c:if test="${sessionScope.memId!=content.id && content.status==0 && memStatus==-1}">
						<c:if test="${memIdGender==writerGender || content.dongsung==0}">
							<input type="button" value="신청" onclick="window.location='/travelMaker/travel/makingReq.tm?gNo=${content.gNo}'"/>
						</c:if>						
						<c:if test="${memIdGender!=writerGender && content.dongsung==1}">
							<c:if test="${memIdGender==0}">
								남성 회원은 신청할 수 없습니다. 
							</c:if>
							<c:if test="${memIdGender==1}">
								여성 회원은 신청할 수 없습니다. 
							</c:if>
						</c:if>
					</c:if>
					<c:if test="${sessionScope.memId!=content.id && content.maxNum<=content.actualNum}">
						모집이 완료되었습니다. 
					</c:if>
					<c:if test="${sessionScope.memId!=content.id && memStatus==0}">
						이미 신청하셨습니다.
					</c:if>
					<c:if test="${sessionScope.memId!=content.id && memStatus==1}">
						이미 참여 중입니다.
						<input type="button" value="그룹 공간으로" onclick="window.location='/travelMaker/travel/groupSpace.tm?gNo=${content.gNo}'"/>
					</c:if>
					<c:if test="${sessionScope.memId!=content.id && memStatus==2}">
						이미 거절되었습니다.
					</c:if>
					<c:if test="${sessionScope.memId!=content.id && memStatus==3}">
						개설자에 의해 강제퇴장된 여행입니다.
					</c:if>
					<c:if test="${memId eq 'admin'}"> 
						<input type="button" value="리스트" onclick="window.location='/travelMaker/admin/adminGroup.tm'"/>	
					</c:if>
					<c:if test="${memId ne 'admin'}"> 
						<input type="button" value="리스트" onclick="window.location='/travelMaker/travel/makingList.tm?pageNum=${pageNum}'"/>		
					</c:if>			
					<c:if test="${sessionScope.memId==content.id}">
						<input type="button" value="삭제" onclick="removeCheck()"/>											
					</c:if> --%>
					
					
	</div>
	<!-- //wrapAll end -->
	
	<script>
	AOS.init({
		easing: 'ease-in-out-sine'
	});
	</script>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<!-- //footer end -->