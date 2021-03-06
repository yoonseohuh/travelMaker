<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="clientMenuWrap">
	<ul class="menu">
        <li><a href="/travelMaker/mem/index.tm">홈</a></li>
        <li><a href="/travelMaker/my/myPage.tm">내정보</a></li>
        <li><a href="/travelMaker/travel/makingList.tm">여행떠나기</a></li>
        <li><a href="/travelMaker/shared/sharedList.tm">여행공유</a></li>
        <li><a href="/travelMaker/land/landmark.tm">랜드마크</a></li>
        <li><a href="/travelMaker/mem/manual.tm">랭크/포지션 안내</a></li>
        <li><a href="/travelMaker/msg/message.tm">쪽지함</a></li>
        <c:if test="${sessionScope.memId == 'admin'}">
        	<li><a href="/travelMaker/admin/member.tm">관리자 페이지</a></li>
        </c:if>	
    </ul>
</div>

