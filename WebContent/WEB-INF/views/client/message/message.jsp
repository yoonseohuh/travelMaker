<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		
		<br/><br/><br/><br/>
		<h1>Message</h1>
		
		
		<h1>보낸쪽지함</h1>
		<button onclick="window.location='messageWrite.tm'">쪽지쓰기</button>
		<form action="messageDel.tm" method="get">
			<input type="submit" value="삭제" />
			
				<c:forEach var="senMsgList" items="${senMsgList}"> 
					<input type="checkbox" name="msgNo" value="${senMsgList.mNo}" />${senMsgList.mNo} / ${senMsgList.receiver}/ ${senMsgList.sender} / ${senMsgList.mCont} /${senMsgList.mStatus} / ${senMsgList.reg}<br/>
				</c:forEach>
			</form>
		
		
		<h1>받은쪽지함</h1>
		<button onclick="window.location='messageWrite.tm'">쪽지쓰기</button>
		<c:forEach var="recMsgList" items="${recMsgList}"> 
			<input type="checkbox" value="${recMsgList.mNo}">${recMsgList.mNo} / ${recMsgList.receiver}/ ${recMsgList.sender} / ${recMsgList.mCont} /${recMsgList.mStatus} / ${recMsgList.reg}<br/>
		</c:forEach>
		
		
		
		
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->