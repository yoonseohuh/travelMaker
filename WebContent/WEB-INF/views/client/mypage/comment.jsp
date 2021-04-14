<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
   <jsp:include page="/WEB-INF/views/include/top.jsp" />
   <!-- //top end -->
	<jsp:include page="/WEB-INF/views/include/myMenu.jsp" />
	<!-- myMenu end -->
   
	<div class="myPageWrap">
		<c:if test="${sessionScope.memId==null}">
			<script>
	            alert("로그인 후에 이용 가능합니다");
	            history.go(-1);
			</script>
		</c:if>
   
      
	<script>
      $(document).ready(function(){
           $(".posA").click(function(){      //클래스가 menu의 아랫놈인 a를 클릭하면
        	   console.log('hi');
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
      
	<h2 class="pageTit">
                나에게 넌.  너에게 난. <br/>
                동행자들이 남긴 코멘트를 확인해보세요
     </h2>
      <img src="/travelMaker/resources/images/myhomeimg.png"></img>
     
     <c:if test="${!empty cmtMyGroup}">
     	<ul class="commentTab">
                <li>
                   <a style="cursor:pointer" id="tab1" class="active">코멘트 조회</a> 
                </li>
                <li>
                    <a style="cursor:pointer" id="tab2">코멘트 작성</a>
                </li>
        </ul>
            <!--commentTab End-->
	</c:if>
     
   
	<c:if test="${count > 0}">
		<c:if test="${!empty cmtMyGroup}">
			
		</c:if>
	</c:if>
    
     <div class="commentContent">   
	<div id="cont1">
		<c:if test="${count == 0}">
			<p>참여한 여행이 없으시군요! 여행떠나기 메뉴에 다양한 여행이 기다리고 있어요. 함께 떠나볼까요?</p>
			<button onclick="window.location='/travelMaker/travel/makingList.tm'">여행떠나기</button>
		</c:if>
		<c:if test="${count >0}">
			<c:if test="${empty cmtMyGroup}">
				<br/>코멘트 작성 가능한 여행이 아직 없어요! </br>
				- 여행이 종료되지 않았을 경우 </br>
				- 개설자의 총평이 작성되지 않았을 경우</br>
			</c:if>
		<c:if test="${!empty cmtMyGroup}">
				<p class="com">받은 코멘트</p>
		 			<c:forEach var="cmtMyGroup" items="${cmtMyGroup}">
			 			<div class="menu comBox">
			 				<dl>
		                        <dt>
		                            <strong>${cmtMyGroup.subject}</strong>
		                        </dt>
		                        <dd>
		                            <p>${cmtMyGroup.startDate} ~ ${cmtMyGroup.endDate} </p><a class="posA">확인</a>
		                        
									<ul style="display: none;">
									<!-- 테스트 -->
										<c:forEach var="comRecUserCnt" items="${comRecUserCnt}">
											<c:if test="${(comRecUserCnt.key == cmtMyGroup.gNo) && (comRecUserCnt.value == 0)}">
											&nbsp;작성된 코멘트가 없습니다! 함께 했던 동행자들에게 닦달해보아요.						
											</c:if>
										</c:forEach>
										<c:forEach var="comRecUser" items="${comRecUser}">
											 <c:if test="${cmtMyGroup.gNo == comRecUser.gNo}">
												<li><textarea rows="2" cols="72" name="comment" > ${comRecUser.cCont} </textarea> <br/>보낸사람: ${comRecUser.sender} / 받은날짜 ${comRecUser.reg}</br></br></li>&nbsp; 
											</c:if>
										</c:forEach>
									</ul>
								</dd>
		                    </dl>
						</div>
					</c:forEach>
				
				<p class="com send">보낸 코멘트</p>
					<c:forEach var="cmtMyGroup" items="${cmtMyGroup}">
						<div class="menu comBox">
							<dl>
		                        <dt>
		                            <strong>${cmtMyGroup.subject}</strong>
		                        </dt>
		                        <dd>
		                            <p>${cmtMyGroup.startDate} ~ ${cmtMyGroup.endDate} </p><a class="posA">확인</a>
		                        
									<ul style="display: none;">
									<!-- 테스트 -->
										<c:forEach var="comSenUserCnt" items="${comSenUserCnt}">
											<c:if test="${(comSenUserCnt.key == cmtMyGroup.gNo) && (comSenUserCnt.value == 0)}">
											&nbsp;작성하신 코멘트가 없습니다. 동행자들에게 코멘트를 남겨보세요!							
											</c:if>
										</c:forEach>
										<c:forEach var="comSenUser" items="${comSenUser}">
											 <c:if test="${cmtMyGroup.gNo == comSenUser.gNo}">
												<li><textarea rows="2" cols="72" name="comment" > ${comSenUser.cCont} </textarea> <br/>보낸사람: ${comSenUser.sender} / 받은날짜 ${comSenUser.reg}</br></br></li>&nbsp; 
											</c:if>
										</c:forEach>
									</ul>
								</dd>
		                    </dl>
						</div>
					</c:forEach>
			</c:if>
		</c:if>   
	</div>
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
	            <option value="${cmtGroupList.gNo}">${cmtGroupList.subject} ${cmtGroupList.gNo}</option>
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