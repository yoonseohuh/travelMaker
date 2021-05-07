<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
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
		<%-- 
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
		--%>
		
		
	</script>
	
		<c:if test="${sessionScope.memId != null}">
			<script>
				alert('로그아웃 후 이용해주십시오.')
				history.go(-1)
			</script>
		</c:if>
		
		<div id="signupWrap">
			<div id="signup-head">
				<h1 id="signup-title">TravelMaker</h1>
			</div>
			<div id="signup-article"> 
				<form action="/travelMaker/mem/signupPro.tm" id="signupForm" name="signupForm" onsubmit="return check()" method="post">
					<strong class="tf_required">이름</strong>
						<input type="text" name="name" />
					<strong class="tf_required">아이디</strong>
						<div><input type="text" class="change" name="id" id="id"  placeholder="아이디"/></div>
						<div><input type="text"  id="idChRes" placeholder="아이디 사용 가능 여부" disabled/></div>
					<strong class="tf_required">비밀번호</strong>
						<input type="password" name="pw" placeholder="비밀번호" />
						<input type="password" name="pwch" placeholder="비밀번호 확인"  />
					<strong class="tf_required">닉네임</strong>
						<input type="text" name="nickname" class="change" placeholder="닉네임"/>
						<input type="text"id="nickChRes" placeholder="닉네임 사용 가능 여부" disabled/>
					<strong class="tf_required">생년월일</strong>
						<input type="text" name="birth" />
					<strong class="tf_required">email</strong>
						<input type="text" name="email" class="change" placeholder="email"/>
						<input type="text"  id="emailChRes" placeholder="email 사용 가능 여부" disabled/>
					<strong class="tf_required">성별</strong>
						<div id="signup-radio">	
							<div class="radioDetail">
								<input type="radio"  name="gender" value=0 /><span class="gen">남</span>
							</div>
							<div class="radioDetail">
								<input type="radio" name="gender" value=1 /><span class="gen">여</span>
							</div>		
						</div>
					<button type="submit" id="sign-btn">회원가입</button>					
				</form>
			</div>
		</div>
	<!-- //signupWrap end -->	
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
	<script>
	<%--회원가입 정규표현식(Regular Expression)!--%>
	let empJ = /\s/g;	//공백 찾기		\s->공백 /g->전체
	let idJ = /^[a-z0-9]{4,12}$/;	//아이디	a~z,0~9로 시작하는 4~12자리 아이디를 만들 수 있다.
	
	//id 표현식
	$('#id').change(function(){
		if(idJ.test($('#id').val())){
			console.log(true);
		}else{
			console.log(false);
		}
	});
	</script>
