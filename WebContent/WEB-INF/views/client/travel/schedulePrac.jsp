<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
	
	<h1>일정</h1>
	<form action="schedulePro.tm" method="post">
		그룹 고유번호 <input type="text" name="gNo"/> <br/>
		날짜 <input type="text" name="sDate"/> <br/> 
		일정 <input type="text" name="sCont"/> <br/>
		<input type="submit" value="작성"/>
	</form>
	
	
	
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<!-- //footer end -->