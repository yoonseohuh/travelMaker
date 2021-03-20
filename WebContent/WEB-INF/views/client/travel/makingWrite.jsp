<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>여행 개설하기</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$("input[type='checkbox']").on("click",function(){
				let count = $("input:checked[type='checkbox']").length;
				if(count>3){
					$(this).prop("checked",false);
					alert("모집 포지션은 3개까지만 선택할 수 있습니다");
				}
			});
			
			
	        
		});
	</script>
</head>
<body>
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
					<input type="checkbox" name="chk" class="po" value="1"/>포지션1 &nbsp;
					<input type="checkbox" name="chk" class="po" value="2"/>포지션2 &nbsp;
					<input type="checkbox" name="chk" class="po" value="3"/>포지션3 &nbsp;
					<input type="checkbox" name="chk" class="po" value="4"/>포지션4 &nbsp;
					<input type="checkbox" name="chk" class="po" value="5"/>포지션5 &nbsp;
					<input type="checkbox" name="chk" class="po" value="6"/>포지션6 &nbsp;
					<input type="checkbox" name="chk" class="po" value="7"/>포지션7 &nbsp;
				</td>
			</tr>
			<tr>
				<td>최대 인원</td>
				<td><input type="text" name="maxNum"/>명</td>
			</tr>
			<tr>
				<td>여행 기간</td>
				<td>
					시작일
					<input type="date" name="startDate"/>
					종료일
					<input type="date" name="endDate"/>
				</td>
			</tr>
			<tr>
				<td>모집 마감일</td>
				<td><input type="date" name="closingDate"/></td>
			</tr>
			<tr>
				<td colspan="2">
					동성only <input type="checkbox" name="dongsung" value="1"/>
				</td>
			</tr>
			<tr>
				<td>지역</td>
				<td>
					<select>
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
				<td>약 &nbsp; &#8361; <input type="text" name="cost"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="개설"/>
					<input type="button" value="취소" onclick="window.location='/travelMaker/travel/makingList.tm'"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>