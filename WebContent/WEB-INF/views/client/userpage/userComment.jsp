<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
		<c:import url="/WEB-INF/views/include/userMenu.jsp">
			<c:param name="userId" value="${userId}"></c:param>
		</c:import>
		<!-- userMenu end -->
		
		<c:if test="${sessionScope.memId==null}">
			<script>
				alert("로그인 후에 접근 가능합니다");
				location.href='/travelMaker/mem/loginForm.tm';
			</script>
		</c:if>
		
		<script>
	      $(document).ready(function(){
	           $(".posA").click(function(){      //클래스가 menu의 아랫놈인 a를 클릭하면
	        	   console.log('hi');
	               var submenu = $(this).next("ul");      //a 다음에있는 "ul을 submenu에 담고 
	    
	               if( submenu.is(":visible") ){     // ul display: none 아닐떄         -->display: none false 를 반환 한다.
	                   submenu.slideUp();         //ul이 슬라이드업
	               }else{                  // display: none이면 
	                   submenu.slideDown();   //ul부분 슬라이드다운
	               }
	           });
	           $('#cont2').hide();
	           $('#tab1').click(function(){
	             $('#cont2').hide();
	             $('#cont1').fadeIn();
	          });
	          $('#tab2').click(function(){
	             $('#cont1').hide();
	             $('#cont2').fadeIn();
	          });
	       });
		</script>
		
		<h1>${userId}님이 주고 받은 코멘트</h1>
		
		
		<div class="commentContent">
		
			<div id="cont1"><!-- 토글때문에 존재.. -->
				<c:if test="${count == 0}">
					<p>${userId}님이 떠난여행이 없네요..</p>
					
				</c:if>
				<c:if test="${count >0}">
					<c:if test="${empty cmtMyGroup}">
						여행은 있는디 코멘트 쓰루 있는 여행없을떄
					</c:if>
				<c:if test="${!empty cmtMyGroup}">
					<p class="com">동행자들이 ${userId}님에게 보낸 코멘트</p>
			 			<c:forEach var="cmtMyGroup" items="${cmtMyGroup}">
							<!-- 작성된 코멘트 있을때만 아래 목록이랑 코멘트 뜬다 -->			 			
				 			<c:forEach var="comRecUserCnt" items="${comRecUserCnt}">
							<c:if test="${(comRecUserCnt.key == cmtMyGroup.gNo) && (comRecUserCnt.value != 0)}">
					 			<div class="menu comBox">
					 				<dl>
				                        <dt>
				                            <strong>${cmtMyGroup.subject}</strong>
				                        </dt>
				                        <dd>
				                            <p>${cmtMyGroup.startDate} ~ ${cmtMyGroup.endDate} </p><a class="posA">확인</a>
											<ul style="display: none;">
												<c:forEach var="comRecUser" items="${comRecUser}">
													 <c:if test="${cmtMyGroup.gNo == comRecUser.gNo}">
														<li><textarea rows="2" cols="72" name="comment"> ${comRecUser.cCont} </textarea> <br/>보낸사람: ${comRecUser.sender} / 받은날짜 ${comRecUser.reg}</br></br></li>&nbsp; 
													</c:if>
												</c:forEach>
											</ul>
										</dd>
				                    </dl>
								</div>
								<!-- menu comBox End -->
							</c:if>
							</c:forEach>
						</c:forEach>
						
						<p class="com send">${userId}님이 동행자들에게 보낸 코멘트</p>
							<c:forEach var="cmtMyGroup" items="${cmtMyGroup}">
								<c:forEach var="comSenUserCnt" items="${comSenUserCnt}">
								<c:if test="${(comSenUserCnt.key == cmtMyGroup.gNo) && (comSenUserCnt.value != 0)}">
									<div class="menu comBox">
										<dl>
					                        <dt>
					                            <strong>${cmtMyGroup.subject}</strong>
					                        </dt>
					                        <dd>
					                            <p>${cmtMyGroup.startDate} ~ ${cmtMyGroup.endDate} </p><a class="posA">확인</a>
												<ul style="display: none;">
													<c:forEach var="comSenUser" items="${comSenUser}">
														 <c:if test="${cmtMyGroup.gNo == comSenUser.gNo}">
															<li><textarea rows="2" cols="72" name="comment" > ${comSenUser.cCont} </textarea> <br/>보낸사람: ${comSenUser.sender} / 받은날짜 ${comSenUser.reg}</br></br></li>&nbsp; 
														</c:if>
													</c:forEach>
												</ul>
											</dd>
					                    </dl>
									</div>
									<!-- menu comBox -->
								</c:if>
								</c:forEach>
							</c:forEach>
					</c:if>
				</c:if>   
			</div>
		</div>
			
		

		
		
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
   
</body>
</html>