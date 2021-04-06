<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
		<jsp:include page="/WEB-INF/views/include/myMenu.jsp" />
		<!-- myMenu end -->
		
		<div class="travelContent">
			<div class="mArticle">
				<h3 class="titModi">내정보 관리</h3>
				<div class="wrapModi">
					<div class="boxManage">
						<strong class="titMain">기본정보</strong>
						<p class="descComm">트레블메이커에 등록된 회원님의 기본정보입니다.</p>
						<div class="boxSet">
							<strong class="titSet">이름</strong>
							<span class="txtSet">${mem.name}</span>
						</div>
						생년월일${mem.birth}
						성별
						<c:if test="${mem.gender==0}">
							남자
						</c:if>
						<c:if test="${mem.gender==1}">
							여자
						</c:if>
					</div>
					<div class="boxManage">
						아이디 ${mem.id}
						닉네임${mem.nickname}
						email${mem.email}
						<input type="button" value="닉네임 수정" onclick="window.location='/travelMaker/mem/myModiNick.tm?id=${mem.id}&nickname=${mem.nickname}'"/>
						<input type="button" value="비밀번호 수정" onclick="window.location='/travelMaker/mem/myModiPwForm.tm?id=${mem.id}&pw=${mem.pw}'"/>
					</div>
					<div class="boxManage">
						<input type="button" value="회원 탈퇴" onclick="window.location='/travelMaker/mem/myDelete.tm?id=${mem.id}'"/>
					</div>
				</div>
			</div>
		</div>
		<!-- //travelContent end -->
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
