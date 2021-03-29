<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/adminMenu.jsp" />
	<!-- //adminMenu end -->
	
	<div class="wrapAll admin">
		<c:if test="${count==0 || count==null}">
			<table>
				<tr>
					<td><h3>등록된 포지션이 없습니다.</h3></td>
				</tr>
			</table>
		</c:if>
		
		<form action="/travelMaker/admin/addSPosPro.tm" method="post" enctype="multipart/form-data">
			<table>
	    		<tr>
					<th>포지션 분류</th>
					<th>이모티콘</th>
					<th>포지션 이름</th>
					<th>포지션 설명</th>
					<th>버튼</th>
				</tr>
				<tr>
					<td><input type="text" name="posCate"/></td>
					<td><input type="file" name="img"/></td>
					<td><input type="text" name="posName"/></td>
					<td><input type="text" name="posExpl"/></td>
					<td><input type="submit" value="추가"/></td>
				</tr>
	  		  </table>
		</form>
		<br/><br/>
		
		<c:if test="${count>0}">
			<table>
				<tr>
					<th>포지션 대분류</th>
					<th>포지션 번호</th>
					<th>이모티콘</th>
					<th>포지션 이름</th>
					<th>설명</th>
				</tr>
			<c:forEach var="spo" items="${sPosList}">
	    		<tr>
	    			<td>${spo.posCate}</td>
	    			<td>${spo.posNo}</td>
	    			<td><img src="<c:url value="/resources/test/${spo.posRoot}"/>" width="100" height="100"></td>
	    			<td>${spo.posName}</td>
	    			<td>${spo.posExpl}</td>
	    			<td class="modiBtn">
	    				<input type="button" value="수정" onclick="window.location='/travelMaker/admin/modifyFormRk.tm?rkNo=${rk.rkNo}'"/>
	    				<input type="button" value="삭제" onclick="de(${rk.rkNo})"/>
	    			</td>
	    		</tr>
	    	</c:forEach>
		    </table>
			<!-- 페이지 설정 -->
			<c:set var="pageBlock" value="5"/>
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
			<c:if test="${startPage>pageBlock}">
				<a href="/travelMaker/admin/posList.tm?pageNum=${startPage-pageBlock}" class="pageNums"> &lt;</a>
			</c:if>
			
			<!-- 페이지 리스트 -->
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="/travelMaker/admin/posList.tm?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp;</a>
			</c:forEach>
			
			<!-- 뒤로 가는 기호 -->
			<c:if test="${endPage<pageCount}">
				<a href="/travelMaker/admin/posList.tm?pageNum=${startPage+pageBlock}" class="pageNums"> &gt;</a>
			</c:if>
		</div>
		<br/><br/>
		</c:if>
			
	</div>
	<!-- //wrapAll end -->
	
</body>
</html>
