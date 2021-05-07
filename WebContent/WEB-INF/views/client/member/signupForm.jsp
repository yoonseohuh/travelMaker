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
                <form action="/travelMaker/mem/signupPro.tm" id="signupForm">
                    <div class="formBox">
                        <strong class="inputTit">아이디</strong>
                        <div class="inputArea">
                            <label for="idInput" class="inputPlace  screenIn">아이디(숫자*영어 조합 4~10자리)</label>
                            <input type="text" id="idInput" class="signInput"/>
                        </div>
                        <p class="existError">이미 존재하는 아이디입니다.</p>
                    </div>

                    <div class="formBox">
                        <strong class="inputTit">비밀번호</strong>
                        <div class="inputArea">
                            <label for="pwInput" class="inputPlace  screenIn">비밀번호(4~10자리)</label>
                            <input type="text" id="pwInput" class="signInput"/>
                        </div>
                        <div class="inputArea">
                            <label for="pwChInput" class="inputPlace  screenIn">비밀번호 재입력</label>
                            <input type="text" id="pwChInput" class="signInput"/>
                        </div>
                        <p class="existError">입력한 비밀번호와 재입력한 비밀번호가 일치하지 않습니다. 다시 확인해 주세요.</p>
                    </div>

                    <div class="formBox">
                        <strong class="inputTit">닉네임</strong>
                        <div class="inputArea">
                            <label for="nickInput" class="inputPlace  screenIn">닉네임이(숫자*영어 조합 4~10자리)</label>
                            <input type="text" id="nickInput" class="signInput"/>
                        </div>
                        <p class="existError">이미 존재하는 닉네임입니다.</p>
                    </div>

                    <div class="formBox">
                        <strong class="inputTit">Email</strong>
                        <div class="inputArea">
                            <label for="emailInput" class="inputPlace  screenIn">Email</label>
                            <input type="text" id="emailInput" class="signInput"/>
                        </div>
                        <p class="existError">이미 가입된 email입니다.</p>
                    </div>

                    <div class="formBox">
                        <strong class="inputTit">이름</strong>
                        <div class="inputArea">
                            <label for="nameInput" class="inputPlace  screenIn">나마에와</label>
                            <input type="text" id="nameInput" class="signInput"/>
                        </div>
                        <p class="existError"></p>
                    </div>

                    <div class="formBox">
                        <strong class="inputTit">생년월일</strong>
                        <div class="inputArea">
                            <label for="birthInput" class="inputPlace  screenIn">8자리 생년월일(ex.19920428)</label>
                            <input type="text" id="birthInput" class="signInput"/>
                        </div>
                        <p class="existError"></p>
                    </div>

                    <div class="formBox">
                        <strong class="inputTit">성별</strong>
                        <div class="wrapRadio">
                            <div class="radioItem">
                                <input type="radio" id="genderInput1" name="gender" value=0>
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
	
	
