<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	<c:if test="${sessionScope.memId==null}">
		<script>
			alert("로그인 후에 접근 가능합니다");
			location.href='/travelMaker/mem/loginForm.tm';
		</script>
	</c:if>
	<jsp:include page="/WEB-INF/views/include/myMenu.jsp" />
	<!-- myMenu end -->

	<div class="myPageWrap">
		<div class="travelContent">
		<h2 class="pageTit">나의 기본정보를 확인,수정 해보세요</h2>
			<div class="mArticle">
				<h3 class="titModi">내정보 관리</h3>
				<div class="wrapModi">
					<div class="boxManage">
						<strong class="titManage">기본정보</strong>
						<p class="descComm">트레블메이커에 등록된 회원님의 기본정보입니다.</p>
						<div class="boxSet">
							<strong class="titSet">이름</strong>
							<span class="txtSet">${mem.name}</span>
						</div>
						<div class="boxSet">
							<strong class="titSet">생년월일</strong>
							<span class="txtSet">${mem.birth}</span>
						</div>
						<div class="boxSet">
							<strong class="titSet">성별</strong>
							<c:if test="${mem.gender==0}">
								<span class="txtSet">남자</span>
							</c:if>
							<c:if test="${mem.gender==1}">
								<span class="txtSet">여자</span>
							</c:if>
						</div>
					</div>
					<div class="boxManage">
						<strong class="titManage">로그인정보</strong>
						<p class="descComm">트레블메이커에 로그인에 사용되는 아이디,닉네임,email입니다.</p>
						<div class="boxSet">
							<strong class="titSet">아이디</strong>
							<span class="txtSet">${mem.id}</span>
						</div>
						<div class="boxSet">
							<strong class="titSet">email</strong>
							<span class="txtSet">${mem.email}</span>
						</div>
						<div class="boxSet">
							<a href="myModiNick.tm?id=${mem.id}&nickname=${mem.nickname}" class="linkSet">
								<strong class="titSet">닉네임</strong>
								<span class="txtSet">${mem.nickname} ></span>
							</a>
						</div>
						<div class="boxSet">
							<a href="myModiPwForm.tm?id=${mem.id}&pw=${mem.pw}" class="linkSet">
								<strong class="titSet">비밀번호</strong>
								<span class="txtSet">비밀번호 수정 ></span>
							</a>
						</div>
					</div>
					<div class="boxManage">
						<input type="button" class="deleBtn" value="회원 탈퇴" onclick="window.location='/travelMaker/mem/myDelete.tm?id=${mem.id}'"/>
					</div>
				</div>
			</div>
		</div>
		<!-- //travelContent end -->
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
