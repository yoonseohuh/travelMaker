<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		<h1>내가 작성한 랜드마크 삭제</h1>
		<form action="/travelMaker/myLandDeletePro.tm" method="post">
			<table>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw"/></td>
				</tr>
				<tr>
					<td>
						<input type="button" value="취소" onclick="history.go(-1)"/>
						<input type="submit" value="삭제"/>
					</td>
				</tr>
			</table>
		</form>	
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" /> 
	<!-- //footer end -->
