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
	
	<div class="wrapAll client">
		
		<div class="msWrap">
		
			<div class="titWrap">
				<p class="tit2" data-aos="fade-right" data-aos-duration="500">쪽지쓰기</p>
			</div>
			
			<form action="/travelMaker/msg/messageWritePro.tm" name="messageWrite" onsubmit="return check()" method="get">
			<div class="msWrite"> 
				<c:if test="${reply == null && receiver == null }">
				<p><span>받는이</span><input type="text" name="receiver" /></p>
				</c:if>
				<c:if test="${reply != null }">
				<p><span>받는이</span><input type="text" name="receiver"  value="${reply}" readonly/></p>
				</c:if>
				<c:if test="${receiver != null }">
				<p><span>받는이</span><input type="text" name="receiver"  value="${receiver}" readonly/></p>
				</c:if>
				<textarea name="mCont"></textarea>
			</div>
		
			<div class="btnWrap">
				<input type="submit" value="보내기" class="btn btnY"/>
				<p onclick="window.location='/travelMaker/msg/message.tm'" class="btn btnC">취소</p>
			</div>
			</form>

		</div>
		<!-- //msWrap end -->
		
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->