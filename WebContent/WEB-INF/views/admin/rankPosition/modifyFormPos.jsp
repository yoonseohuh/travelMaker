<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/adminMenu.jsp" />
	<!-- //adminMenu end -->
	
	<div class="wrapAll admin">
		<form action="/travelMaker/admin/modifyProPos.tm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="posNo" value="${spdto.posNo}" />
			<table>
				<tr>
					<th>포지션 분류</th>
					<th>이모티콘 업로드</th>
					<th>현재 파일</th>
					<th>포지션 이름</th>
					<th>포지션 설명</th>
				</tr>
				<tr>
					<td><input type="text" name="posCate" value="${spdto.posCate}"/></td>
					<td><input type="file" name="img"/></td>
					<td><img src="<c:url value="/resources/upload/${spdto.posRoot}"/>" width="100" height="100"></td>
					<td><input type="text" name="posName" value="${spdto.posName}"/></td>
					<td><input type="text" name="posExpl" value="${spdto.posExpl}"/></td>
				</tr>
			</table>
			<div align="center">
				<input type="submit" value="포지션 정보 수정" />
			</div>
		</form>
			
	</div>
	<!-- //wrapAll end -->
	
</body>
</html>
