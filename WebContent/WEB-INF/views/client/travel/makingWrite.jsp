<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		<script>
			$(document).ready(function(){
				//포지션 관련 스크립트
				$("input:checkbox[name=chk]").on("click",function(){
					//최대 3개 선택 가능하게 제한
					let count = $("input:checkbox[name=chk]:checked").length;
					if(count>3){
						$(this).prop("checked",false);
						alert("모집 포지션은 3개까지만 선택할 수 있습니다");
					}
					//3개 포지션 각각 po1, po2, po3 value에 넣기
					var arr = new Array();
					$("input:checkbox[name=chk]:checked").each(function(){
						var checkVal = $(this).val();
						arr.push(checkVal);
					});
					$("#po1").val(arr[0]);
					$("#po2").val(arr[1]);
					$("#po3").val(arr[2]);
					console.log("po1: "+$('#po1').val());
					console.log("po2: "+$('#po2').val());
					console.log("po3: "+$('#po3').val());
				});
				
				//날짜 관련 유효성 검사	
				//시작일
				$('#fromDate').datepicker({
					showOn: "both",
					//buttonImage: "images/calendar.gif",
					//buttonImageOnly: true,
					buttonText: "날짜선택",
					dateFormat: "yy-mm-dd",
					changeMonth: true,
					minDate: 0,
					onClose: function(selectedDate) {    
						$("#toDate").datepicker("option","minDate",selectedDate);	//종료일의 최소일은 시작일
						$('#dueDate').datepicker("option","maxDate",selectedDate);	//마감일의 최대일은 시작일
					}                
				});
				//종료일
				$('#toDate').datepicker({
					showOn: "both",
					//buttonImage: "images/calendar.gif",
					//buttonImageOnly : true,
					buttonText: "날짜선택",
					dateFormat: "yy-mm-dd",
					changeMonth: true,
					onClose: function(selectedDate) {
						$("#fromDate").datepicker("option","maxDate",selectedDate);	//시작일의 최대일은 종료일
					}
				});
				//모집 마감일을 시작일 이전으로 설정하게 제한
				$('#dueDate').datepicker({
					showOn: "both",
					buttonText: "날짜선택",
					dateFormat: "yy-mm-dd",
					changeMonth: true
				});
				
				/*
				예산에 세 자리마다 콤마 찍기: 값이 콤마 붙어서 넘어가길래 일단 보류
				function isEmpty(value){
					if(value.length==0||value==null){
						return true;
					}else{
						return false;
					}
				}
				function isNumeric(value){
					var regExp = /^[0-9]+$/g;
					return regExp.test(value);
				}
				function currencyFormatter(amount){
					return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
				}
				$('#inputPrice').on('focus',function(){
					var val = $('#inputPrice').val();
					if(!isEmpty(val)){
						val = val.replace(/,/g,'');
						$('#inputPrice').val(val);
					}
				});
				$('#inputPrice').on('blur',function(){
					var val = $('#inputPrice').val();
					if(!isEmpty(val) && isNumeric(val)){
						val = currencyFormatter(val);
						$('#inputPrice').val(val);
					}
				});
				cost 인풋 옆에 이거 붙여주기
				oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
				*/
			});
		</script>
		
		<c:if test="${sessionScope.memId==null}">
			<script>
				alert("로그인 후에 작성 가능합니다");
				history.go(-1);
			</script>
		</c:if>
		
		<h1>여행 개설하기</h1>
		<form action="/travelMaker/travel/makingWritePro.tm" method="post">
			<input type="hidden" name="po1" id="po1"/>
			<input type="hidden" name="po2" id="po2"/>
			<input type="hidden" name="po3" id="po3"/>
			<table border="1">
				<tr>
					<td>여행 제목</td>
					<td>
						<input type="text" name="subject"/>
					</td>
				</tr>
				<tr>
					<td>여행 콘셉트</td>
					<td>
						<input type="radio" name="concept" value="gourmet"/>맛집 &nbsp;
						<input type="radio" name="concept" value="healing"/>힐링 &nbsp;
						<input type="radio" name="concept" value="adventure"/>모험 &nbsp;
						<input type="radio" name="concept" value="tour"/>관광 &nbsp;
						<input type="radio" name="concept" value="camping"/>캠핑 &nbsp;
					</td>
				</tr>
				<tr>
					<td>가이드</td>
					<td>
						<input type="checkbox" name="chk" value="1"/>포지션1 &nbsp;
						<input type="checkbox" name="chk" value="2"/>포지션2 &nbsp;
						<input type="checkbox" name="chk" value="3"/>포지션3 &nbsp;
						<input type="checkbox" name="chk" value="4"/>포지션4 &nbsp;
						<input type="checkbox" name="chk" value="5"/>포지션5 &nbsp;
						<input type="checkbox" name="chk" value="6"/>포지션6 &nbsp;
						<input type="checkbox" name="chk" value="7"/>포지션7 &nbsp;
					</td>
				</tr>
				<tr>
					<td>최대 인원</td>
					<td><input type="number" min="1" name="maxNum"/>명</td>
				</tr>
				<tr>
					<td>여행 기간</td>
					<td>
						시작일
						<input type="text" id="fromDate" name="startDate"/>
						종료일
						<input type="text" id="toDate" name="endDate"/>
					</td>
				</tr>
				<tr>
					<td>모집 마감일</td>
					<td>
						<input type="text" id="dueDate" name="closingDate"/>
						* 모집 마감은 여행 시작일 이전으로 설정해주세요.
					</td>
				</tr>
				<tr>
					<td colspan="2">
						동성only <input type="checkbox" name="dongsung" value="1"/>
					</td>
				</tr>
				<tr>
					<td>지역</td>
					<td>
						<select name="loc">
							<optgroup label="수도권">
								<option value="seoul" selected>서울</option>
								<option value="incheon">인천</option>							
								<option value="gyunggi">경기</option>							
							</optgroup>
							<optgroup label="강원">						
								<option value="gangwon">강원</option>
							</optgroup>
							<optgroup label="충청권">
								<option value="sejong">세종</option>
								<option value="daejeon">대전</option>
								<option value="chungnam">충청남도</option>
								<option value="chungbuk">충청북도</option>
							</optgroup>
							<optgroup label="전라권">
								<option value="gwangju">광주</option>
								<option value="jeonnam">전라남도</option>
								<option value="jeonbuk">전라북도</option>
							</optgroup>
							<optgroup label="경상권">
								<option value="busan">부산</option>
								<option value="ulsan">울산</option>
								<option value="daegu">대구</option>
								<option value="gyungnam">경상남도</option>
								<option value="gyungbuk">경상북도</option>
							</optgroup>
							<optgroup label="제주">						
								<option value="jeju">제주</option>
							</optgroup>
						</select>
					</td>
				</tr>
				<tr>
					<td>코스설명</td>
					<td>
						<textarea name="courseExpl" rows="5" cols="90" placeholder="코스 설명을 작성해주세요" style="resize:none;"></textarea>
					</td>
				</tr>
				<tr>
					<td>부가설명</td>
					<td>
						<textarea name="addExpl" rows="5" cols="90" placeholder="부가 설명을 작성해주세요(교통편, 숙박형태 등)" style="resize:none;"></textarea>
					</td>
				</tr>
				<tr>
					<td>예산</td>
					<td>약 &nbsp; &#8361; <input type="text" id="inputPrice" name="cost"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="개설"/>
						<input type="button" value="취소" onclick="window.location='/travelMaker/travel/makingList.tm'"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- //footer end -->
</body>
</html>

