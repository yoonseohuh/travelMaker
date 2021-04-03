<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll client">
		<script>
		//	버튼 클릭 시 makingList.tm의 내용을 불러오는 페이지!
			$(document).ready(function(){
				$('#execute').click(function(){
					var xhr = new XMLHttpRequest();
					xhr.open('POST','../travel/makingList.tm');
					xhr.onreadystatechange=function(){
						if(xhr.readyState===4 && xhr.status===200){
							document.querySelector('#here').innerHTML = xhr.responseText;
						}
					}
					xhr.send();
				});
			});
		</script>
		
		<p>여기에 불러와보자:<span id="here"></span></p>
		<input type="button" id="execute" value="버튼"/>
		
	</div>
	<!-- //wrapAll end -->
	
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->