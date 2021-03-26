<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		<h1>회원 관리</h1>
		<!-- 가입된 회원이 없을 때  -->
		<c:if test="${count==0 || count==null}">
			<table>
				<tr>
					<td><h3>가입된 회원이 없습니다.</h3></td>
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
					<td>${member.id}</td>
					<td>${member.pw}</td>
					<td>${member.name}</td>
					<td>${member.nickname}</td>
					<td>${member.gender}</td>
					<td>${member.rk}</td>
					<td>${member.position1}</td>
					<td>${member.position2}</td>
					<td>
						<fmt:formatDate value="${member.reg}" type="both" pattern="yyyy.MM.dd a hh:mm"/>
					</td>
					<td>
						<input type="button" value="회원 정보 수정" onclick="window.location='/travelMaker/admin/memberModiForm.tm?id=${member.id}'"/>
					</td>
				</tr>
			</c:forEach>
			</table>
			<!-- 페이지 설정 -->
			<c:set var="pageBlock" value="2"/>
			<!-- 총 몇페이지인지 계산 -->
			<fmt:parseNumber var="res" value="${count/pageSize}" integerOnly="true" />
			<c:set var="pageCount" value="${res+(count%pageSize==0 ? 0 : 1)}"/>
			<!-- startPage(< 6,7,8 >6!!) 구하기  -->
			<fmt:parseNumber var="result" value="${(currPage-1)/pageBlock}" integerOnly="true" />
			<c:set var="startPage" value="${result*pageBlock+1}"/>
			<!-- endPage 구하기 -->
			<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			<c:if test="${endPage>pageCount}">
				<c:set var="endPage" value="${pageCount}"/>
			</c:if>
		<br/><br/><br/>
		<div align="center">
			<!-- 앞으로 가는 기호 -->
			<c:if test="${search==null}">
				<c:if test="${startPage>pageBlock}">
					<a href="/travelMaker/admin/member.tm?pageNum=${startPage-pageBlock}" class="pageNums"> &lt;</a>
				</c:if>
			</c:if>
			
			<!-- 페이지 리스트 -->
			<c:if test="${search==null}">
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<a href="/travelMaker/admin/member.tm?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp;</a>
				</c:forEach>
			</c:if>
			
			<!-- 뒤로 가는 기호 -->
			<c:if test="${search==null}">
				<c:if test="${endPage<pageCount}">
					<a href="/travelMaker/admin/member.tm?pageNum=${startPage+pageBlock}" class="pageNums"> &gt;</a>
				</c:if>
			</c:if>
		</div>
		<br/><br/>
		<!-- 검색  -->
		<form action="/travelMaker/admin/member.tm">
			<table>
				<tr>
					<td>아이디 검색</td>
					<td><input type="text" name="search"/></td>
					<td><input type="submit" value="검색"/></td>
				</tr>
			</table>
		</form>
		</c:if><!-- count>0 일 때  -->
		
		<!-- 전체 회원 보기  -->
		<div align="center">
			<button onclick="window.location='/travelMaker/admin/member.tm'">전체 회원 보기</button>
		</div>
		
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
