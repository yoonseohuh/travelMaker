<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
		<c:if test="${sessionScope.memId != null}">
			<script>
				alert('로그아웃 후 사용해주세요')
				history.go(-1)
			</script>
		</c:if>
		
	<div class="travelPWrap">
		<div class="travelWrap">
			<div class="travelHead">
				<h1>TravelMaker</h1>
			</div>
			<div class="tArticle">
				<h2 class="titMain">이메일로 계정을 찾습니다.</h2>
				<p class="descMain">트래블 메이커에서 사용한 이메일을 입력해주세요.</p>
				<div class="formArea">
					<form action="/travelMaker/mem/findIdPro.tm" method="post">
						<div class="itemTf">
							<strong class="tf_required">이메일</strong>
							<input type="text" name="email" placeholder="등록된 email"/>
						</div>	
						<button type="submit" class="subBtn">아이디 찾기</button>
					</form>	
				</div>	
			</div>
		</div>
	</div>
	<!-- //wrapAll end -->
	

