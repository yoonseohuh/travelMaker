<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/adminMenu.jsp" />
	<!-- //adminMenu end -->
	
	    	<script>
	    		function de(index){
	    			var check = confirm("삭제?");
	    			if(check){
	    				location.href="/travelMaker/admin/deleteRk.tm?rkNo="+index;
	    			}else{
	    				document.write("삭제ㄴㄴ");
	    			}
	    		}
	    	</script>
	<div class="wrapAll admin">
		<input type="button" value="랭크 추가" onclick="window.location='/travelMaker/admin/addRk.tm'"/>
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
		</c:if>
		<c:if test="${fn:length(rkList)==0}">
			<h3>랭크를 추가해주세요</h3>
		</c:if>
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
	    				<input type="button" value="수정" onclick="window.location='/travelMaker/admin/modifyFormRk.tm?rkNo=${rk.rkNo}'"/>
	    				<input type="button" value="삭제" onclick="de(${rk.rkNo})"/>
	    			</td>
	    		</tr>
	    	</table>	
    	</c:forEach>

	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
