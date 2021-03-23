<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		<h1>landWritePro</h1>
		<h4>lNo : ${land.lNo}</h4>
		<h4>writer : ${land.writer}</h4>
		<h4>lName : ${land.lName}</h4>
		<h4>lType : ${land.lType}</h4>
		<h4>addr : ${land.addr}</h4>
		<h4>xLoc : ${land.xLoc}</h4>
		<h4>yLoc : ${land.yLoc}</h4>
		<h4>lCont : ${land.lCont}</h4>
		<h4>lOpen : ${land.lOpen}</h4>
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->