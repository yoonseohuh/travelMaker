<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	<div class="travelPWrap">
		<div class="travelWrap">
			<div class="travelHead">
				<h1>TravelMaker</h1>
			</div>
			<div class="tArticle">
				<h2 class="titMain">비밀번호를 재설정합니다.</h2>
				<p class="descMain">비밀번호를 재설정할 아이디와 
				<br/>
				이메일을 입력해 주세요.
				</p>
					<div class="formArea">
						<form action="/travelMaker/mem/modiPwForm.tm" method="post">
							<div class="itemTf">
								<strong class="tf_required">아이디</strong>
								<input type="text" name="id" placeholder="아이디"/>
								<strong class="tf_required">이메일</strong>	
								<input type="text" name="email" placeholder="등록된 이메일"/>	
							</div>	
							<button type="submit" class="subBtn">비밀번호 재설정</button>
						</form>	 
					</div>	
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
