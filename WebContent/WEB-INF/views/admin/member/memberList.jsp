<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		<h2>회원 관리</h2>
		<!-- 가입된 회원이 없을 때  -->
		<c:if test="${count==0 || count==null}">
			<table>
				<tr>
					<td><h3>가입된 회원이 없습니다. </h3></td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${count>0}">
			<table>
				<tr>
					<th>No.</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>성별</th>
					<th>레벨</th>
					<th>포지션1</th>
					<th>포지션2</th>
					<th>가입일시</th>
					<th>회원관리</th>
				</tr>
				<c:forEach var="member" items="${memList}">
					<tr>
						<td>
							${number}
							<c:set var="number" value="${number-1}"/>
						</td>
						<td>
							${member.id}
						</td>
						<td>
							${member.pw}
						</td>
						<td>
							${member.name}
						</td>
						<td>
							${member.nickname}
						</td>
						<td>
							${member.gender}
						</td>
						<td>
							${member.rk}
						</td>
						<td>
							${member.position1}
						</td>
						<td>
							${member.position2}
						</td>
						<td>
							${member.reg}
						</td>
						<td>
							<input type="button" value="누르지마시오"/>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
