<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
		<script>
			function submitAddForm(form){
				form.title.value = form.title.value.trim();
				if(form.title.value.length==0){
					alert("채팅방 이름을 입력해주세요");
					form.title.focus();
					return false;
				}
				form.submit();
			}
		</script>
		
		<h1 class="con">채팅방 생성</h1>
		<div class="con">
			<form action="doAdd.tm" method="post" onsubmit="submitAddForm(this); return false;">
				<div>
					<span>채팅방 이름</span>
					<div>
						<input type="text" name="title" autocomplete="off" maxlength="30" placeholder="채팅방 이름" autofocus required/>
					</div>	
				</div>
				<div>
					<span>채팅방 생성</span>
					<div>
						<input type="submit" value="생성"/>
					</div>
				</div>
			</form>
		</div>
		
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<!-- //footer end -->