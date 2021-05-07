<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/adminMenu.jsp" />
	<script>
		//유효성 검사 
		function check(){
			var inputs = document.modiRk;
			if(!inputs.rkName.value){
				alert("등급이름을 입력해주세요");
				return false;
			}else if(!inputs.rkNeed.value){
				alert("요구 횟수를 입력하세요");
				return false;
			}else if(!inputs.rkExpl.value){
				alert("주요설명을 입력해주세요");
				return false;
			}else if(!inputs.rkAddExpl.value){
				alert("부가설명을 입력해주세요 ");
				return false;
			}
		}
	</script>
	<!-- //adminMenu end -->
	<c:if test="${sessionScope.memId != 'admin'}">
		<script>
			alert("관리자만 사용가능한 페이지 입니다.");
			history.go(-1);
		</script>
	</c:if>
	<div class="wrapAll admin">
		<form action="/travelMaker/admin/modifyProRk.tm" name="modiRk" onsubmit="return check()" method="post">
			<input type="hidden" name="rkNo" value="${rdto.rkNo}" />
			<table class="tm">
				<tr>
					<th>등급이름</th>
					<th>요구횟수</th>
					<th>주요설명</th>
					<th>부가설명</th>
				</tr>
				<tr>
					<td><input type="text" name="rkName" value="${rdto.rkName}"/></td>
					<td><input type="number" name="rkNeed" value="${rdto.rkNeed}" min="0" /></td>
					<td><input type="text" name="rkExpl" value="${rdto.rkExpl}"/></td>
					<td><input type="text" name="rkAddExpl" value="${rdto.rkAddExpl}"/></td>
				</tr>
			</table>
			<div align="center">
				<input type="submit" value="랭크 정보 수정" />
			</div>
		</form>
	</div>
	<!-- //wrapAll admin end -->
	

