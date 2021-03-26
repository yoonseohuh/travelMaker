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
							$('#addMem').append(res);
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
				<h2>새로 들어온 신청</h2>
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
			
			<h2>참여 중인 멤버</h2>
				<div id="addMem">
				</div>
			<c:if test="${fn:length(grpMem)>0}">
				<c:forEach var="mem" items="${grpMem}">
					<c:if test="${mem.status==1}">
						${mem.id}님<br/>
					</c:if>			
				</c:forEach>
			</c:if>
			
			<h2>모집 현황</h2>
			
		</c:if>
		
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<!-- //footer end -->