<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/adminMenu.jsp" />
	<script>
	//유효성 검사 
	function check(){
		var inputs = document.memberModi;
		if(!inputs.rk.value){
			alert("레벨을 입력해주세요");
			return false;
		}else if(!inputs.position1.value){
			alert("포지션1을 입력하세요");
			return false;
		}else if(!inputs.position2.value){
			alert("포지션2를 입력하세요");
			return false;
		}else if((inputs.position2.value == inputs.position1.value) && inputs.position1.value !=0){
			alert("포지션1과 2를 다르게 선택해주세요");
			return false;
		}else if(!inputs.travelCnt.value){
			alert("여행 횟수를 입력하세요");
			return false;
		}else if(inputs.status.value != 0 && inputs.status.value != 1 && inputs.status.value != 2 &&inputs.status.value != 99 ){
			alert("회원상태를 0,1,2,99 중에 선택하여 입력하세요");
			return false;
		}
	}
	</script>
	<c:if test="${sessionScope.memId != 'admin'}">
		<script>
			alert("관리자만 사용가능한 페이지 입니다.");
			history.go(-1);
		</script>
	</c:if>
	<!-- //adminMenu end -->
	<c:if test="${sessionScope.memId != 'admin'}">
		<script>
			alert("관리자만 사용가능한 페이지 입니다.");
			history.go(-1);
		</script>
	</c:if>
	<div class="wrapAll admin">
	    <form action="/travelMaker/admin/memberModiPro.tm" name="memberModi" onsubmit="return check()" method="post">
	    	<input type="hidden" name="id" value="${mem.id }"/>
			<table class="tm">
				<tr>
					<td>아이디</td>
					<td>${mem.id}</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>${mem.nickname}</td>
				</tr>
				<tr>
					<td>성별(남0/여1)</td>
					<td>
						<select name="gender">
							<c:if test="${mem.gender==1}">
								<option value="0" >남</option>
								<option value="1" selected="selected">여</option>
							</c:if>	
							<c:if test="${mem.gender==0}">
								<option value="0" selected="selected" >남</option>
								<option value="1" >여</option>
							</c:if>		
						</select>
					</td>
				</tr>
				<tr>
					<td>레벨</td>
					<td><input type="number" min="1" name="rk" value="${mem.rk}"/></td>
				</tr>
				<tr>
					<td>포지션1</td>
					<td>
						<input type="number" min="0" name="position1" value="${mem.position1}"/>
					</td>
				</tr>
				<tr>
					<td>포지션2</td>
					<td>
						<input type="number" min="0" name="position2" value="${mem.position2}"/>
					</td>
				</tr>
				<tr>
					<td>포지션 종류</td>
					<td>
						<c:forEach var="posList" items="${posList}">
							${posList.posName}<span>(</span>${posList.posNo}<span>)</span>				
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>여행횟수</td>
					<td><input type="number" min="0" name="travelCnt" value="${mem.travelCnt}"/></td>
				</tr>
				<tr>
					<td>회원 상태</td>
					<td>
						<input type="number" name="status" value="${mem.status}"/><br/>
						0:정상/1:활동정지/2:탈퇴/99:관리자
					</td>
				</tr>
				<tr>
					<td>가입일시</td>
					<td>${mem.reg}</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="회원 정보 수정" />
						<input type="button" value="돌아가기" onclick="history.go(-1)"/>
					</td>
				</tr>
			</table>	    	
	    </form>
	</div>
	<!-- //wrapAll end -->
	

