<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
    .menu a{cursor:pointer;}
    .menu .hide{display:none;}
</style>

<script>
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
</script>
</head>
<body>

	<c:if test="${count == 0}">
		여행목록이 없다.
		여행떠나라
	</c:if>
	
	
	
	<h1>comment</h1>
	<a id="tab1">조회</a> | <a id="tab2">작성</a>
	
	<div id="cont1">
		<h1>너에게 난..?</h1>
		<div>
		    <ul>
		        <li class="menu">
		            <a>전주여행</a>
		            <ul class="hide">
		                <li>메뉴1-1</li>
		                <li>메뉴1-2</li>
		                <li>메뉴1-3</li>
		                <li>메뉴1-4</li>
		                <li>메뉴1-5</li>
		                <li>메뉴1-6</li>
		            </ul>
		        </li>
		  
		        <li class="menu">
		            <a>광명동굴탐험</a>
		            <ul class="hide">
		                <li>메뉴2-1</li>
		                <li>메뉴2-2</li>
		                <li>메뉴2-3</li>
		                <li>메뉴2-4</li>
		                <li>메뉴2-5</li>
		                <li>메뉴2-6</li>
		            </ul>
		        </li>
		    </ul>
		</div>
	</div>
	<div id="cont2">
		<h3>작성페이지</h3>
	</div>
	
	<script>
		$('#tab1').click(function(){
			$('#cont2').hide();
			$('#cont1').fadeIn();
		});
		$('#tab2').click(function(){
			$('#cont1').hide();
			$('#cont2').fadeIn();
		});
	</script>
</body>
</html>