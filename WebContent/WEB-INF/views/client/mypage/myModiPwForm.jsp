<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	<script>
	//유효성 검사 
	function check(){
		var inputs = document.modiPwForm;
		if(!inputs.pw.value){
			alert("새로운 비밀번호를 입력해주세요");
			return false;
		}else if(!inputs.pwch.value){
			alert("새로운 비밀번호 확인란을 입력해주세요");
			return false;
		}else if(inputs.pwch.value!=inputs.pw.value){
			alert("비밀번호가 일치 하지 않습니다.");
			return false;
		}
	}
	</script>
	<div class="travelPWrap">
				<div class="travelWrap">
					<div class="travelHead">
						<h1>TravelMaker</h1>
					</div>
					<div class="tArticle">
						<h2 class="titMain">비밀번호를 재설정합니다.</h2>
						<p class="descMain">새로운 비밀번호를 입력해주세요</p>
							<div class="formArea">
								<form action="/travelMaker/mem/myModiPwPro.tm" name="modiPwForm" onsubmit="return check()" method="post">
									<div class="itemTf">
										<strong class="tf_required">비밀번호</strong>
											<input type="hidden" name="id" value="${mem.id}"/>
											<input type="password" name="pw" placeholder="새 비밀번호" /><br/>
										<strong class="tf_required">비밀번호 확인</strong>		
											<input type="password" name="pwch" placeholder="새 비밀번호 확인" /><br/>
									</div>	
									<button type="submit" class="subBtn">비밀번호 재설정</button>
									<!-- <input type="button" value="뒤로가기" onclick="history.go(-1)"/> -->
								</form>
							</div>	
				</div>
			</div>
		</div>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
