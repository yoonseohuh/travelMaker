<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div id="transcroller-body" class="wrapAll client">
		<script>		
			function validation(){
				var inputs = document.searchForm;
				if(!inputs.startD.value){
					alert("시작일을 선택해주세요");
					return false;
				}
				if(!inputs.endD.value){
					alert("종료일을 선택해주세요");
					return false;
				}
			}
		
			$(document).ready(function(){
				
				$('#startD').datepicker({
					showOn: "both",
					buttonText: "날짜선택",
					dateFormat: "yymmdd",
					changeMonth: true,
					onClose: function(selectedDate) {    
						$("#endD").datepicker("option","minDate",selectedDate);	//종료일의 최소일은 시작일
					}  
				});
				$('#endD').datepicker({
					showOn: "both",
					buttonText: "날짜선택",
					dateFormat: "yymmdd",
					changeMonth: true,
					onClose: function(selectedDate) {
						$("#startD").datepicker("option","maxDate",selectedDate);	//시작일의 최대일은 종료일
					}
				});
			});
		</script>
		<!-- search script end -->
		
		<div class="makingListWrap">
		
			<c:if test="${id==null}">
			<div class="titWrap">
				<p class="tit2" data-aos="fade-right" data-aos-duration="400">로그인하시면 여행에 함께할 수 있습니다!</p>
				<img src="<c:url value="/resources/images/makingico.png" />" />
			</div>
			</c:if>
			<c:if test="${id!=null}">
			<div class="titWrap">
				<p class="tit2" data-aos="fade-right" data-aos-duration="400">[${rkInfo.rkName}] ${id}님 환영합니다!</p>
				<c:if test="${rkInfo.rkNo==1}">
				<p class="tit2" data-aos="fade-right" data-aos-delay="200" data-aos-duration="400">가이드와 함께 하는 여행에 참여해볼까요?</p>			
				<div class="goMake">
					<img src="<c:url value="/resources/images/makingico2.png" />" class="bag bag2" data-aos="fade-down" data-aos-delay="200" data-aos-duration="400" />		
				</div>
				</c:if>
				<c:if test="${rkInfo.rkNo>1}">
				<p class="tit2" data-aos="fade-right" data-aos-delay="200" data-aos-duration="400">직접 여행 만들고 리더가 되어볼까요?</p>
				<div class="goMake">
					<a href="/travelMaker/travel/makingWrite.tm"></a>
					<p class="txt">Click to making!</p>
					<img src="<c:url value="/resources/images/makingico1.png" />" class="bag" data-aos="fade-down" data-aos-delay="200" data-aos-duration="400" />			
					<img src="<c:url value="/resources/images/makingico_sh.png" />" class="bagsh" data-aos="fade-down" data-aos-delay="200" data-aos-duration="400" />
				</div>
				</c:if>
				<p class="myMakeBtn">현재 나의 여행 한눈에 보기<span></span></p>
				<script>
					$('.myMakeBtn').click(function(){
						$('.myMake').fadeToggle(400);
						$(this).toggleClass('on');
					});
				</script>
			</div>
			</c:if>

			<div class="myMake">
				<p class="tit">승인대기 중</p>
				<c:if test="${fn:length(waitingList)==0}">
				<p class="txt">승인대기 중인 여행이 없습니다.</p>
				</c:if>
				<c:if test="${fn:length(waitingList)>0}">
				<ul class="list">
					<c:forEach var="wArticle" items="${waitingList}">
					<li>
						<a href="makingCont.tm?gNo=${wArticle.gNo}"></a>
						<p class="sub">${wArticle.subject}</p>
					</li>
					</c:forEach>
				</ul>
				</c:if>
				
				<p class="tit">참여 중</p>
				<c:if test="${fn:length(joiningList)==0}">
				<p class="txt">참여 중인 여행이 없습니다.</p>
				</c:if>				
				<c:if test="${fn:length(joiningList)>0}">
				<ul class="list">
					<c:forEach var="jArticle" items="${joiningList}">
					<li>
						<a href="groupSpace.tm?gNo=${jArticle.gNo}"></a>
						<p class="sub">${jArticle.subject}</p>
					</li>
					</c:forEach>
				</ul>
				</c:if>			
			</div>
			
			<div class="searchMake">
				<div class="inner">
					<!-- 검색창 -->
					<form id="searchForm" name="searchForm" onsubmit="return validation()" method="post" action="makingList.tm">			
						<div class="dp">날짜검색 : &nbsp;&nbsp;&nbsp;<input type="text" id="startD" name="startD" placeholder="출발일 선택"/></div>
						<div class="dp">-</div>
						<div class="dp"><input type="text" id="endD" name="endD" placeholder="도착일 선택"/></div>
						<div class="sc"><input type="submit" value=""/></div>
					</form>
				</div>
			</div>
			
			<c:if test="${count==0 || count==null}">
				<h2>모집 중인 여행이 없습니다</h2>
			</c:if>			
	
			<c:if test="${count>0}">
				<div id="list">
					<div id="articleTable">				
						<ul class="makingList">
							<c:forEach var="article" items="${articleList}" varStatus="status">
							<li>
								<a href="makingCont.tm?gNo=${article.gNo}&pageNum=${pageNum}"></a>
								<%-- <p class="no">${number}</p><c:set var="number" value="${number-1}"/> --%>
								<p class="tit">${article.subject}<span></span></p>
								<p class="date">${article.startDate}~${article.endDate}</p>
								<p class="date2">[마감일 : ${article.closingDate}]</p>
								<p class="txt">${article.courseExpl}</p>
								<p class="maker">방장 : ${article.id}</p>
								<p class="cost">예산 : ${article.cost}원</p>
								<c:if test="${article.dongsung==1}">
									<p class="gen"><span class="c-red">동성만</span></p>
								</c:if>
								<c:if test="${article.dongsung==0}">
									<p class="gen"></p>
								</c:if>							
							</li>
							</c:forEach>
						</ul>					
					</div> 
				</div>
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
					<c:if test="${startD!=null && endD!=null}">
						<c:if test="${startPage>pageBlock}">
							<a href="makingList.tm?pageNum=${startPage-pageBlock}&startD=${startD}&endD=${endD}"> &lt; </a>
						</c:if>				
					</c:if>				
					<c:if test="${startD==null || endD==null}">
						<c:if test="${startPage>pageBlock}">
							<a href="makingList.tm?pageNum=${startPage-pageBlock}"> &lt; </a>
						</c:if>
					</c:if>
					<!-- 페이지번호 리스트 -->				
					<c:if test="${startD!=null && endD!=null}">
						<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
							<a href="makingList.tm?pageNum=${i}&startD=${startD}&endD=${endD}">&nbsp; ${i} &nbsp;</a>
						</c:forEach>
					</c:if>
					<c:if test="${startD==null || endD==null}">
						<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
							<a href="makingList.tm?pageNum=${i}">&nbsp; ${i} &nbsp;</a>
						</c:forEach>
					</c:if>
					<!-- 뒤로 가는 기호 -->				
					<c:if test="${startD!=null && endD!=null}">
						<c:if test="${endPage<pageCount}">
							<a href="makingList.tm?pageNum=${startPage+pageBlock}&startD=${startD}&endD=${endD}"> &gt; </a>
						</c:if>
					</c:if>
					<c:if test="${startD==null || endD==null}">
						<c:if test="${endPage<pageCount}">
							<a href="makingList.tm?pageNum=${startPage+pageBlock}"> &gt; </a>
						</c:if>
					</c:if>
				</div>
				<!-- pageNumbers end -->			
			</c:if>
		</div>
		<!-- //mListWrap end -->
	</div>
	<!-- //wrapAll end -->
	
	<script>
	AOS.init({
		easing: 'ease-in-out-sine'
	});
	</script>
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->