<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<jsp:include page="/WEB-INF/views/include/top.jsp" />
<!-- //top end -->

<div class="wrapAll">
	<h1>MyLand 페이지</h1>
	<a href="/travelMaker/land/landWrite.tm"><button>생성</button></a>
	
	<!-- 내가 작성한 랜드마크 -->
	<!-- lName, addr, lType, writer   -->
	<h3> 내가 작성한 랜드마크</h3>
	<table>
		<tr>
			<td>${myLand.lName}</td>
		</tr>
		<tr>
			<td>${myLand.addr}</td>
		</tr>
		<tr>
			<td>${myLand.lType}</td>
		</tr>
		<tr>
			<td>${myLand.writer}</td>
		</tr>
	</table>



	<!-- 내가 좋아요 한 랜드마크 -->




</div>
<!-- //wrapAll end -->

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->