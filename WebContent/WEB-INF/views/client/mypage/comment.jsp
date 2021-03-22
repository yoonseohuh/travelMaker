<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>

   
	
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
	
		<jsp:include page="/WEB-INF/views/include/myMenu.jsp" />
		<!-- myMenu end -->
		
		<c:if test="${count == 0}">
		여행목록이 없다.
		여행떠나라
		</c:if>		
		
		<h1>comment</h1>
		<a id="tab1">조회</a> | <a id="tab2">작성</a>
		
		<div id="cont1">
			<h1>너에게 난..?</h1>
			<div>
			    <ul>
			        <li class="menu">
			            <a>전주여행</a>
			            <ul style="display: none;">
			                <li>메뉴1-1</li>
			                <li>메뉴1-2</li>
			                <li>메뉴1-3</li>
			                <li>메뉴1-4</li>
			                <li>메뉴1-5</li>
			                <li>메뉴1-6</li>
			            </ul>
			        </li>
			  
			        <li class="menu">
			            <a>광명동굴탐험</a>
			            <ul style="display: none;">
			                <li>메뉴2-1</li>
			                <li>메뉴2-2</li>
			                <li>메뉴2-3</li>
			                <li>메뉴2-4</li>
			                <li>메뉴2-5</li>
			                <li>메뉴2-6</li>
			            </ul>
			        </li>
			    </ul>
			</div>
		</div>
		<div id="cont2">
			<h3>작성페이지</h3>
		</div>
		
		<script>
      $(document).ready(function(){
           $(".menu>a").click(function(){
               var submenu = $(this).next("ul");
    
               if( submenu.is(":visible") ){
                   submenu.slideUp();
               }else{
                   submenu.slideDown();
               }
           });
           $('#cont2').hide();
           $('#tab1').click(function(){
             $('#cont2').hide();
             $('#cont1').fadeIn();
          });
          $('#tab2').click(function(){
             $('#cont1').hide();
             $('#cont2').fadeIn();
          });
       });   
      </script>

	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
   
</body>
</html>