<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
	    <form action="/travelMaker/mem/loginPro.tm" method="post">
			<table>
				<tr>
					<td><input type="text" name="id" placeholder="아이디" /></td>
				</tr>
				<tr>
					<td><input type="password" name="pw" placeholder="비밀번호" /></td>
				</tr>
				<tr>
					<td>
						자동로그인 <input type="checkbox" name="auto" value="1" />
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="로그인"/>
					</td>
				</tr>
				<tr>
					<td>
						<a href="findIdForm.tm">ID 찾기</a>
						<a href="findPw.tm">PW 재설정</a>
					</td>
				</tr>	
			</table>
		</form>
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
