<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<jsp:include page="/WEB-INF/views/include/top.jsp" />
<!-- //top end -->

<div class="wrapAll">

	<h1>completeCont</h1>
	<c:if test="${status==1}">
		<table>
			<tr>
				<td>${getGroup.startDate}~${getGroup.endDate} <br /> 
					개설자 :${getGroup.id}
					<h1>${getGroup.subject}</h1>
				</td>
			</tr>
			<tr>
				<td>
					<h2>Info</h2>
					<h4>코스설명</h4> 
						${getGroup.courseExpl}<br />
					<h4>부가설명</h4> 
						${getGroup.addExpl} <br />
					<h4>일 정</h4> <c:forEach var="scheList" items="${scheList}">
						${scheList.sDate} : ${scheList.sCont} <br />
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td>
					<h2>Member</h2> 
						가이드 ${fn:length(gMem) - fn:length(posMem)} <br />
					<c:forEach var="posMem" items="${posMem}">
						${posMem.key} :${posMem.value}명 
					</c:forEach> <br /> 참여 ${fn:length(gMem)}<br /> <c:forEach var="gMem" items="${gMem}">
						${gMem.nickname}     
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td>
					<h2>Gallery</h2>
					<table>
						<c:forEach var="gList" items="${gList}">
							<c:if test="${!empty gList.pRoot}">
								<tr>
									<td>사진1:<img src="/travelMaker/save/${glist.pRoot}" width="200" /> <br /> <!-- 사진안된다.. -->
									</td>
								</tr>
							</c:if>
							<c:if test="${empty gList.pRoot}">
								<h1>게시된 사진이 없습니다.</h1>
							</c:if>
						</c:forEach>
					</table>
				</td>
			</tr>

		</table>
	</c:if>





</div>
<!-- //wrapAll end -->

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->