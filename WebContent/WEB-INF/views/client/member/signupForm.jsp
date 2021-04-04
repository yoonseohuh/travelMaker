<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	<script>
		//ajax
		$(document).ready(function(){
			$(".change").change(function(event){
				event.preventDefault();
				var data = {};
				$.each($('#signupForm').serializeArray(), function(index, i){
					data[i.name] = i.value;
				});
				console.log(data);
				$.ajax({
					type:"post",
					url: "/travelMaker/mem/ajaxIdCheck.tm",
					dataType: "json",
					contentType: "application/json",
					data: JSON.stringify(data),
					success : function(result){
						var check = JSON.parse(result);
						console.log(check.idResult);
						console.log(check.nickResult);
						console.log(check.emailResult);
						$("#idChRes").val(check.idResult);
						$("#nickChRes").val(check.nickResult);
						$("#emailChRes").val(check.emailResult);
					}
				});
			});			
		});
		
		//유효성 검사 
		function check(){
			var inputs = document.signupForm;
			if(!inputs.name.value){
				alert("이름이 뭐에요");
				return false;
			}else if(!inputs.id.value){
				alert("아이디를 입력하세요");
				return false;
			}else if(!inputs.pw.value){
				alert("비밀번호를 입력하세요");
				return false;
			}else if(!inputs.pwch.value){
				alert("비밀번호확인란을 입력하세요");
				return false;
			}else if(inputs.pw.value != inputs.pwch.value){
				alert("비밀번호가 일치 하지 않습니다");
				return false;
			}else if(!inputs.nickname.value){
				alert("닉네임을 입력하세요");
				return false;
			}else if(!inputs.birth.value){
				alert("생년월일을 입력하세요");
				return false;
			}else if(!inputs.email.value){
				alert("e메일을 입력하세요");
				return false;
			}else if(!inputs.gender.value){
				alert("성별을 선택해주세요");
				return false;
			}else if(inputs.idChRes.value!="사용가능"){
				alert("아이디가 중복됩니다");
				return false;
			}else if(inputs.nickChRes.value!="사용가능"){
				alert("닉네임이 중복됩니다");
				return false;
			}else if(inputs.emailChRes.value!="사용가능"){
				alert("email이 중복됩니다");
				return false;
			}
		}
		
	</script>
	
	<div class="wrapAll client">
		<c:if test="${sessionScope.memId != null}">
			<script>
				alert('로그아웃 후 이용해주십시오.')
				history.go(-1)
			</script>
		</c:if>
	   	<h2>회원 가입</h2>
		<form action="/travelMaker/mem/signupPro.tm" id="signupForm" name="signupForm" onsubmit="return check()" method="post">
			<table>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" class="change" name="id" id="id" />
						<input type="text"  id="idChRes" disabled/>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" /></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="pwch" /></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>
						<input type="text" name="nickname" class="change"/>
						<input type="text"id="nickChRes" disabled/>
					</td>
					
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="birth" /></td>
				</tr>
				<tr>
					<td>email</td>
					<td>
						<input type="text" name="email" class="change"/>
						<input type="text"  id="emailChRes" disabled/>
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" name="gender" value=0 />남
						<input type="radio" name="gender" value=1 />여
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="회원가입" />
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
