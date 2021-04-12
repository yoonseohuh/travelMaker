<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
   <jsp:include page="/WEB-INF/views/include/top.jsp" />
   <!-- //top end -->
   
   <div class="wrapAll client">
      <c:if test="${sessionScope.memId==null}">
         <script>
            alert("로그인 후에 이용 가능합니다");
            history.go(-1);
         </script>
      </c:if>
   
      <jsp:include page="/WEB-INF/views/include/myMenu.jsp" />
      <!-- myMenu end -->
      
      <script>
      $(document).ready(function(){
           $(".menu>a").click(function(){      //클래스가 menu의 아랫놈인 a를 클릭하면
               var submenu = $(this).next("ul");      //a 다음에있는 "ul을 submenu에 담고 
    
               if( submenu.is(":visible") ){     // ul display: none 아닐떄         -->display: none false 를 반환 한다.
                   submenu.slideUp();         //ul이 슬라이드업
               }else{                  // display: none이면 
                   submenu.slideDown();   //ul부분 슬라이드다운
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
      
      
      //유효성 검사 
      function check(){
         var inputs = document.commentWrite;
         if(!inputs.comment.value){
            alert("코멘트를 작성해주세요!");
            return false;
         }else if(!inputs.mCont.value){
            alert("내용을 입력해주세요!");
            return false;
         }
      }
      
      
      //ajax
      $(document).ready(function () {
       $('#group').change(function () {
          var selectType=$(this).val();
          //alert(selectType);
           $.ajax({
             type : "get",
             url : "/travelMaker/cmt/selectTravel.tm",   //요청할 컨트롤러
             dataType : "json",
             data : "gNo="+ selectType,     //나는 gno로
             success : function(result) {
                
                var memList = result;
                 //alert(memList[0].id);
                   
                
                $("#groupMem").html("");
                $('#groupMem').append('<option value="">동행자를 선택해주세요</option>');   
                
                //alert(result.membershipName);
                //alert(result.memList);}
           if(memList.length == 0){
        	   	console.log(memList.length);
        	   	$('#groupMem').append("<option>없다</option>");  
           }else{
             for(var i = 0 ; i<memList.length; i++){
            	 
            	 console.log("출력문" + memList[i].id);
            	
                $('#groupMem').append("<option value="+memList[i].id+">"+memList[i].id +"/"+memList[i].nickname+"님</option>");   
            	 
             }
           }
           
       
             
           }
          });//ajax 
       })//첫번째 select 박스
       $('#groupMem').change(function () {
          //alert($('#groupMem').val());
          
       })// 두번째 select 박스
       })
      
      </script>
      
      
      <h1>comment</h1>
       
      
      <c:if test="${count > 0}">
      	함께 여행한 동행자들에게 코멘트를 남겨보세요! </br></br>
		<a style="cursor:pointer" id="tab1">조회</a> | <a style="cursor:pointer" id="tab2">작성</a> 
      </c:if>

      
      
	<div id="cont1">
		<c:if test="${count == 0}">
			<p>참여한 여행이 없으시군요! 여행떠나기 메뉴에 다양한 여행이 기다리고 있어요. 함께 떠나볼까요?</p>
		</c:if>
		<c:if test="${count >0}">
		<br/><h1>너에게 난..? status4만보여줌</h1>
				<ul>
		 			<c:forEach var="dtoList" items="${dtoList}">
		 			<li class="menu">
						<a style="cursor:pointer">${dtoList.subject} ${dtoList.startDate} ~ ${dtoList.endDate}</a>
						<ul style="display: none;">
							<c:forEach var="comRecUser" items="${comRecUser}">
								
								<c:if test="${dtoList.gNo == comRecUser.gNo}">
									
									<li>보낸사람: ${comRecUser.sender} / 코멘트내용: ${comRecUser.cCont} / 보낸날짜 ${comRecUser.reg}<li>&nbsp;   
									<textarea rows="10" cols="72" name="comment" > ${comRecUser.cCont} </textarea>    
								</c:if>
								
							</c:forEach>
						</ul>
					</li>
					</c:forEach>
				</ul>
			  
			<br/>
			<h1>나에게 넌..?</h1>
				<ul>
					<c:forEach var="dtoList" items="${dtoList}">
						<li class="menu">
						<a style="cursor:pointer">${dtoList.subject} ${dtoList.startDate} ~ ${dtoList.endDate}</a>
					 		<ul style="display: none;">
							<c:forEach var="comSenUser" items="${comSenUser}">
								<c:if test="${dtoList.gNo == comSenUser.gNo}">
									<li>받는사람: ${comSenUser.receiver} / 코멘트내용: ${comSenUser.cCont} / 보낸날짜 ${comSenUser.reg}<li>&nbsp;      
									<textarea rows="10" cols="72" name="comment" > ${comSenUser.cCont} </textarea> 
								</c:if>
							</c:forEach>
							</ul>
						</li>
					</c:forEach>
				</ul>
		</c:if>   

	</div>
      <!-- //cont1 end  -->   
      
      <div id="cont2">
         <form action="/travelMaker/cmt/commentWritePro.tm" name="commentWrite" onsubmit="return check()" method="get">
         <input type="hidden" name="id" value="${sessionScope.memId}" />
         <input type="hidden" name="result" value="1" />
              여행목록 :
            <select name="groupNum" id="group" required >
               <option value="">여행을 선택해주세요</option>
               <c:forEach var="cmtGroupList" items="${cmtGroupList}">
               <option value="${cmtGroupList.gNo}">${cmtGroupList.subject}/ ${cmtGroupList.gNo}</option>
               </c:forEach>
            </select>&nbsp;
            
            
            동행자 :                      
               <select name="groupMem" id="groupMem" required>
               <option>동행자를 선택해주세요</option>
            </select> <br/>
            
               <textarea rows="10" cols="72" name="comment" ></textarea>
               <input type="submit" value="버튼" />
            </form>
      </div>
      <!-- //cont2 end  -->  
              
   </div>
   <!-- //wrapAll end -->
   
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->