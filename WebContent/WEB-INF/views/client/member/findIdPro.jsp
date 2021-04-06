<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	<c:if test="${mem != null}">
		<div class="travelPWrap">
			<div class="travelWrap">
				<div class="travelHead">
					<h1>TravelMaker</h1>
				</div>
				<div class="tArticle">
					<h2 class="titMain">입력한 정보에 해당하는 아이디입니다.</h2>
					<p class="descMain">
						개인정보 보호를 위해 정보 일부를 *로 표시하였습니다.
					<br/>
						트레블메이커에 로그인 할 수 있는 아이디가 표시됩니다.
					</p>
					<div class="wrapFind">
						<div class="boxFind">
							<p><strong class="txtContact">${comId}</strong></p></br></br></br>
							<a href="findPw.tm" class="linkComm">비밀번호 재설정</a>
						</div>	
					</div>
						<button onclick="window.location='/travelMaker/mem/loginForm.tm'" class="subBtn">로그인</button>
					<!--  <input type="button" value="비밀번호 수정" onclick="window.location='/travelMaker/mem/findPw.tm'"/>-->
				</div>
			</div>
		</div>			
	</c:if>
	
		<c:if test="${mem == null}">
			<script>
				alert('등록된 email이 아닙니다')
				history.go(-1)
			</script>
		</c:if>
