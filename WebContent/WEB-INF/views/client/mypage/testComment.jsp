<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	

 	<script>
 	
 	$(document).ready(function () {
 		$('#group').change(function () {
 			var selectType=$(this).val();
 			//alert(selectType);
 			 $.ajax({
 				type : "get",
 				url : "/travelMaker/cmt/.tm",   //요청할 컨트롤러
 				dataType : "json",
 				data : "gNo="+ selectType,     //나는 gno로
 				success : function(result) {
 					
 					var memList = result;
 	 				//alert(memList[0].id);
 						
 					
 					$("#groupMem").html("");
 					$('#groupMem').append('<option value="">동행자를 선택해주세요</option>');	
 					
 					//alert(result.membershipName);
 					//alert(result.memList);}
 			 
 				for(var i = 1 ; i<=memList.length; i++){
 					$('#groupMem').append("<option value="+memList[i].id+">"+memList[i].nickname+"님</option>");	
 				}
 		
 				
 			 }
 			});//ajax 
 		})//첫번째 select 박스
 		$('#groupMem').change(function () {
 			//alert($('#groupMem').val());
 			
 		})// 두번째 select 박스
 	})

 	</script>
            
	<div class="wrapAll">
	ss</br></br></br></br></br></br></br>
		
		<select name="groupNum" id="group" required >
			<option value="">이용권 종류를 선택해주세요</option>
			<c:forEach var="dto" items="${dtoList}">
			<option value="${dto.gNo}">${dto.subject}</option>
			</c:forEach>
		</select>
		
		<!-- 
		<select name="membershipVO.membershipNo" id="group" required >
		<option value="">이용권 종류를 선택해주세요</option>
		<option value="1">BASIC</option>
		<option value="2">STANDARD</option>
		<option value="3">PREMIUM</option>
		</select>
		 -->
		
		<select name="groupMem" id="groupMem" required>
		<option>여행을 선택해주세요</option>
		</select>
		    
      
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->

