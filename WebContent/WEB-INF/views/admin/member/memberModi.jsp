<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
	    <form action="/travelMaker/admin/memberModiPro.tm" method="post">
	    	<input type="hidden" name="id" value="${mem.id }"/>
			<table>
				<tr>
					<th>아이디</th>
					<td>${mem.id}</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="nickname" value="${mem.nickname}"/></td>
				</tr>
				<tr>
					<th>성별(남0/여1)</th>
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
					<th>레벨</th>
					<td><input type="text" name="rk" value="${mem.rk}"/></td>
				</tr>
				<tr>
					<th>포지션1</th>
					<td>${pName1}</td>
					<td><input type="text" name="position1" value="${mem.position1}"/></td>
				</tr>
				<tr>
					<th>포지션2</th>
					<td>${pName2}</td>
					<td><input type="text" name="position2" value="${mem.position2}"/></td>
				</tr>
				<tr>
					<th>포지션 종류</th>
					<td>
						<c:forEach var="posList" items="${posList}">
							${posList.posName}<span>(</span>${posList.posNo}<span>)</span>				
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>여행횟수</th>
					<td><input type="text" name="travelCnt" value="${mem.travelCnt}"/></td>
				</tr>
				<tr>
					<th>회원 상태</th>
					<td>
						<input type="text" name="status" value="${mem.status}"/><br/>
						0:정상/1:활동정지/2:탈퇴/99:관리자
					</td>
				</tr>
				<tr>
					<th>가입일시</th>
					<td>${mem.reg}</td>
				</tr>
				<tr>
					<td><input type="submit" value="회원 정보 수정" /></td>
					<td><input type="button" value="돌아가기" onclick="history.go(-1)"/></td>
				</tr>
			</table>	    	
	    </form>
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
