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
                    </div>

                    <div class="formBox">
                        <strong class="inputTit">닉네임</strong>
                        <div class="inputArea">
                            <label for="nickInput" class="inputPlace  screenIn">닉네임이(숫자*영어 조합 4~10자리)</label>
                            <input type="text" id="nickInput" name="nickname" class="signInput"/>
                        </div>
                        <p class="existError"></p>
                    </div>

                    <div class="formBox">
                        <strong class="inputTit">Email</strong>
                        <div class="inputArea">
                            <label for="emailInput" class="inputPlace  screenIn">Email</label>
                            <input type="text" id="emailInput" name="email" class="signInput"/>
                        </div>
                        <p class="existError"></p>
                    </div>

                    <div class="formBox">
                        <strong class="inputTit">이름</strong>
                        <div class="inputArea">
                            <label for="nameInput" class="inputPlace  screenIn">나마에와</label>
                            <input type="text" id="nameInput" name="name" class="signInput"/>
                        </div>
                        <p class="existError"></p>
                    </div>

                    <div class="formBox">
                        <strong class="inputTit">생년월일</strong>
                        <div class="inputArea">
                            <label for="birthInput" class="inputPlace  screenIn">8자리 생년월일(ex.19920428)</label>
                            <input type="text" id="birthInput" name="birth" class="signInput"/>
                        </div>
                        <p class="existError"></p>
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
		//ajax
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
						if(idResult){
							
						}else{
							$('#idInput').attr('checkResult','fail');
							$(".idError").text('이미 사용중인 아이디입니다');
						}
					}
				});
			});			
		});
		console.log(check);
		let idInput = document.getElementById("idInput");
		let pwInput = document.getElementById("pwInput");
		let pwChInput = document.getElementById("pwChInput");
		let nickInput = document.getElementById("nickInput");
		let emailInput = document.getElementById("emailInput");
		let nameInput = document.getElementById("nameInput");
		let birthInput = document.getElementById("birthInput");
		let idPattern = /^[a-z0-9]{4,12}$/;	//아이디	a~z,0~9로 시작하는 4~12자리 아이디를 만들 수 있다.
		let pwPattern = /^[a-z0-9]{4,12}$/;	//아이디	a~z,0~9로 시작하는 4~12자리 아이디를 만들 수 있다.
		
		//표현식 확인 하는 check 함수 , 패턴이랑 확인할 변수를 매개로! .test 사용하면 표현에 맞는지 나옴!
		function regExCheck(pattern,param){
			if(pattern.test(param.value)){
				return true;
			}else{
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
				alert('아이디 중복이얌');
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
			//닉네임 
			if(!checkExist(nickInput,"닉네임을")){
				return false;
			}
			//email
			checkExist(emailInput,"email을");
			//이름
			checkExist(nameInput,"이름을");
			//생년월일
			checkExist(birthInput,"생일을");
			//성별
			checkExist(genderInput,"성별을");
		}
		<%--
		$('#idInput').change(function(){
			if(!checkExist(idInput,"아이디를")){
				console.log("탔어?");
				return false;
			}
			if(regExCheck(idPattern,idInput)){
				console.log('가능');
				$('.idError1').text('');
				$('#idInput').removeClass('errorBor');
			}else{
				console.log('불가능');
				$('.idError1').text('숫자,영어를 조합하여 4~10자리 아이디를 만들어주세요.');
				$('#idInput').addClass('errorBor');
			}
		});
		--%>
		//input 입력 됐을 때 label 사라지게!
		 $('input').keyup(function(){
			 $(this).prev().css('opacity','0');
			 if($(this).val()==''){
				 $(this).prev().css('opacity','1');
			 }
			 
		 });
		
		
		
	</script>
	
