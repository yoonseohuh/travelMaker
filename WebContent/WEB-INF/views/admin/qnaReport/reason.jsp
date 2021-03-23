<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/adminMenu.jsp" />
	<!-- //adminMenu end -->
	
	<div class="wrapAll admin">
		<h1>신고사유/문의유형</h1>
		<h3>등록하기</h3>	
		<form action="reasonInsert.tm" method="get">
			<select name="rType" >
				<option value="" selected disabled hidden>분류</option>
				<option value="0">그룹신고</option>
				<option value="1">랜마신고</option>
				<option value="2">채팅신고</option>
				<option value="3">쪽지신고</option>
				<option value="4">코멘트신고</option>
				<option value="5">문의유형</option>
			</select>
			<input type="text" name="rCont" placeholder="입력" />
			<input type="submit" value="등록" />
		</form>	
		
		<br/>
		<h3>그룹 신고사유</h3>
		<c:forEach var="res" items="${res}">
			<c:if test="${res.rType == 0}">
				<p>rNo:${res.rNo} / rType:${res.rType} / rCont:${res.rCont}</p>
			</c:if>
		</c:forEach>
		
		<br/>
		<h3>랜드마크 신고사유</h3>
		<c:forEach var="res" items="${res}">
			<c:if test="${res.rType == 1}">
				<p>rNo:${res.rNo} / rType:${res.rType} / rCont:${res.rCont}</p>
			</c:if>
		</c:forEach>
		
		<br/>
		<h3>채팅 신고사유</h3>
		<c:forEach var="res" items="${res}">
			<c:if test="${res.rType == 2}">
				<p>rNo:${res.rNo} / rType:${res.rType} / rCont:${res.rCont}</p>
			</c:if>
		</c:forEach>
		
		<br/>
		<h3>쪽지 신고사유</h3>
		<c:forEach var="res" items="${res}">
			<c:if test="${res.rType == 3}">
				<p>rNo:${res.rNo} / rType:${res.rType} / rCont:${res.rCont}</p>
			</c:if>
		</c:forEach>
		
		<br/>
		<h3>코멘트 신고</h3>
		<c:forEach var="res" items="${res}">
			<c:if test="${res.rType == 4}">
				<p>rNo:${res.rNo} / rType:${res.rType} / rCont:${res.rCont}</p>
			</c:if>
		</c:forEach>
		
		<br/>
		<h3>문의유형</h3>
		<c:forEach var="res" items="${res}">
			<c:if test="${res.rType == 5}">
				<p>rNo:${res.rNo} / rType:${res.rType} / rCont:${res.rCont}</p>
			</c:if>
		</c:forEach>
		
	</div>
	<!-- //wrapAll end -->
   
</body>
</html>