<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
		<c:if test="${sessionScope.memId==null}">
			<script>
				alert("로그인 후에 이용 가능합니다");
				history.go(-1);
			</script>
		</c:if>
		
		<script>
			function removeCheck(){
				if(confirm("정말 삭제하시겠습니까?")==true){
					document.removefrm.submit();
				}else{
					return false;
				}
			}
		</script>
		<form action="makingDel.tm?gNo=${content.gNo}" name="removefrm" method="post"></form>
		
		<h1>${content.subject}</h1>
		<table>
			<tr>
				<td>작성자: </td>
				<td>${content.id}</td>
			</tr>
			<tr>
				<td>여행 컨셉: </td>
				<td>${content.concept}</td>
			</tr>
			<tr>
				<td>모집 유형: </td>
				<td>
					${content.po1} / ${content.po2} / ${content.po3}
				</td>
			</tr>
			<tr>
				<td>모집 인원: </td>
				<td>현재 ${content.actualNum}명 / 최대 ${content.maxNum}명</td>
			</tr>
			<tr>
				<td>날짜: </td>
				<td>
					<fmt:parseNumber value="${content.endDate-content.startDate}" var="dateGap"/>
					<c:if test="${dateGap==0}">
						${content.startDate} (당일치기)
					</c:if>
					<c:if test="${dateGap>0}">
						${content.startDate} ~ ${content.endDate} (${dateGap}박 ${dateGap+1}일)						
					</c:if>
				</td>
			</tr>
			<tr>
				<td>동성필터 여부: </td>
				<td>
					<c:if test="${content.dongsung==0}">
						모두 참여 가능
					</c:if>
					<c:if test="${content.dongsung==1}">
						<c:if test="${writerGender==0}">
							남성만
						</c:if>
						<c:if test="${writerGender==1}">
							여성만
						</c:if>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>모집 마감일</td>
				<td>
					<jsp:useBean id="now" class="java.util.Date"/>
					<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowTime"/>
					<fmt:parseNumber value="${content.closingDate-nowTime}" var="dDay"/>
					<c:if test="${dDay==0}">
						${content.closingDate} (오늘 마감)
					</c:if>
					<c:if test="${dDay>0}">
						${content.closingDate} (D-${dDay})
					</c:if>
				</td>
			</tr>
			<tr>
				<td>지역: </td>
				<td>${content.loc}</td>
			</tr>
			<tr>
				<td>코스 설명: </td>
				<td>
					<textarea rows="5" cols="90" style="resize:none;" readonly>${content.courseExpl}</textarea>
				</td>
			</tr>
			<tr>
				<td>부가 설명: </td>
				<td>
					<textarea rows="5" cols="90" style="resize:none;" readonly>${content.addExpl}</textarea>
				</td>
			</tr>
			<tr>
				<td>예산: </td>
				<td>약 &#8361;${content.cost}</td>
			</tr>
			<tr>
				<td colspan="2">
					<c:if test="${sessionScope.memId!=content.id && content.status==0 && memStatus==-1}">
						<c:if test="${memIdGender==writerGender}">
							<input type="button" value="신청" onclick="window.location='/travelMaker/travel/makingReq.tm?gNo=${content.gNo}'"/>
						</c:if>						
						<c:if test="${memIdGender!=writerGender}">
							<c:if test="${memIdGender==0}">
								남성 회원은 신청할 수 없습니다. 
							</c:if>
							<c:if test="${memIdGender==1}">
								여성 회원은 신청할 수 없습니다. 
							</c:if>
						</c:if>
					</c:if>
					<c:if test="${sessionScope.memId!=content.id && content.maxNum<=content.actualNum}">
						모집이 완료되었습니다. 
					</c:if>
					<c:if test="${memStatus==0}">
						이미 신청하셨습니다.
					</c:if>
					<input type="button" value="리스트" onclick="window.location='/travelMaker/travel/makingList.tm?pageNum=${pageNum}'"/>					
					<c:if test="${sessionScope.memId==content.id}">
						<input type="button" value="삭제" onclick="removeCheck()"/>											
					</c:if>
				</td>
			</tr>
		</table>
	</div>
	<!-- //wrapAll end -->
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<!-- //footer end -->