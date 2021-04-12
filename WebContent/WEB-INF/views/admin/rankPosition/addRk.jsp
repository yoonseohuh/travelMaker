<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	<script>
		function check(){
			var inputs = document.addPosForm;
			console.log(inputs);
			if(!inputs.rkName.value){
				alert("등급 이름을 입력하세요");
				return false;
			}else if(!inputs.rkNeed.value){
				alert("요구횟수를 입력하세요");
				return false;
			}else if(!inputs.rkExpl.value){
				alert("주요설명을 입력하세요");
				return false;
			}else if(!inputs.rkAddExpl.value){
				alert("부가설명을 입력하세요");
				return false;
			}
		}
	</script>
	<div class="wrapAll">
		<form action="/travelMaker/admin/addRkPro.tm"  id="addPosForm" name="addPosForm" onsubmit="return check()" method="post">
		<c:if test="${fn:length(rkList)!=0}">
			<table>
				<tr>
					<th>No.</th>
					<th>등급이름</th>
					<th>요구횟수</th>
					<th>주요설명</th>
					<th>부가설명</th>
					<th>버튼</th>
				</tr>
			</table>
		   		<c:forEach var="rk" items="${rkList}">
			   		<table>
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
			    	</table>
		    	</c:forEach>
		   </c:if>
	    		<!-- 삽입 페이지 -->
	    	<table>
	    		<tr>
					<th>등급이름</th>
					<th>요구횟수</th>
					<th>주요설명</th>
					<th>부가설명</th>
					<th>버튼</th>
				</tr>
				<tr>
					<td><input type="text" id="rkName" name="rkName"/></td>
					<td><input type="number" name="rkNeed"/></td>
					<td><input type="text" name="rkExpl"/></td>
					<td><input type="text" name="rkAddExpl" placeholder="설명은 콤마(,)로 구분해주세요"/></td>
					<td><input type="submit" value="추가"/></td>
				</tr>
	  		  </table>
	    </form>
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
