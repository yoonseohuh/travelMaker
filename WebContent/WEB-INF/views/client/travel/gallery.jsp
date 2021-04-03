<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
							$('.gallery').load(currentLocation + ' .gallery');
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
							$('.gallery').load(currentLocation + ' .gallery');
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
		
		<h1>${grp.subject} 그룹 갤러리</h1>
		
		<ul class="gallery">
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
							좋아요 <b>${list.likedCnt}</b> 개
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
							좋아요 <b>${list.likedCnt}</b> 개
							<input type="image" src="../resources/images/heart-empty.png" width="12" alt="좋아요"/>
						</form>
					</c:if>
				</li>
			</c:forEach>
		</ul>
		
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<!-- //footer end -->