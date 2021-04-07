<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	

 <script>
            
            // onchange에서 호출하는 함수. 
            function testChange(obj){
                // 'obj'는 this를 지칭하는 것입니다.
                alert($(obj).val());
                
                // 값 비교로 테스트 가능.
               	var currentLocation = window.location;
                if($(obj).val() == ""){
                    alert("값이 없습니다.");
                } else if($(obj).val() == "학생"){
                    alert("저는 학생입니다.");
                    $('.test').append("<h1>학생을 선택하셨습니다</h1>");
                } else if($(obj).val() == "회사원"){
                    alert("저는 회사원입니다.");
                } else if($(obj).val() == "4"){
                	 alert("4번 눌렀니?.");
					$('.joinMembers').load(currentLocation + ' .joinMembers');
                }
            }
            
            
            
            $(document).ready(function() {
            	  $('#selectBox').change(function() {
            	    var result = $('#selectBox option:selected').val();
            	    if (result == '4') {
            	      $('.div1').show();
            	    } else {
            	      $('.div1').hide();
            	    }
            	  }); 
            	}); 
            
        </script>
	<div class="wrapAll">
=<br/><br/><br/><br/><br/><br/>

	
        <select id="selectBox" name="selectBox">
		  <option value="" selected="selected">전체</option>
		   <c:forEach var="dto" items="${dtoList}"> 
			  <option value="${dto.gNo}">${dto.gNo} / ${dto.subject}</option>
			  </c:forEach>
		</select>
		
		
		
		<div class="div1"> 
			
				 <select>
				 <c:forEach var="fin" items="${fin}"> 
				  <option value="${fin.id}">${fin.gNo} / ${fin.id} / ${fin.nickname}</option>
				  </c:forEach>
				</select>
			
		</div>
        
        
       
        
        
        
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->