<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<script>
		$(document).ready(function(){
			var ko=['비빔밥','불고기'];
			var ja=['초밥','소바'];
			$('.s0').change(function(){
				var sel = $(this).val();
				if(sel == 1){
					$.each(ko,function(i,item){
						$('.s1').append('<option class="op">'+item+'</option>');
					});
				}else{
					$.each(ja,function(i,item){
						
						$('.s1').append('<option class="op">'+item+'</option>');
					});
				}
			});			
			
		});	
	
	</script>



<body>
음식대분류
<select class="s0">
	<option> 선택하세요 </option>
	<option value="1">한식</option>
	<option value="2">일식</option>
</select>
음식소분류
<select class="s1">
	<option>선택해주세요</option>
</select>


</body>
</html>