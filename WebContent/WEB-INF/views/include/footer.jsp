<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<ul class="footer">
		<li>
		   <ul class="icon">
			  <li></li>
			  <li></li>
			  <li></li>
		   </ul>
		   <div class="info">
		   	  <p class="sub">Member</p>
			  <p>이승민 조윤호 정보름 이승헌 허윤서</p>
			  <p>서울시 관악구 남부순환로 1820,에그엘로우14층</p>
		   </div>
		</li>
		<li class="middle">
		   <p class="sub">Service Center</p>
		   <p class="ph">1577-1577</p>
		</li>
		<li>
		   <select class="sel_portfolio">
			  <!-- <option defaultValue="Family Site">Family Site</option>
			  <option value="포폴1">GITHUB</option>
			  <option value="포폴2">Americano</option> -->
		   </select>
		</li>
		<li>
		   <p>ⓒ 2021 Travel Maker Co., Ltd. All Rights Reserved.</p>
		</li>
	</ul>
	<!-- //footer end -->
	
	<div id="divView" style="position:absolute; display:none; background-color:#ffffff; border:solid 2px #d0d0d0; width:150px; height:50px; padding: 5px 15px 0;"></div>
	<script>
	$('.clickMenu').click(function(e) {
		var divTop = e.pageY - 40; //상단 좌표 위치 안맞을시 e.pageY
		var divLeft = e.pageX; //좌측 좌표 위치 안맞을시 e.pageX
		var serial = $(this).attr("serial");
		var idx = $(this).attr("idx");
		var userId = $('.clickId').val();
		console.log(userId);
		$('#divView').empty().append('<div style="position:absolute;top:5px;right:5px"><span id="close" style="cursor:pointer;font-size:1.5em" title="닫기">x</span> </div><a href="/travelMaker/mem/userHistory.tm?userId='+userId+'">이력보기</a><br/><a href="/travelMaker/msg/messageWrite.tm?receiver='+userId+'">쪽지 보내기</a>');
		$('#divView').css({
			"top": divTop,
			"left": divLeft,
			"position": "absolute",
			"z-index" : "996"
		}).show();
		$('#close').click(function(){document.getElementById('divView').style.display='none'});
	});
	
	AOS.init({
	  easing: 'ease-in-out-sine'
	});
	</script>

</body>
</html>