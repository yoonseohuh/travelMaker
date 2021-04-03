<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	<script>
		//ajax
		$(document).ready(function(){
			$("#pw").change(function(){
				event.preventDefault();
				var data = {};
				$.each($('#modiPwForm').serializeArray(), function(index, i){
				data[i.name] = i.value;
				});
				console.log(data);
				$.ajax({
					type:"post",
					url: "/travelMaker/mem/ajaxModiPw.tm",
					dataType: "json",
					contentType: "application/json",
					data: JSON.stringify(data),
					success : function(result){
						var check = JSON.parse(result);
						console.log(check);
						$("#pwExRes").val(check);
					}
				});
			});			
		});
		//유효성 검사 
		function check(){
			var inputs = document.modiPwForm;
			if(inputs.pwExRes.value != "사용가능" ){
				alert("이전과 다른 비밀번호를 입력해주세요");
				return false;
			}else if(!inputs.pw.value){
				alert("새 비밀번호를 입력하세요");
				return false;
			}else if(!inputs.pwch.value){
				alert("비밀번호 확인란을 입력하세요");
				return false;
			}else if(inputs.pw.value != inputs.pwch.value ){
				alert("비밀번호가 일치하지 않습니다");
				return false;
			}
		}
	</script>
	
	<div class="wrapAll client">
		<c:if test="${result!=1}">
			<script>
				alert('아이디 혹은 email이 틀렸습니다');
				history.go(-1);
			</script>
		</c:if> 
		<h1>비밀번호 재설정</h1>
		<c:if test="${result==1}">
			<form action="/travelMaker/mem/modiPwPro.tm" name="modiPwForm" id="modiPwForm" onsubmit="return check()" method="post">
				<input type="hidden" name="id" value="${mem.id}"/>
				<input type="password" name="pw" id="pw" placeholder="새 비밀번호" /><br/>
				<input type="text" name="pwExRes" id="pwExRes" disabled/><br/>
				<input type="password" name="pwch" placeholder="새 비밀번호 확인" /><br/>
				<input type="submit" value="비밀번호 수정"/>
				<input type="button" value="뒤로가기" onclick="history.go(-1)"/>
			</form>
		</c:if>
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
