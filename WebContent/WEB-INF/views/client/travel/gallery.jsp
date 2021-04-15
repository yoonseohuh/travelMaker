<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
		
		<script>
			$(document).ready(function(){
			/*	재호출을 위한 cache false
				$.ajaxSetup({cache:false});
			*/
				$('.liked').submit(function(event){
					event.preventDefault();
					var data = {};
					$.each($(this).serializeArray(), function(index, i){
						data[i.name] = i.value;
					});
					console.log("좋아요호출");
					$.ajax({
						url: "/travelMaker/travel/galleryLiked.tm",
						cache: false,	//재호출을 위함
						type: "POST",
						dataType: "json",
						contentType: "application/json",
						data: JSON.stringify(data),
						success: function(res){
							console.log(res);
							console.log(data);
							console.log(data.pNo);
						//	console.log(res.pNo);
							var currentLocation = window.location;
							$('.gsGal').load(currentLocation + ' .gsGal');
						}
					});
				});
				$('.likedCancel').submit(function(event){
					event.preventDefault();
					var data = {};
					$.each($(this).serializeArray(), function(index, i){
						data[i.name] = i.value;
					});
					console.log("취소호출");
					$.ajax({
						url: "/travelMaker/travel/galleryLikedCancel.tm",
						cache: false,	//재호출을 위함
						type: "POST",
						dataType: "json",
						contentType: "application/json",
						data: JSON.stringify(data),
						success: function(res){
							var currentLocation = window.location;
							$('.gsGal').load(currentLocation + ' .gsGal');
						}
					});
				});
				
			});
		</script>
		
		<c:if test="${idStatus!=1}">
			<script>
				alert("해당 그룹의 멤버가 아닙니다");
				location.href="/travelMaker/travel/makingList.tm";
			</script>
		</c:if>
		
		<div class="gsWrap">
      
         <div class="chatWrap">
            <div class="btnChat"></div>
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
               <div class="sendChatWrap">
                  <form action="#" id="chatForm" method="post">
                     <input type="hidden" value="${gNo}" name="gNo"/>
                     <input type="hidden" value="${id}" name="writer"/>
                     <input type="text" id="sendChat" name="cont"/>
                     <input type="submit" id="sendChatBtn" value="전송"/>
                  </form>
               </div>
            </div>
            <script>               
               $(".viewChatWrap").scrollTop($(".viewChatWrap")[0].scrollHeight);
               $('.btnChat').click(function(){
                  $(this).toggleClass('on');
                  $('.chat').fadeToggle();
               });
            </script>            
         </div>
         <!-- //chatWrap end -->

         <ul class="gsMenu">
            <li><a href="groupSpace.tm?gNo=${grp.gNo}">그룹홈</a></li>
            <li class="on"><a href="gallery.tm?gNo=${grp.gNo}">갤러리${gNo}</a></li>
         </ul>
        

         <div class="gsCont gsGal">
            <div class="titWrap">
               <p class="tit2" data-aos="fade-right" data-aos-duration="600">여행 후 남는 건 사진,</p>
               <p class="tit2" data-aos="fade-right" data-aos-delay="400" data-aos-duration="600">소중한 추억을 간직해보세요!</p>
            </div>
            <form action="/travelMaker/travel/uploadPro.tm" method="post" enctype="multipart/form-data">
               <input type="hidden" name="writer" value="${sessionScope.memId}"/>
               <input type="hidden" name="gNo" value="${grp.gNo}"/>
               <input type="file" name="img"/>
               <input type="submit" value="업로드" class="btn btnY"/>
            </form>
            <ul class="list">
               <c:if test="${fn:length(finList)==0}">
				<br/>
				<h2>아직 등록된 사진이 없습니다.</h2>
				</c:if>
				<c:if test="${fn:length(finList)>0}">
					<c:forEach items="${finList}" var="list">
						<li>
							<c:if test="${list.isLiked==1}">
								<form class="likedCancel" method="post">
									<input type="hidden" value="${sessionScope.memId}" name="id"/>
									<input type="hidden" value="${list.gNo}" name="gNo"/>
									<input type="hidden" value="${list.pNo}" name="pNo"/>
									<p class="tic1"><span><input type="image" src="../resources/images/heart-colored.png" width="12" alt="좋아요취소"/></span>${list.writer}님의 사진</p>
									<img src="/travelMaker/save/${list.pRoot}" width="500"/>
									<br/>
									<p class="tic1">좋아요 <b class="cnt">${list.likedCnt}</b> 개</p>									
								</form>
							</c:if>					
							<c:if test="${list.isLiked==0}">
								<form class="liked" method="post">
									<input type="hidden" value="${sessionScope.memId}" name="id"/>
									<input type="hidden" value="${list.gNo}" name="gNo"/>
									<input type="hidden" value="${list.pNo}" name="pNo"/>
									<p class="tic1"><span><input type="image" src="../resources/images/heart-empty.png" width="12" alt="좋아요"/></span>${list.writer}님의 사진</p>
									<img src="/travelMaker/save/${list.pRoot}" width="500"/>
									<br/>
									<p class="tic1">좋아요 <b class="cnt">${list.likedCnt}</b> 개</p>									
								</form>
							</c:if>
						</li>
					</c:forEach>
				</c:if>
			</ul>
         </div>
         <!-- //gsGal end -->
		</div>
		<!-- //gsWrap end -->
		
		
		
		<%-- <ul class="gallery">
			<c:if test="${fn:length(finList)==0}">
				<br/>
				<h2>아직 등록된 사진이 없습니다.</h2>
			</c:if>
			<c:if test="${fn:length(finList)>0}">
				<c:forEach items="${finList}" var="list">
					<li>
						<c:if test="${list.isLiked==1}">
							<form class="likedCancel" method="post">
								<input type="hidden" value="${sessionScope.memId}" name="id"/>
								<input type="hidden" value="${list.gNo}" name="gNo"/>
								<input type="hidden" value="${list.pNo}" name="pNo"/>
								${list.writer}님의 사진
								<img src="/travelMaker/save/${list.pRoot}" width="500"/>
								<br/>
								좋아요 <b class="cnt">${list.likedCnt}</b> 개
								<input type="image" src="../resources/images/heart-colored.png" width="12" alt="좋아요취소"/>
							</form>
						</c:if>					
						<c:if test="${list.isLiked==0}">
							<form class="liked" method="post">
								<input type="hidden" value="${sessionScope.memId}" name="id"/>
								<input type="hidden" value="${list.gNo}" name="gNo"/>
								<input type="hidden" value="${list.pNo}" name="pNo"/>
								${list.writer}님의 사진
								<img src="/travelMaker/save/${list.pRoot}" width="500"/>
								<br/>
								좋아요 <b class="cnt">${list.likedCnt}</b> 개
								<input type="image" src="../resources/images/heart-empty.png" width="12" alt="좋아요"/>
							</form>
						</c:if>
					</li>
				</c:forEach>
			</c:if>
		</ul> --%>
		<%-- <button onclick="window.location='/travelMaker/travel/groupSpace.tm?gNo=${grp.gNo}'">그룹 방으로 이동</button> --%>
		
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<!-- //footer end -->