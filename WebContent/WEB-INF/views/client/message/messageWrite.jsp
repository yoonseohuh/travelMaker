<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
	<br/><br/><br/><br/><br/><br/>
	
		<h1>쪽지쓰기</h1>
		<form action="/travelMaker/msg/messageWritePro.tm" method="get">
			
			
			
			받는이 <input type="text" name="receiver" required /> <br/>
			<textarea rows="10" cols="30" name="mCont" required></textarea><br/>
			<button onclick=" " >취소</button> 
			
			
			
			<input type="submit" value="보내기" />
		</form>


























		
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->