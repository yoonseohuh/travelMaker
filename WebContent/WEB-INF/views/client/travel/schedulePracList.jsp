<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<jsp:include page="/WEB-INF/views/include/top.jsp" />
<!-- //top end -->

<div class="wrapAll">
	<h1>일정 리스트</h1>
	<input type="hidden" name="gNo" value="${gNo}">
	
	<form action="scheduleModi.tm" method="post">
		<table>
			<tr>
				<td>그룹 고유번호</td>
				<td>${gNo}</td>
			</tr>
			<c:forEach var="list" items="${scheList}">
				<input type="hidden" name="sNo" value="${list.sNo}">
				<br />
				<br />
				<br />
				<tr>
					<td>날짜</td>
					<td><input type="text" name="sDate" value="${list.sDate}" /></td>
				</tr>
				<tr>
					<td>일정</td>
					<td><input type="text" name="sCont" value="${list.sCont}" /></td>
					<td><input type="submit" value="수정" /></td>
					<td><input type="button" value="삭제" /></td>
				</tr>
			</c:forEach>
		</table>
	</form>

</div>
<!-- //wrapAll end -->

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->