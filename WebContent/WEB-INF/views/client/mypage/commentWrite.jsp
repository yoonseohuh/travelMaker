<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
   
   <jsp:include page="/WEB-INF/views/include/top.jsp" />
   <!-- //top end -->
   
   <div class="wrapAll">
      
     <form action="#">
     여행목록: 
		<select name="subject">
			<option value=null>여행을 선택하세요</option>
				<c:forEach var="dto" items="${dtoList}">
					<option value="${dto.gNo}">${dto.subject} ${dto.startDate} ~ ${dto.endDate}</option>
				</c:forEach>
		</select>
		
			
			<input type="text" name="search" />
			<input type="submit" value="검색" />
		</form> 
      
      
      
      
      
      
   </div>
   <!-- //wrapAll end -->
   
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
   <!-- //footer end -->
   
</body>
</html>