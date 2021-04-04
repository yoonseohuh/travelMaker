<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
		<c:if test="${sessionScope.memId != null}">
			<script>
				alert('이미 로그인 상태입니다.')
				history.go(-1)
			</script>
		</c:if>
		<section class="loginCover">
			<section class="loginForm">
				<h1>TravelMaker</h1>
			    <form action="/travelMaker/mem/loginPro.tm" method="post">
			    	<div class="input-area">
						<input type="text" name="id" autocomplete="off" placeholder="아이디" />
			    	</div>
			    	<div class="input-area">
						<input type="password" name="pw" autocomplete="off" placeholder="비밀번호" />
			    	</div>
					<div class="set-login">	
						<input type="checkbox" name="auto" value="1" /> &nbsp;로그인 상태 유지
					</div>		
					<div class="btn-area">
						<!--  <input type="submit" class="subBtn" value="로그인"/>-->
						<button type="submit">로그인</button>
					</div>		
					<div class="caption">
						<ul class="list_user">
							<li><a href="findIdForm.tm">아이디 찾기</a></li>
							<li><a href="findPw.tm">비밀번호 재설정</a></li>
						</ul>
					</div>	
				</form>
			</section>
		</section>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
