<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		<script>
			$(document).ready(function(){
				$('.pstn').hide();
			});
			function posSlide(typeVal){
				if(typeVal==1){
					console.log("가이드");
					$('.pstn').slideDown();
				}
				if(typeVal==0){
					console.log("일반");
					$('.pstn').slideUp();
				}
			}
		</script>
		<!-- script end -->
		
		<h1>여행 신청폼</h1>
		${content.id}님의 ${content.subject} 여행에 동행 신청합니다.
		<br/>
		<form action="/travelMaker/travel/makingReqPro.tm" method="post">
			<input type="hidden" name="gNo" value="${content.gNo}"/>
			<h2>참여유형</h2>
			<div class="joinType">
				<input type="radio" name="reqType" value="0" id="joinTypeN" onclick="posSlide(this.value)"/>일반
				<input type="radio" name="reqType" value="1" id="joinTypeG" onclick="posSlide(this.value)"/>가이드
			</div>
			<div class="pstn">
				<h2>모집 포지션</h2>
				${content.po1} / ${content.po2} / ${content.po3}
				<h2>지원 포지션</h2>
				<c:if test="${pos1==0 && pos2==0}">
					${id}님은 아직 지원 가능한 포지션이 없습니다.
				</c:if>
				<c:if test="${pos1!=0}">
					<input type="radio" name="posNo" value="${pos1}"/>${posInfo1.posName}
				</c:if>
				<c:if test="${pos2!=0}">
					<input type="radio" name="posNo" value="${pos2}"/>${posInfo2.posName}
				</c:if>
			</div>
			<h2>한마디</h2>
			<textarea rows="5" cols="90" name="reqTxt" style="resize:none;"></textarea>
			<br/><br/><br/><br/>
			<input type="submit" value="신청"/>
			<input type="button" value="리스트" onclick="window.location='/travelMaker/travel/makingList.tm'"/>
		</form>
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->