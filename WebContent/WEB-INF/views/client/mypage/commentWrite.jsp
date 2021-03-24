<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp" />



<body>
   
   <jsp:include page="/WEB-INF/views/include/top.jsp" />
   <!-- //top end -->
   
   <div class="wrapAll">
      
     <form action="/travelMaker/cmt/commentWritePro.tm" method="get">
     여행목록 : 
		<select name="groupNum" id="group">
			<option value="" selected disabled hidden>여행을 선택하세요</option>
			<c:forEach var="group" items="${dtoList}">
			<option value="${group.gNo}">${group.subject} ${group.startDate} ~ ${group.endDate}</option>
			</c:forEach>
		</select>
		
		
			
		
				
		<h1 id="abc"></h1>				
   	
   		<select id="group_depth">   		
   		<c:forEach var="aa" items="${fin}" varStatus="status">
   			<c:forEach var="bb" items="${aa}" varStatus="status">
   				<option>${bb.gNo}/${bb.nickname}/${bb.id}</option>
   			</c:forEach>   		
   		</c:forEach>
   		</select>
   
  		<script>
		$('#group').click(function(){
			var gNo = $('#group option:selected').val();
		});
		</script> 
		
   		<!-- 그룹멤버 목록
		<table>
 		동행자 :
		<c:forEach var="mem" items="${comMemList}" varStatus="status">
			<h3>${mem.nickname}  /  ${mem.id}</h3>
		</c:forEach>
    	 </table>
    	 <h3>${comMemList}</h3>
    	  -->
     
   
      
      
      
   </div>
   <!-- //wrapAll end -->
   
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
   <!-- //footer end -->
   
</body>
</html>