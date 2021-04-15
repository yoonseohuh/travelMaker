<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
		<script>
			function validation(){
				var inputs = document.inputForm;
				if(inputs.reqType.value==1){
					if(!inputs.posNo.value){						
						alert("참여하실 포지션을 선택해주세요");
						return false;
					}
				}
			}
			
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
		
		<form action="/travelMaker/travel/makingReqPro.tm" name="inputForm" onsubmit="return validation()" method="post">
		<input type="hidden" name="gNo" value="${content.gNo}"/>
		<div class="makingContWrap">
			<div class="titWrap">
				<p class="tit2" data-aos="flip-down" data-aos-duration="600">${content.id}님의 ${content.subject} 여행에 동행 신청합니다.</p>
				<p class="txt" data-aos="flip-down" data-aos-duration="600">여행 사전계획을 자세히 살펴보고 참여신청 할 수 있습니다!</p>
			</div>
			
			
			<div class="txtWrap">
				<p class="sub">참여유형</p>
				
				<c:if test="${pos1==0 && pos2==0}">
				<p class="txt">${id}님은 일반으로만 지원 가능합니다.
					<span>
						<input type="radio" name="reqType" value="0" id="joinTypeN" onclick="posSlide(this.value)" checked/>일반
					</span>
				</p>								
				</c:if>
				<c:if test="${pos1!=0 || pos2!=0}">
				<p class="txt">${id}님은 일반 또는 가이드로 지원 가능합니다.
					<span>
						<input type="radio" name="reqType" value="0" id="joinTypeN" onclick="posSlide(this.value)" />일반
						<input type="radio" name="reqType" value="1" id="joinTypeG" onclick="posSlide(this.value)" checked/>가이드
					</span>
				</p>
				</c:if>			
			</div>
			
			<div class="txtWrap pstn">
				<p class="sub">모집 포지션</p>
				<p class="txt"><textarea rows="5" cols="90" name="reqTxt" style="resize:none;"></textarea></p>
			</div>
			
			<div class="txtWrap pstn">
				<p class="sub">지원 포지션</p>
				<p class="txt"></p>				
				<c:if test="${pos1!=0}">
					<input type="radio" name="posNo" value="${pos1}"/>${posInfo1.posName}
				</c:if>
				<c:if test="${pos2!=0}">
					<input type="radio" name="posNo" value="${pos2}"/>${posInfo2.posName}
				</c:if>
				<br/><br/>* 모집 포지션에 일치하지 않아도 자유롭게 신청할 수 있습니다.
			</div>
			
			<div class="txtWrap">
				<p class="sub">한마디</p>
				<p class="txt"><textarea rows="5" cols="90" name="reqTxt" style="resize:none;"></textarea></p>
			</div>
			
			
					
		</div>
		<!-- //makingContWrap end -->
		
		<div class="btnWrap">
			<input class="btn btnY" type="submit" value="신청"/>
			<a href="/travelMaker/travel/makingList.tm"><p class="btn btnC">리스트</p></a>
		</div>
		
		</form>
		
	</div>
	<!-- //wrapAll end -->
		
		
		<%-- <h1>여행 신청폼</h1>
		${content.id}님의 ${content.subject} 여행에 동행 신청합니다.
		<br/>
		<form action="/travelMaker/travel/makingReqPro.tm" name="inputForm" onsubmit="return validation()" method="post">
			<input type="hidden" name="gNo" value="${content.gNo}"/>
			<h2>참여유형</h2>
			<div class="joinType">
				<c:if test="${pos1==0 && pos2==0}">
					${id}님은 일반으로만 지원 가능합니다.
				</c:if>			
				<input type="radio" name="reqType" value="0" id="joinTypeN" onclick="posSlide(this.value)" checked/>일반
				<c:if test="${pos1!=0 || pos2!=0}">
				<input type="radio" name="reqType" value="1" id="joinTypeG" onclick="posSlide(this.value)"/>가이드
				</c:if>
			</div>
			<div class="pstn">
				<h2>모집 포지션</h2>
				<c:forEach var="i" items="${posList}">
					${i} /
				</c:forEach>
				<h2>지원 포지션</h2>
				<c:if test="${pos1!=0}">
					<input type="radio" name="posNo" value="${pos1}"/>${posInfo1.posName}
				</c:if>
				<c:if test="${pos2!=0}">
					<input type="radio" name="posNo" value="${pos2}"/>${posInfo2.posName}
				</c:if>
				<br/><br/>* 모집 포지션에 일치하지 않아도 자유롭게 신청할 수 있습니다.
			</div>
			<h2>한마디</h2>
			<textarea rows="5" cols="90" name="reqTxt" style="resize:none;"></textarea>
			<br/><br/><br/><br/>
			<input class="btn btnY" type="submit" value="신청"/>
			<a href="/travelMaker/travel/makingList.tm"><p class="btn btnC">리스트</p></a>
		</form> --%>
	
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->