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
   				location.href="/travelMaker/admin/rkPos.tm";
   			}
   		}
   		
   		//유효성 검사
   		function check(){
			var inputs = document.addRankForm;
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
   	<c:if test="${sessionScope.memId != 'admin'}">
		<script>
			alert("관리자만 사용가능한 페이지 입니다.");
			history.go(-1);
		</script>
	</c:if>
	<div class="wrapAll admin">
		<c:if test="${fn:length(rkList)==0}">
			<h3>랭크를 추가해주세요</h3>
		</c:if>
		<form action="/travelMaker/admin/addRkPro.tm" name="addRankForm" onsubmit="return check()" method="post">
			<table class="tm">
	    		<tr>
					<th>등급이름</th>
					<th>요구횟수</th>
					<th>주요설명</th>
					<th>부가설명</th>
					<th>버튼</th>
				</tr>
				<tr>
					<td><input type="text" name="rkName"/></td>
					<td><input type="number"  min="0" name="rkNeed" placeholder="숫자를 입력하세요"/></td>
					<td><input type="text" name="rkExpl"/></td>
					<td><input type="text" name="rkAddExpl" placeholder="설명은 콤마(,)로 구분해주세요"/></td>
					<td><input type="submit" value="추가"/></td>
				</tr>
	  		  </table>
		</form>
		<br/><br/>
		<c:if test="${fn:length(rkList)!=0}">
			<table class="tm">
				<tr>
					<th>No.</th>
					<th>등급이름</th>
					<th>요구횟수</th>
					<th>주요설명</th>
					<th>부가설명</th>
					<th>버튼</th>
				</tr>
   		<c:forEach var="rk" items="${rkList}">
	    		<tr class="tm">
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
    	</c:forEach>
	    	</table>	
		</c:if>
	</div>
	<!-- //wrapAll end -->
	
