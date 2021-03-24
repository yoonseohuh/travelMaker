<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		<jsp:include page="/WEB-INF/views/include/myMenu.jsp" />
		<!-- myMenu end -->
		<h2>회원 정보 수정</h2>
		<form action="/travelMaker/mem/signupPro.tm" method="post">
			<table>
				<tr>
					<td>이름</td>
					<td>${mem.name}</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>${mem.id}</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>${mem.nickname}</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>${mem.birth}</td>
				</tr>
				<tr>
					<td>email</td>
					<td>${mem.email}</td>
				</tr>
				<tr>
					<td>성별</td>
					<c:if test="${mem.gender==0}">
						<td>남자</td>
					</c:if>
					<c:if test="${mem.gender==1}">
						<td>여자</td>
					</c:if>
				</tr>
				<tr>
					<td>
						<input type="button" value="닉네임 수정" onclick="window.location='/travelMaker/mem/myModiNick.tm?id=${mem.id}&nickname=${mem.nickname}'"/>
						<input type="button" value="비밀번호 수정" onclick="window.location='/travelMaker/mem/myModiPwForm.tm?id=${mem.id}&pw=${mem.pw}'"/>
					</td>
				</tr>
			</table>
		</form>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<h2>회원 탈퇴</h2>
		<h3>회원 탈퇴 시 바보이며 일주일간 바보입니다.</h3>
		<input type="button" value="회원 탈퇴" onclick="window.location='/travelMaker/mem/myDelete.tm?id=${mem.id}'"/>
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
