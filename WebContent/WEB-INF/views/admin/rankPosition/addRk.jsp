<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		<form action="/travelMaker/admin/addRkPro.tm" method="post">
			<table>
				<tr>
					<th>No.</th>
					<th>등급이름</th>
					<th>요구횟수</th>
					<th>주요설명</th>
					<th>부가설명</th>
					<th>버튼</th>
				</tr>
		   		<c:forEach var="rk" items="${rkList}">
		    		<tr>
		    			<td>
		    				${number}
		    				<c:set var="number" value="${number+1}"/>
		    			</td> 
		    			<td>${rk.rkName}</td>
		    			<td>${rk.rkNeed}</td>
		    			<td>${rk.rkExpl}</td>
		    			<td>${rk.rkAddExpl}</td>
		    			<td>
		    				<input type="button" value="수정"/>
		    				<input type="button" value="삭제"/>
		    			</td>
		    		</tr>
		    	</c:forEach>
	    		<!-- 삽입 페이지 -->
	    		<tr>
					<th>등급이름</th>
					<th>요구횟수</th>
					<th>주요설명</th>
					<th>부가설명</th>
					<th>버튼</th>
				</tr>
				<tr>
					<td><input type="text" name="rkName"/></td>
					<td><input type="text" name="rkNeed"/></td>
					<td><input type="text" name="rkExpl"/></td>
					<td><input type="text" name="rkAddExpl"/></td>
					<td><input type="submit" value="추가"/></td>
				</tr>
	  		  </table>
	    </form>
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
