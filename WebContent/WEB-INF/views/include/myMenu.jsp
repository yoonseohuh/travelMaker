<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<div id="myMenu">
            <ul class="menu">
                <li><a class="active" href="/travelMaker/my/myPage.tm">마이홈</a></li>
                <li><a href="/travelMaker/my/myHistory.tm">여행이력</a></li>
                <li><a href="/travelMaker/cmt/comment.tm" >코멘트 관리</a></li>
                <li><a href="/travelMaker/my/myLand.tm">나의 랜드마크</a></li>
                <li><a href="/travelMaker/mem/myModi.tm" >내정보 관리</a></li>
            </ul>
        </div>
        <script>
	        var nowUrl = window.location.pathname;
	    	console.log(nowUrl)
            if(nowUrl == "/travelMaker/my/myPage.tm"){
                $('#myMenu').children('.menu').children('li').eq(0).addClass('active');
            }else if(nowUrl == "/travelMaker/my/myHistory.tm"){
                $('#myMenu').children('.menu').children('li').eq(1).addClass('active');
            }else if(nowUrl == "/travelMaker/my/myHistoryCont.tm"){
                $('#myMenu').children('.menu').children('li').eq(1).addClass('active');
            }else if(nowUrl == "/travelMaker/cmt/comment.tm"){
                $('#myMenu').children('.menu').children('li').eq(2).addClass('active');
            }else if(nowUrl == "/travelMaker/my/myLand.tm"){
                $('#myMenu').children('.menu').children('li').eq(3).addClass('active');
            }else if(nowUrl == "/travelMaker/mem/myModi.tm"){
                $('#myMenu').children('.menu').children('li').eq(4).addClass('active');
            }
        </script>



