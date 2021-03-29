<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
		<script>
			$(document).ready(function(){
				
				$('#startD').datepicker({
					showOn: "both",
					buttonText: "날짜선택",
					dateFormat: "yymmdd",
					changeMonth: true
				});
				$('#endD').datepicker({
					showOn: "both",
					buttonText: "날짜선택",
					dateFormat: "yymmdd",
					changeMonth: true
				});
				
				$('#searchForm').submit(function(event){
					event.preventDefault();
					var data = {};
					$.each($(this).serializeArray(), function(index, i){
						data[i.name] = i.value;
					});
					
					$.ajax({
						url: "/travelMaker/travel/listSearch.tm",
						type: "POST",
						dataType: "json",
						contentType: "application/json",
						data: JSON.stringify(data),
						success: function(res){
							var searchValues = JSON.parse(res);
							console.log(searchValues);
							console.log(searchValues.articleList[0].subject);
							$('#articleTable').remove();
							$('.pageNumbers').remove();
							$('#searchTable').remove();
							$('#list').append("<table id=\"searchTable\"><thead><tr><th>개설자</th><th>동성필터</th><th>여행제목</th></tr></thead><tbody>");
							for(var i=0 ; i<searchValues.articleList.length ; i++ ){
								$('#list').append("<tr><td>"+searchValues.articleList[i].id+"</td>");
								$('#list').append("<td>"+searchValues.articleList[i].dongsung+"</td>");
								$('#list').append("<td><a href=\"makingCont.tm?gNo="+searchValues.articleList[i].gNo+"\">"+searchValues.articleList[i].subject+"</a></td></tr>");
							}
							$('#list').append("</tbody></table>");
							
						}
					});
				});
			});
		</script>
		<!-- search script end -->

		<h1>Making List</h1>
		
		<c:if test="${id==null}">
			로그인하시면 여행에 함께할 수 있습니다!	
		</c:if>
		<c:if test="${id!=null}">
			${id}님 환영합니다!
			<c:if test="${rkInfo.rkNo==1}">
			${rkInfo.rkName} 단계에서는 아직 여행을 만들 수 없어요. 가이드와 함께 하는 여행에 참여해볼까요?			
			</c:if>
			<c:if test="${rkInfo.rkNo>1}">
				${rkInfo.rkName} 단계이시군요! 직접 여행을 만들어볼까요?
				<input type="button" value="여행 만들기" onclick="window.location='/travelMaker/travel/makingWrite.tm'"/>
			</c:if>
		</c:if>
		
		<h2>대기 중인 여행</h2>
		<c:if test="${fn:length(waitingList)==0}">
			대기 중인 여행이 없습니다.
		</c:if>
		<c:if test="${fn:length(waitingList)>0}">
			<c:forEach var="wArticle" items="${waitingList}">
				<a href="makingCont.tm?gNo=${wArticle.gNo}">${wArticle.subject}</a>
			</c:forEach>
		</c:if>
		
		<h2>참여 중인 여행</h2>
		<c:if test="${fn:length(joiningList)==0}">
			참여 중인 여행이 없습니다.
		</c:if>
		<c:if test="${fn:length(joiningList)>0}">
			<c:forEach var="jArticle" items="${joiningList}">
				<a href="groupSpace.tm?gNo=${jArticle.gNo}">${jArticle.subject}</a>
			</c:forEach>
		</c:if>
		
		<h2>모집 중인 여행</h2>
		<c:if test="${count==0 || count==null}">
			<h2>모집 중인 여행이 없습니다</h2>
		</c:if>
		
		<!-- 검색창 -->
		<form id="searchForm" method="post">
			IN <input type="text" id="startD" name="startD"/>
			OUT <input type="text" id="endD" name="endD"/>
			<input type="submit" value="검색"/>
		</form>

		
		<c:if test="${count>0}">
			<div id="list">
				<div id="articleTable">				
					<ul class="makingList">
						<c:forEach var="article" items="${articleList}" varStatus="status">
						<li>
							<a href="makingCont.tm?gNo=${article.gNo}&pageNum=${pageNum}"></a>
							<p class="no">${number}</p><c:set var="number" value="${number-1}"/>
							<p class="tit">${article.subject}</p>
							<p class="date">${article.startDate}~${article.endDate}</p>
							<p class="maker">${article.id}</p>
							<c:if test="${article.dongsung==1}">
								<p class="gen">동성만</p>
							</c:if>
							<c:if test="${article.dongsung==0}">
								<p class="gen">성별 무관</p>
							</c:if>							
						</li>
						</c:forEach>
					</ul>					
				</div> 
			</div>
			현재 페이지: ${pageNum}
			<div class="pageNumbers">
				<c:set var="pageBlock" value="5"/>
				<fmt:parseNumber var="res" value="${count/pageSize}" integerOnly="true"/>
				<c:set var="pageCount" value="${res+(count%pageSize==0 ? 0 : 1)}"/>
				<fmt:parseNumber var="result" value="${(currPage-1)/pageBlock}" integerOnly="true"/>
				<c:set var="startPage" value="${result*pageBlock+1}"/>
				<c:set var="endPage" value="${startPage+pageBlock-1}"/>
				<c:if test="${endPage>pageCount}">
					<c:set var="endPage" value="${pageCount}"/>
				</c:if>
				
				<!-- 앞으로 가는 기호 -->
				<c:if test="${startPage>pageBlock}">
					<a href="makingList.tm?pageNum=${startPage-pageBlock}"> &lt; </a>
				</c:if>
				<!-- 페이지번호 리스트 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<a href="makingList.tm?pageNum=${i}">&nbsp; ${i} &nbsp;</a>
				</c:forEach>
				<!-- 뒤로 가는 기호 -->
				<c:if test="${endPage<pageCount}">
					<a href="makingList.tm?pageNum=${startPage+pageBlock}"> &gt; </a>
				</c:if>				
			</div>
			<!-- pageNumbers end -->
		</c:if>
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->