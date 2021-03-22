<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		<h2>회원 정보 수정</h2>
		<form action="/travelMaker/mem/signupPro.tm" method="post">
			<table>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" /></td>
				</tr>
				<tr>
					<td>id중복체크</td>
					<td><input type="button" value="중복체크" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" /></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="pwch" /></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="nickname" /></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="birth" /></td>
				</tr>
				<tr>
					<td>email</td>
					<td><input type="text" name="email"/></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" name="gender" value=0 />남
						<input type="radio" name="gender" value=1 />여
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="회원가입" />
					</td>
				</tr>
			</table>
		</form>
		<h2>회원 탈퇴</h2>
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
</body>
</html>