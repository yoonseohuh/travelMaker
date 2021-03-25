<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		<form action="/travelMaker/admin/modifyProRk.tm" method="post">
			<input type="hidden" name="rkNo" value="${rdto.rkNo}" />
			<table>
				<tr>
					<th>등급이름</th>
					<th>요구횟수</th>
					<th>주요설명</th>
					<th>부가설명</th>
				</tr>
				<tr>
					<td><input type="text" name="rkName" value="${rdto.rkName}"/></td>
					<td><input type="text" name="rkNeed" value="${rdto.rkNeed}"/></td>
					<td><input type="text" name="rkExpl" value="${rdto.rkExpl}"/></td>
					<td><input type="text" name="rkAddExpl" value="${rdto.rkAddExpl}"/></td>
				</tr>
			</table>
			<div align="center">
				<input type="submit" value="랭크 정보 수정" />
			</div>
		</form>
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
