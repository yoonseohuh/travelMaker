<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
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
							console.log(res);
						}
					});
				});
				$('#rejected').submit(function(event){
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
		<!-- accept logic end -->
		
		<h1>${grpSpace.subject}의 그룹 방입니다.</h1>
		
		<c:if test="${idStatus!=1}">
			<script>
				alert("해당 그룹의 멤버가 아닙니다");
				location.href="/travelMaker/travel/makingList.tm";
			</script>
		</c:if>
		
		<c:if test="${idStatus==1}">
			<c:if test="${id==leader}">
				<h2>신청자 리스트</h2>
				<c:if test="${fn:length(grpReq)==0}">
					신청자가 없습니다.
				</c:if>
				<c:if test="${fn:length(grpReq)>0}">
				<c:forEach var="mem" items="${grpMem}">
					<c:if test="${mem.status==0}">
						<c:forEach var="req" items="${grpReq}">
							${req.id}님	&nbsp;	${req.reqTxt}
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
							<br/>
						</c:forEach>
					</c:if>				
				</c:forEach>
				</c:if>
			</c:if>
			
			<h2>참여 멤버 리스트</h2>
			<c:if test="${fn:length(grpMem)>0}">
				<c:forEach var="mem" items="${grpMem}">
					<c:if test="${mem.status==1}">
						${mem.id}님<br/>
					</c:if>			
				</c:forEach>
			</c:if>
		</c:if>
		
		
		
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<!-- //footer end -->