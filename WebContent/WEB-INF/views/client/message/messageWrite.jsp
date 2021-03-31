<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
	<br/><br/><br/><br/><br/><br/>
		<a href="message.tm">받은쪽지함</a> | <a href="message.tm">보낸쪽지함</a>
		<h1>쪽지쓰기</h1>
		<form action="/travelMaker/msg/messageWritePro.tm" method="get">
			
			
			<c:if test="${reply == null && receiver == null }"> 
			받는이 <input type="text" name="receiver" required /> <br/>
			</c:if>
			<c:if test="${reply != null }">
			받는이 <input type="text" name="receiver"  value="${reply}" required /> <br/>
			</c:if>
			<c:if test="${receiver != null }">
			받는이 <input type="text" name="receiver"  value="${receiver}" required /> <br/>
			</c:if>

			
			<textarea rows="10" cols="30" name="mCont" required></textarea><br/>
			<button onclick=" " >취소</button> 
			
			
			
			<input type="submit" value="보내기" />
		</form>


























		
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->