<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />

<jsp:include page="/WEB-INF/views/include/top.jsp" />
<!-- //top end -->

<jsp:include page="/WEB-INF/views/include/myMenu.jsp" />
<!-- myMenu end -->
<div class="myPageWrap" id="transcroller-body">

	<c:if test="${sessionScope.memId==null}">
		<script>
			alert("로그인 후에 접근 가능합니다");
			location.href='/travelMaker/mem/loginForm.tm';
		</script>
	</c:if>

	<h2 class="pageTit" data-aos="fade-right" data-aos-duration="600">${id}님의 여행이력입니다 <br/> 다녀온 여행들을 확인해보세요 </h2>
	<c:if test="${empty travelAll}">
		<h2>
			참여한 여행이 없습니다. <br />여행을 떠나보세요!
		</h2>
		<button onclick="window.location='/travelMaker/travel/makingList.tm'">여행떠나기</button>
	</c:if>
	<c:if test="${!empty travelAll}">

		<div class="infoList">
			<c:forEach var="travelAll" items="${travelAll}" varStatus="status">
		             <ul>
		                 <li>
		                     <div>
		                         <h2>${travelAll.subject} <a href="/travelMaker/my/myHistoryCont.tm?gNo=${travelAll.gNo}&status=${travelAll.status}" class="posA">더 알아보기 ></a></h2>
		                         <dl>
		                             <dt>날짜</dt>
		                             <dd>${travelAll.startDate} ~ ${travelAll.endDate}</dd>
		                         </dl>
		                         <dl>
		                             <dt>컨셉</dt>
		                             <dd class="cos">${travelAll.concept}</dd>
		                         </dl>
		                         <dl>
		                             <dt>코스 설명</dt>
		                             <dd class="cos">${travelAll.courseExpl}</dd>
		                         </dl>
		                     </div>
		                 </li>
		             </ul>
			
				<%-- 	No.${status.count} </br>
					<a href="/travelMaker/my/myHistoryCont.tm?gNo=${travelAll.gNo}&status=${travelAll.status}"><h3>${travelAll.subject}</h3></a>
					-여행기간 : ${travelAll.startDate} ~ ${travelAll.endDate} </br>
				 	-여행컨셉 : ${travelAll.concept} </br>
				 	-코	   스 : ${travelAll.courseExpl}</br></br> --%>
			</c:forEach>
         </div>
         <!--infoList end-->
	</c:if>
	<script>
		function cancelCheck(){
			if(confirm("취소하시겠습니까?")== true){
				document.cancelLiked.submit();
			}else{
				return false;
			}
		}
	</script>
	<script>
		// 좋아요 한 여행 다중 삭제 하기
		$(document).ready(function(){
			$("input:checkbox[name=canGnum]").on("click",function(){
				var arr = new Array();
				$("input:checkbox[name=canGnum]:checked").each(function(){
					var checkVal = $(this).val();
					arr.push(checkVal);
				});
				$("#cangNo").val(arr);
			});
			
		});
	</script>
	<%-- 
	<h1>내가 좋아요한 여행</h1>
	<c:if test="${empty lsharedList}">
			좋아요 한 여행이 존재 하지 않습니다.
	</c:if>
	<c:if test="${!empty lsharedList}">
		<form action="/travelMaker/shared/sharedLikedCancel.tm" name="cancelLiked" method="post" onsubmit="return cancelCheck()" >
			<input type="submit" value="취소">
			<input type="hidden" name="gNo" id="cangNo">
			<c:forEach var="list" items="${lsharedList}">
				<ul>
					<li><input type="checkbox" name="canGnum" value="${list.gNo}" /></li>
					<li>그룹 번호 : ${list.gNo}</li>
					<li>여행 이름 : ${list.subject}</li>
				</ul>
			</c:forEach>
		</form>
	</c:if>
	--%>
</div>
<!-- //wrapAll end -->

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->

