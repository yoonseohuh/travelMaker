<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		<h1>completeCont</h1>
		<c:if test="${status==0}">
			
		</c:if>
		<table>
			<tr>
				<td>${shared.subject}</td>
			</tr>
			<tr>
				<td>${shared.concept}</td>
			</tr>
			<tr>
				<td>${shared}</td>
			</tr>
			
		</table>
		
		
		
		
		
		
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->