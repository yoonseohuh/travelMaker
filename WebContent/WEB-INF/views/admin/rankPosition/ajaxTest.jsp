<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/adminMenu.jsp" />
	<!-- //adminMenu end -->
	<script>
		$(document).ready(function(){
			$('#posCate').change(function(event){
				event.preventDefault();
				var data = {};
				$.each($(this).serializeArray(), function(index, i){
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
						console.log(posSel.test)
						console.log(posSel.sPosList[0].posName)
					}					
				});
			});
		});
   	</script>
	<div class="wrapAll admin">
		<h2>hi</h2>
	</div>
	<!-- //wrapAll end -->
	
</body>
</html>
