<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		
		<jsp:include page="/WEB-INF/views/include/myMenu.jsp" />
		<!-- myMenu end -->
		
		<div>
			<h1>문의내역</h1>
			<form action="/travelMaker/my/myQnaWrite.tm" method="get">
				<input type="hidden" name="rType" value="5">
				<input type="submit" value="1:1 문의작성">
			</form>
		</div>
		
		<div>
			<h1>신고내역</h1>
		</div>
		
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->

</body>
</html>