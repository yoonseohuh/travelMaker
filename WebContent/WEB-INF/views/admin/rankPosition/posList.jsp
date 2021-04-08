<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/adminMenu.jsp" />
	<!-- //adminMenu end -->
	<script>
		<%--
		$(document).ready(function(){
			$('#posCate').change(function(event){
				event.preventDefault();
				var data = {};
				$.each($('#inputForm').serializeArray(), function(index, i){
					data[i.name] = i.value;
				});
				console.log(data);
				$.ajax({
					url: "/travelMaker/admin/posSel.tm",
					type: "POST",
					dataType: "json",
					contentType: "application/json",
					data: JSON.stringify(data),
					success: function(res){
						var posSel = JSON.parse(res);
						$('#searchTable').remove();
						$('#list').append("<table id=\"searchTable\"><tr><th>No.</th><th>포지션 대분류</th><th>이모</th><th>포지션 이름</th><th>설명</th><th>버튼</th></tr><tr>");
						for(var i=0 ; i<posSel.sPosList.length ; i++ ){
							$('#list').append("<td>"+i+"</td>");
							$('#list').append("<td>"+posSel.sPosList[i].posCate+"</td>");
							$('#list').append("<td>"+posSel.sPosList[i].posName+"</td>");
							$('#list').append("<td>"+posSel.sPosList[i].posName+"</td>");
							$('#list').append("<td>"+posSel.sPosList[i].posExpl+"</td>");
							$('#list').append("<td><input type='button' value='수정' onclick=\"window.location='/travelMaker/admin/modifyFormPos.tm?posNo="+posSel.sPosList[i].posNo+"'\"/></td>");
						}
						$('#list').append("</tr></table>");
					}					
				});
			});
		});
		 --%>
		//삭제 함수
   		function dee(index){
   			var check = confirm("삭제하시겠습니까?");
   			if(check){
   				location.href="/travelMaker/admin/deletePos.tm?posNo="+index;
   			}else{
   				location.href="/travelMaker/admin/posList.tm";
   			}
   		}
	   	//유효성 검사
	   		function check(){
				var inputs = document.addPosForm;
				console.log(inputs);
				if(!inputs.posCate.value){
					alert("포지션 분류를 입력하세요");
					return false;
				}else if(!inputs.img.value){
					alert("파일을 선택해주세요");
					return false;
				}else if(!inputs.posName.value){
					alert("포지션 이름을 입력하세요");
					return false;
				}else if(!inputs.posExpl.value){
					alert("포지션 설명을 입력하세요");
					return false;
				}
			}
   	</script>
	<div class="wrapAll admin">
		<div id="list">
			
		</div>
		<c:if test="${count==0 || count==null}">
			<table>
				<tr>
					<td><h3>등록된 포지션이 없습니다.</h3></td>
				</tr>
			</table>
		</c:if>
		<!-- 포지션 추가  -->
		<form action="/travelMaker/admin/addSPosPro.tm" name="addPosForm" onsubmit="return check()" method="post" enctype="multipart/form-data">
			<table>
	    		<tr>
					<th>포지션 대분류</th>
					<th>이모티콘</th>
					<th>포지션 이름</th>
					<th>포지션 설명</th>
					<th>버튼</th>
				</tr>
				<tr>
					<td><input type="number" min="1" max="6" name="posCate" placeholder="숫자 입력"/></td>
					<td><input type="file" name="img"/></td>
					<td><input type="text" name="posName"/></td>
					<td><input type="text" name="posExpl"/></td>
					<td><input type="submit" value="추가"/></td>
				</tr>
	  		  </table>
		</form>
		<br/>
		<!-- 포지션 대분류 보여주기 -->
		<table style="margin:50px 0;">
			<tr>
				<td>포지션 대분류 번호</td>
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>6</td>
			</tr>
			<tr>
				<td>포지션 대분류 이름</td>
				<td>맛집</td>
				<td>숙박</td>
				<td>관광지</td>
				<td>교통</td>
				<td>사진</td>
				<td>히든</td>
			</tr>
		</table>
		<br/>
		<!-- 포지션 분류 선택  
		<form id="inputForm">
			<input type="hidden" name="pageNum" value="${pageNum}"/>
			<table>
				<tr>
					<td>
						<select name="posCate" id="posCate">
							<option value="0">전체</option>
							<option value="1">맛집</option>
							<option value="2">숙박</option>
							<option value="3">관광지</option>
							<option value="4">교통</option>
							<option value="5">사진</option>
							<option value="6">히든</option>
						</select>
					</td>
				</tr>
			</table>
		</form>
		<br/><br/>
		-->
		
		<c:if test="${count>0}">
			<table>
				<tr>
					<th>No.</th>
					<th>포지션 대분류</th>
					<th>이모티콘</th>
					<th>포지션 이름</th>
					<th>설명</th>
					<th>수정/삭제</th>
				</tr>
			<c:forEach var="spo" items="${sPosList}">
	    		<tr>
	    			<td>
						${number}
						<c:set var="number" value="${number-1}"/>
					</td>
	    			<td>${spo.posCate}</td>
	    			<td><img src="<c:url value="/resources/upload/${spo.posRoot}"/>" width="100" height="100"></td>
	    			<td>${spo.posName}</td>
	    			<td>${spo.posExpl}</td>
	    			<td >
	    				<input type="button" value="수정" onclick="window.location='/travelMaker/admin/modifyFormPos.tm?posNo=${spo.posNo}'"/>
	    				<input type="button" value="삭제 " onclick="dee(${spo.posNo})"/>
	    			</td>
	    		</tr>
	    	</c:forEach>
		    </table>
			<!-- 페이지 설정 -->
			<c:set var="pageBlock" value="5"/>
			<!-- 총 몇페이지인지 계산 -->
			<fmt:parseNumber var="res" value="${count/pageSize}" integerOnly="true" />
			<c:set var="pageCount" value="${res+(count%pageSize==0 ? 0 : 1)}"/>
			<!-- startPage(< 6,7,8 >6!!) 구하기  -->
			<fmt:parseNumber var="result" value="${(currPage-1)/pageBlock}" integerOnly="true" />
			<c:set var="startPage" value="${result*pageBlock+1}"/>
			<!-- endPage 구하기 -->
			<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			<c:if test="${endPage>pageCount}">
				<c:set var="endPage" value="${pageCount}"/>
    		</c:if>
    	
    	<br/><br/><br/>
		<div align="center">
			<!-- 앞으로 가는 기호 -->
			<c:if test="${startPage>pageBlock}">
				<a href="/travelMaker/admin/posList.tm?pageNum=${startPage-pageBlock}" class="pageNums"> &lt;</a>
			</c:if>
			
			<!-- 페이지 리스트 -->
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="/travelMaker/admin/posList.tm?pageNum=${i}" class="pageNums"> &nbsp; ${i} &nbsp;</a>
			</c:forEach>
			
			<!-- 뒤로 가는 기호 -->
			<c:if test="${endPage<pageCount}">
				<a href="/travelMaker/admin/posList.tm?pageNum=${startPage+pageBlock}" class="pageNums"> &gt;</a>
			</c:if>
		</div>
		<br/><br/>
		</c:if>
			
	</div>
	<!-- //wrapAll end -->
	
</body>
</html>
