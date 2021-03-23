<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		
		<jsp:include page="/WEB-INF/views/include/myMenu.jsp" />
		<!-- myMenu end -->
		
		<div>
			<h1>1:1 문의작성</h1>
			<form action="/travelMaker/my/myQnaWritePro.tm" method="get">
			<input type="hidden" name="id" value="${sessionScope.memId}" />
			<input type="hidden" name="rType" value="${rType}" />
			<table>
				<tr>
					<td>작성자</td>
					<td>
						${sessionScope.memId}
					</td>
				</tr>
				<tr>
					<td>문의유형</td>
					<td>
						<select name="rNo" >
							<option value="" selected disabled hidden>문의유형</option>
							<c:forEach var="res" items="${res}">
								<option value="${res.rNo}">rType:${res.rType} / rCont:${res.rCont}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" cols="100" rows="15"></textarea></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<a href="/travelMaker/my/myQnaReportList.tm">취소</a><input type="submit" value="전송">
					</td>
				</tr>
			</table>
			</form>
		</div>
		
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->