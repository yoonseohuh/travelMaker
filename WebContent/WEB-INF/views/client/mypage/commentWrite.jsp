<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
   
   <jsp:include page="/WEB-INF/views/include/top.jsp" />
   <!-- //top end -->
   
   <div class="wrapAll">
      
     <form action="/travelMaker/views/client/mypage/comment.tm" method="get">
     여행목록 : 
		<select name="groupNum" id="group">
			<option value=null>여행을 선택하세요</option>
				<c:forEach var="group" items="${dtoList}">
					<option value="${group.gNo}">${group.subject} ${group.startDate} ~ ${group.endDate}</option>
				</c:forEach>
		</select>
		
		
 		<!-- 그룹멤버 목록 -->
 		동행자 :
		<select name="mem" id="mem">
			<option value=null>동행자 선택하세요</option>
				<c:forEach var="mem" items="${memList}">
					<option value="${mem.id}">${mem.nickname}</option>
				</c:forEach>
		</select><br/><br/>
		
		<textarea rows="10" cols="80" name="comment"></textarea>
 			
		<input type="submit" value="작성" />
	</form> 
     
     
    <script>
    jQuery('#groupNum').change(function() {
    	var state = jQuery('#groupNum option:selected').val();
    	if ( state == 'option2' ) {
    		jQuery('.layer').show();
    	} else {
    		jQuery('.layer').hide();
    	}
    });
    
    
    </script>
     
     <!-- 
    <script>
	$(function){
		$('#group').change(function(){
			alert(this.value);
			
		});
		
	}
	</script>
	 -->
      
    
      
      
      
      
   </div>
   <!-- //wrapAll end -->
   
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
   <!-- //footer end -->
   
</body>
</html>