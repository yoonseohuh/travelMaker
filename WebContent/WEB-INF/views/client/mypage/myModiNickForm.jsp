<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	<script>
	//ajax
	$(document).ready(function(){
		$("#nickname").change(function(event){
			event.preventDefault();
			var data = {};
			$.each($('#nickForm').serializeArray(), function(index, i){
				data[i.name] = i.value;
			});
			console.log(data);
			$.ajax({
				type:"post",
				url: "/travelMaker/mem/ajaxModiNick.tm",
				dataType: "json",
				contentType: "application/json",
				data: JSON.stringify(data),
				success : function(result){
					var check = JSON.parse(result);
					console.log(check);
					$("#nickChRes").val(check);
				}
			});
		});			
	});
	//유효성 검사 
	function check(){
		var inputs = document.nickForm;
		if(!inputs.nickname.value){
			alert("새로운 닉네임을 입력해주세요");
			return false;
		}else if(inputs.nickChRes.value!="사용가능"){
			alert("이미 존재하는 닉네임 입니다.");
			return false;
		}
	}
	</script>
	<div class="wrapAll client">
		
		<form action="/travelMaker/mem/myModiNickPro.tm" id="nickForm" name="nickForm" onsubmit="return check()" method="post">
			<input type="hidden" name="id" value="${mem.id}"/>
			<input type="text" name="crNick" value="현재닉네임: ${mem.nickname}" readonly/> <br/>
			<input type="text" name="nickname" id="nickname"  placeholder="새로운 닉네임" /> <br/>
			<input type="text" id="nickChRes" name="nickChRes" placeholder="닉네임 사용가능 여부" /> <br/>
			<input type="submit" value="닉네임 수정" />
		</form>
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->