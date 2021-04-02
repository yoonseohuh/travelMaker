<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
	
		<script>
			$(document).ready(function(){
				$('.liked').submit(function(event){
					event.preventDefault();
					var data = {};
					$.each($(this).serializeArray(), function(index, i){
						data[i.name] = i.value;
					});
					$.ajax({
						url: "/travelMaker/travel/galleryLiked.tm",
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
				
				$("#favorite").click(function(){
					$.post(
							"/favorite"
							, {"articleId" : "${article.articleId}"}	
							, function(data){
								var jsonData3 = {};
								try {
									jsonData3 = JSON.parse(data);
								}catch(e) {
									jsonData3.result = false;
								}
								console.log(jsonData3);
								
								if ( jsonData3.result ){
									var text = $("#favorite").text();
									if (jsonData3.isFavorite){
										$("#favorite").text("♥");
									}
									else if (text == "♥"){
											$("#favorite").text("♡");
									} 
								}
								else {
									/* alert("세션이 만료되었습니다. 다시 로그인해주세요.");
									location.href = "/"; */
								}
							}
					);
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
					<form action="#" class="liked" method="post">
						<input type="hidden" value="${sessionScope.memId}" name="id"/>
						<input type="hidden" value="${list.gNo}" name="gNo"/>
						<input type="hidden" value="${list.pNo}" name="pNo"/>
						${list.writer}님의 사진
						<img src="/travelMaker/save/${list.pRoot}" width="500"/>
						<br/>
						좋아요 <b>${list.likedCnt}</b> 개
						<input type="submit" value="좋아요"/>
					</form>
					<c:if test="${list.isLiked==1}">
						<span id="favorite" style="color:red;">♥</span>
					</c:if>
					<c:if test="${list.isLiked==0}">
						<span id="favorite" style="color:red;">♡</span>
					</c:if>
				</li>
			</c:forEach>
		</ul>
	
	
	
	
	
	
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<!-- //footer end -->