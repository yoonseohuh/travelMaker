<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
		<c:if test="${sessionScope.memId==null}">
			<script>
				alert("로그인 후에 접근 가능합니다");
				location.href='/travelMaker/mem/loginForm.tm';
			</script>
		</c:if>
	
	<script>
		//유효성 검사 
		function check(){
			var inputs = document.messageWrite;
			if(!inputs.receiver.value){
				alert("아이디를 입력해주세요!");
				return false;
			}else if(!inputs.mCont.value){
				alert("내용을 입력해주세요!");
				return false;
			}
		}
	</script>
	
	<div class="wrapAll">
	<br/><br/><br/><br/><br/><br/>
		<a href="message.tm">받은쪽지함</a> | <a href="message.tm">보낸쪽지함</a>
		<h1>쪽지쓰기</h1>
		<form action="/travelMaker/msg/messageWritePro.tm" name="messageWrite" onsubmit="return check()" method="get">
			
			
			<c:if test="${reply == null && receiver == null }"> 
			받는이 <input type="text" name="receiver" /> <br/>
			</c:if>
			<c:if test="${reply != null }">
			받는이 <input type="text" name="receiver"  value="${reply}" readonly/> <br/>
			</c:if>
			<c:if test="${receiver != null }">
			받는이 <input type="text" name="receiver"  value="${receiver}" readonly/> <br/>
			</c:if>
			<textarea rows="10" cols="30" name="mCont"></textarea><br/>
			<input type="submit" value="보내기" />
		</form>
		<button onclick="window.location='/travelMaker/msg/message.tm'" >취소</button> 
























		
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->