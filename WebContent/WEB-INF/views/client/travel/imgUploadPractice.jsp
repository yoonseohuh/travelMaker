<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	<div class="wrapAll">
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<h1>업로드테스트</h1>
		<h1>줄내림</h1>
		<h1>줄내림</h1>
		<form action="/travelMaker/travel/uploadPro.tm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="writer" value="${sessionScope.memId}"/>
			<input type="hidden" name="gNo" value="100"/>
			<input type="file" name="img"/>
			<input type="submit" value="업로드"/>
		</form>
		
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->