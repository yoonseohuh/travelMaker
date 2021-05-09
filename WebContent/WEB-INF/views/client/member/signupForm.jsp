<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<!-- 로그인 확인 -->	
	<c:if test="${sessionScope.memId != null}">
		<script>
			alert('로그아웃 후 이용해주십시오.')
			history.go(-1)
		</script>
	</c:if>

	<div class="tableWrap">
        <div class="signupWrap">
            <div class="signHead">
                <p>TRAVEL MAKER</p>
            </div>
            <div class="signArticle">
                <h2>회원 정보를 입력해 주세요.</h2>
                <form action="/travelMaker/mem/signupPro.tm" id="signupForm" onsubmit="return subCheck()" method="post">
                    <div class="formBox">
                        <strong class="inputTit">아이디</strong>
                        <div class="inputArea">
                            <label for="idInput" class="inputPlace  screenIn">아이디(숫자*영어 조합 4~10자리)</label>
                            <input type="text" id="idInput" name="id" class="signInput"/>
                        </div>
                        <p class="existError idError"></p>
                        <p class="existError idError1"></p>
                    </div>

                    <div class="formBox">
                        <strong class="inputTit">비밀번호</strong>
                        <div class="inputArea">
                            <label for="pwInput" class="inputPlace  screenIn">비밀번호(4~10자리)</label>
                            <input type="password" id="pwInput" name="pw" class="signInput"/>
                        </div>
                        <div class="inputArea">
                            <label for="pwChInput" class="inputPlace  screenIn">비밀번호 재입력</label>
                            <input type="password" id="pwChInput" name="pwCh" class="signInput"/>
                        </div>
                        <p class="existError pwError"></p>
                        <p class="existError pwError1"></p>
                    </div>

                    <div class="formBox">
                        <strong class="inputTit">닉네임</strong>
                        <div class="inputArea">
                            <label for="nickInput" class="inputPlace  screenIn">닉네임이(숫자*영어 조합 4~10자리)</label>
                            <input type="text" id="nickInput" name="nickname" class="signInput"/>
                        </div>
                        <p class="existError nickError"></p>
                        <p class="existError nickError1"></p>
                    </div>

                    <div class="formBox">
                        <strong class="inputTit">Email</strong>
                        <div class="inputArea">
                            <label for="emailInput" class="inputPlace  screenIn">Email</label>
                            <input type="text" id="emailInput" name="email" class="signInput"/>
                        </div>
                        <p class="existError emailError"></p>
                        <p class="existError emailError1"></p>
                    </div>

                    <div class="formBox">
                        <strong class="inputTit">이름</strong>
                        <div class="inputArea">
                            <label for="nameInput" class="inputPlace  screenIn">나마에와</label>
                            <input type="text" id="nameInput" name="name" class="signInput"/>
                        </div>
                        <p class="existError nameError"></p>
                    </div>

                    <div class="formBox">
                        <strong class="inputTit">생년월일</strong>
                        <div class="inputArea">
                            <label for="birthInput" class="inputPlace  screenIn">8자리 생년월일(ex.19920428)</label>
                            <input type="text" id="birthInput" name="birth" class="signInput"/>
                        </div>
                        <p class="existError birthError"></p>
                    </div>

                    <div class="formBox">
                        <strong class="inputTit">성별</strong>
                        <div class="wrapRadio">
                            <div class="radioItem">
                                <input type="radio" id="genderInput1" name="gender" checked value=0>
                                <label for="genderInput1">
                                    <span class="txtRadio">남성</span>
                                </label>
                            </div>
                            <div class="radioItem">
                                <input type="radio" id="genderInput2" name="gender" value=1>
                                <label for="genderInput2">
                                    <span class="txtRadio">여성</span>
                                </label>
                            </div>
                            <button type="submit" class="signBtn">회원가입</button>	
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- //signupWrap end -->	
    </div>
	<!-- //tableWrap end -->	
	<!-- //signupWrap end -->	
		<script>
		//ajax 중복처리 , foucs 사라지게, 
		//ajax id중복
		$(document).ready(function(){
			$("#idInput").change(function(event){
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
						var idResult = check.idResult;
						console.log(idResult);
						//idResult 가 true 일 때 !
						//1.#idInput에 checkResult 라는 속성에 success 추가
						//2.idError 부분 공백 처리 (오류 없으니까)
						//3.errorBor(빨간색 줄) 클래스 제거 
						if(idResult){
							$('#idInput').attr('checkResult','success');
							$(".idError").text('');
							$('#idInput').removeClass('errorBor');
						}else{
							$('#idInput').attr('checkResult','fail');
							$(".idError").text('이미 사용중인 아이디입니다');
							$('#idInput').addClass('errorBor');
						}
					}
				});
			});			
		});
		//ajax 닉네임중복
		$(document).ready(function(){
			$("#nickInput").change(function(event){
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
						var nickResult = check.nickResult;
						console.log(nickResult);
						if(nickResult){
							$('#nickInput').attr('checkResult','success');
							$(".nickError").text('');
							$('#nickInput').removeClass('errorBor');
						}else{
							$('#nickInput').attr('checkResult','fail');
							$(".nickError").text('이미 사용중인 닉네임입니다');
							$('#nickInput').addClass('errorBor');
						}
					}
				});
			});			
		});
		//ajax email중복
		$(document).ready(function(){
			$("#emailInput").change(function(event){
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
						var emailResult = check.emailResult;
						console.log(emailResult);
						if(emailResult){
							$('#emailInput').attr('checkResult','success');
							$(".emailError").text('');
							$('#emailInput').removeClass('errorBor');
						}else{
							$('#emailInput').attr('checkResult','fail');
							$(".emailError").text('이미 사용중인 email입니다');
							$('#emailInput').addClass('errorBor');
						}
					}
				});
			});			
		});
		//아이디를 가져와서 변수 선언
		let idInput = document.getElementById("idInput");
		let pwInput = document.getElementById("pwInput");
		let pwChInput = document.getElementById("pwChInput");
		let nickInput = document.getElementById("nickInput");
		let emailInput = document.getElementById("emailInput");
		let nameInput = document.getElementById("nameInput");
		let birthInput = document.getElementById("birthInput");
		let idPattern = /^[a-z0-9]{4,12}$/;	//아이디	a~z,0~9로 시작하는 4~12자리 아이디를 만들 수 있다.
		let pwPattern = /^[a-z0-9]{4,12}$/;	//아이디	a~z,0~9로 시작하는 4~12자리 아이디를 만들 수 있다.
		let nickPattern = /^[a-z0-9]{4,12}$/;	//아이디	a~z,0~9로 시작하는 4~12자리 아이디를 만들 수 있다.
		let emailPattern = /^[a-z0-9]{4,12}$/;	//아이디	a~z,0~9로 시작하는 4~12자리 아이디를 만들 수 있다.
		let namePattern = /^[가-힣]{2,4}$/;	//이름	한글만2~4자리 
		let birthPattern = /^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$/;	//생년월일	[1-2] 1~2까지 유효하다 {1}한 자리만 검사할꺼야
		
		//표현식 확인 하는 check 함수 , 패턴이랑 확인할 변수를 매개로! .test 사용하면 표현에 맞는지 나옴!
		function regExCheck(pattern,param){
			if(pattern.test(param.value)){
				return true;
			}else{
				param.focus();
				return false;
			}
		}
		//공백 있는지 확인
		function checkExist(param, dataName){
			if(param.value==""){
				alert(dataName + "입력해주세요!");
				return false;
			}
			return true;
		}
		//비밀번호 중복체크 함수 
		function checkPassword(pw1,pw2){
			if(pw1.value != pw2.value){
				console.log(pw1.value);
				console.log(pw2.value);
				alert('두 비밀번호가 일치하지 않습니다...');
				pwInput.focus();
				return false;
			}
			return true;
		}
		//submit 눌렀을 때 정규표현식에 맞는지 체크 !
		//공백이 있는지 확인 해야 하고 조건에 맞는지 확인해야하고 중복인지 확인해야함. 
		function subCheck(){
			//아이디 체크 
			checkExist(idInput,"아이디를");
			if(!regExCheck(idPattern,idInput)){
				$('.idError1').text('숫자,영어를 조합하여 4~10자리 아이디를 만들어주세요.');
				return false;	
			}
			//아이디 중복 체크
			if($('#idInput').attr('checkResult')=='fail'){
				alert('아이디 중복입니다.');
				return false;
			}
			//비밀번호 체크 
			checkExist(pwInput,"비밀번호를");
			if(!regExCheck(pwPattern,pwInput)){
				$('.pwError').text('숫자,영어를 조합하여 4~10자리 비밀번호를 만들어주세요.');
				return false;
			}
			//비밀번호 중복 체크 
			checkExist(pwChInput,"비밀번호 확인란을");
			if(!checkPassword(pwInput,pwChInput)){
				$('.pwError').text('두 비밀번호가 일치하지 않습니다.');
				return false;
			}
			//닉네임 중복 체크
			if($('#nickInput').attr('checkResult')=='fail'){
				alert('닉네임 중복입니다.');
				return false;
			}
			//닉네임  정규식
			checkExist(nickInput,"닉네임을");
			if(!regExCheck(nickPattern,nickInput)){
				$('.nickError').text('숫자,영어를 조합하여 4~10자리 닉네임을 만들어주세요.');
				return false;
			}
			
			//email
			checkExist(emailInput,"email을");
			if(!regExCheck(emailPattern,emailInput)){
				$('.emailError').text('숫자,영어를 조합하여 4~10자리 이메일을 만들어주세요.');
				return false;
			}
			//이메일 중복 체크 
			if($('#emailInput').attr('checkResult')=='fail'){
				alert('Email 중복이야');
				emailInput.focus();
				return false;
			}
			//이름
			checkExist(nameInput,"이름을");
			if(!regExCheck(namePattern,nameInput)){
				$('.nameError').text('한글 2~4');
				return false;
			}
			//생년월일
			checkExist(birthInput,"생일을");
			if(!regExCheck(birthPattern,birthInput)){
				$('.birthError').text('숫자8자리라구');
				return false;
			}
			//성별
			checkExist(genderInput,"성별을");
		}
		
		//아이디 실시간 확인 
		$('#idInput').change(function(){
			if(regExCheck(idPattern,idInput)){
				$('.idError1').text('');
				$('#idInput').removeClass('errorBor1');
			}else{
				$('.idError1').text('숫자,영어를 조합하여 4~10자리 아이디를 만들어주세요.');
				$('#idInput').addClass('errorBor1');
			}
		});
		
		//비밀번호 실시간 확인
		$('#pwInput').change(function(){
			if(regExCheck(pwPattern,pwInput)){
				$('.pwError').text('');
				$('#pwInput').removeClass('errorBor');
			}else{
				$('.pwError').text('숫자,영어를 조합하여 4~10자리 비밀번호를 만들어주세요.');
				$('#pwInput').addClass('errorBor');
			}
		});
		//비밀번호 일치 실시간 확인
		$('#pwChInput').change(function(){
			if(!checkPassword(pwInput,pwChInput)){
				$('.pwError1').text('');
				$('#pwInput').removeClass('errorBor');
			}else{
				$('.pwError1').text('비밀번호가 서로 일치 하지 않습니다.');
				$('#pwInput').addClass('errorBor');
			}
		});
		//닉네임 실시간 확인
		$('#nickInput').change(function(){
			console.log('닉변경');
			if(regExCheck(nickPattern,nickInput)){
				$('.nickError1').text('');
				$('#nickInput').removeClass('errorBor1');
			}else{
				$('.nickError1').text('열받는 닉네임 사용 금지');
				$('#nickInput').addClass('errorBor1');
			}
		});
		// email 실시간 확인
		$('#emailInput').change(function(){
			if(regExCheck(emailPattern,emailInput)){
				$('.emailError1').text('');
				$('#emailInput').removeClass('errorBor1');
			}else{
				$('.emailError1').text('격식을 갖추세요');
				$('#emailInput').addClass('errorBor1');
			}
		});
		// 이름 실시간 확인
		$('#nameInput').change(function(){
			if(regExCheck(namePattern,nameInput)){
				$('.nameError').text('');
				$('#nameInput').removeClass('errorBor');
			}else{
				$('.nameError').text('이름');
				$('#nameInput').addClass('errorBor');
			}
		});
		// 생년월일 실시간 확인
		$('#birthInput').change(function(){
			if(regExCheck(birthPattern,birthInput)){
				$('.birthError').text('');
				$('#birthInput').removeClass('errorBor');
			}else{
				$('.birthError').text('8자리');
				$('#birthInput').addClass('errorBor');
			}
		});
		//input 입력 됐을 때 label 사라지게!
		 $('input').keyup(function(){
			 $(this).prev().hide();
			 if($(this).val()==''){
				 $(this).prev().show();
			 }
		 });
		
		
		
	</script>
	
