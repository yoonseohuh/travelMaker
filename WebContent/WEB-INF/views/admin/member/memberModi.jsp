<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/adminMenu.jsp" />
	<!-- //adminMenu end -->
	
	<div class="wrapAll admin">
	    <form action="/travelMaker/admin/memberModiPro.tm" method="post">
	    	<input type="hidden" name="id" value="${mem.id }"/>
			<table>
				<tr>
					<td>아이디</td>
					<td>${mem.id}</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>${mem.nickname}</td>
				</tr>
				<tr>
					<td>성별(남0/여1)</td>
					<td>
						<select name="gender">
							<c:if test="${mem.gender==1}">
								<option value="0" >남</option>
								<option value="1" selected="selected">여</option>
							</c:if>	
							<c:if test="${mem.gender==0}">
								<option value="0" selected="selected" >남</option>
								<option value="1" >여</option>
							</c:if>		
						</select>
					</td>
				</tr>
				<tr>
					<td>레벨</td>
					<td><input type="number" min="1" name="rk" value="${mem.rk}"/></td>
				</tr>
				<tr>
					<td>포지션1</td>
					<td>
						<input type="text" name="position1" value="${mem.position1}"/>
					</td>
				</tr>
				<tr>
					<td>포지션2</td>
					<td>
						<input type="text" name="position2" value="${mem.position2}"/>
					</td>
				</tr>
				<tr>
					<td>포지션 종류</td>
					<td>
						<c:forEach var="posList" items="${posList}">
							${posList.posName}<span>(</span>${posList.posNo}<span>)</span>				
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>여행횟수</td>
					<td><input type="text" name="travelCnt" value="${mem.travelCnt}"/></td>
				</tr>
				<tr>
					<td>회원 상태</td>
					<td>
						<input type="text" name="status" value="${mem.status}"/><br/>
						0:정상/1:활동정지/2:탈퇴/99:관리자
					</td>
				</tr>
				<tr>
					<td>가입일시</td>
					<td>${mem.reg}</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="회원 정보 수정" />
						<input type="button" value="돌아가기" onclick="history.go(-1)"/>
					</td>
				</tr>
			</table>	    	
	    </form>
	</div>
	<!-- //wrapAll end -->
	

