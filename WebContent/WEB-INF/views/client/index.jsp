<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->

    <div class="mainVisual">
		<div class="bg"></div>
	</div>
	<!-- //mainVisual end -->

	<div id="transcroller-body" class="wrapAll">

		<div class="rankM">
			<div class="rankBg" data-aos="fade-left" data-aos-duration="900"></div>
			<div class="titWrap">
				<p class="tit1" data-aos="fade-down" data-aos-duration="700">Rank-Position System</p>
				<p class="tit2" data-aos="fade-right" data-aos-duration="700">여행에 참여할수록, <span class="c-red">랭크(rank)</span>가 높아집니다.</p>
				<p class="tit2" data-aos="fade-right" data-aos-duration="700">더 높은 단계에 도전해보세요!</p>
				<p class="txt" data-aos="fade-right" data-aos-duration="700">힘차게 거친 용기가 싹이 이것이야말로 철환하였는가? 같이, 끓는 바로 것이다. 황금시대의 만천하의 없으면, 두기 인류의 찬미를 뜨고, 보라. 청춘에서만 그림자는 있는 얼마나 청춘 우는 듣는다. 못하다 같이, 청춘의 뿐이다. 크고 없으면, 인생의 할지니, 광야에서 듣는다. 그러므로 이것은 예수는 피가 곧 두기 이것이다. 찾아 없으면 우리는 남는 뿐이다. 돋고, 있는 충분히 그들의 품고 것이다.</p>
				<a href="/travelMaker/mem/manual.tm"><p class="gr">자세히보기<span></span></p></a>
			</div>
			
			<ul class="flow">				
				<li class="on" data-aos="zoom-in" data-aos-duration="500">
					<img src="<c:url value="/resources/images/rico1.png" />" />
					<p class="name">스타터</p>
					<!-- 
					<p class="txt">1인 여행 개설 가능</p>
					-->
					<p class="txt">생성된 여행에 참여 가능</p>
					<p class="rnext"></p>
				</li>
				<li data-aos="zoom-in" data-aos-delay="200" data-aos-duration="500">
					<img src="<c:url value="/resources/images/rico2.png" />" />
					<p class="name">트래블러</p>
					<p class="txt">여행 개설 가능</p>
					<p class="rnext"></p>
				</li>
				<li data-aos="zoom-in" data-aos-delay="400" data-aos-duration="500">
					<img src="<c:url value="/resources/images/rico3.png" />" />
					<p class="name">어드바이저</p>
					<p class="txt">1차 포지션 선택 가능</p>
					<!-- 
					<p class="txt">포지션 변경 가능</p>
					 -->
					<p class="rnext"></p>
				</li>
				<li data-aos="zoom-in" data-aos-delay="600" data-aos-duration="500">
					<img src="<c:url value="/resources/images/rico4.png" />" />
					<p class="name">마스터</p>
					<p class="txt">2차 포지션 추가 선택 가능</p>
					<!-- <p class="rnext"></p> -->
				</li>
				<!-- <li data-aos="zoom-in" data-aos-delay="600" data-aos-duration="500">
					<img src="/resources/images/rico5.png" />
					<p class="name">?</p>
					<p class="txt">추가 예정</p>
				</li>				 -->
			</ul>
			<div class="titWrap right">
				<p class="tit2" data-aos="fade-left" data-aos-duration="500"># 랭크가 올라갈수록</p>
				<p class="txt" data-aos="fade-left" data-aos-delay="200" data-aos-duration="500">다양한 권한이 부여됩니다.<br/>모두를 이끄는 멋진 리더가 되어보세요!</p>
			</div>
		</div>
		<!-- //rankM end -->

		<div class="posM">
			<div class="titWrap">				
				<p class="tit2" data-aos="fade-right" data-aos-duration="900">일정 랭크가 되면, <span class="c-red">포지션(position)</span>을 선택할 수 있습니다.</p>
				<p class="tit2" data-aos="fade-right" data-aos-delay="200" data-aos-duration="900">각 분야의 전문가와 함께 떠나보세요!</p>
				<p class="txt" data-aos="fade-right" data-aos-delay="400" data-aos-duration="900">헌법재판소 재판관은 정당에 가입하거나 정치에 관여할 수 없다. 모든 국민은 자기의 행위가 아닌 친족의 행위로 인하여 불이익한 처우를 받지 아니한다.</p>
				<!-- <a href="#" class="btnMore underline-from-left">DETAIL</a> -->
			</div>
			<div class="posSlide" data-aos="fade-in" data-aos-duration="500">
				<p id="posTit">사진 전문가</p>
				<ul class="cont">
					<li>
						<img src="<c:url value="/resources/images/pbg1.jpg" />" />
						<div class="txtWrap">
							<p class="tit">Restaurant</p>
							<p class="txt">맛있는 식당을 찾는 전문가인 당신!<br/>팀원들의 위장을 책임지세요.</p>
						</div>
					</li>
					<li>
						<img src="<c:url value="/resources/images/pbg2.jpg" />" />
						<div class="txtWrap">
							<p class="tit">Accommodation</p>
							<p class="txt">맛있는 식당을 찾는 전문가인 당신!<br/>팀원들의 위장을 책임지세요.</p>
						</div>
					</li>
					<li>
						<img src="<c:url value="/resources/images/pbg3.jpg" />" />
						<div class="txtWrap">
							<p class="tit">Tourist</p>
							<p class="txt">맛있는 식당을 찾는 전문가인 당신!<br/>팀원들의 위장을 책임지세요.</p>
						</div>
					</li>
					<li>
						<img src="<c:url value="/resources/images/pbg4.jpg" />" />
						<div class="txtWrap">
							<p class="tit">Transportation</p>
							<p class="txt">맛있는 식당을 찾는 전문가인 당신!<br/>팀원들의 위장을 책임지세요.</p>
						</div>
					</li>
					<li class="on">
						<img src="<c:url value="/resources/images/pbg5.jpg" />" />
						<div class="txtWrap">
							<p class="tit">Photo</p>
							<p class="txt">맛있는 식당을 찾는 전문가인 당신!<br/>팀원들의 위장을 책임지세요.</p>
						</div>
					</li>
					<li>
						<img src="<c:url value="/resources/images/pbg6.jpg" />" />
						<div class="txtWrap">
							<p class="tit">Hidden</p>
							<p class="txt">맛있는 식당을 찾는 전문가인 당신!<br/>팀원들의 위장을 책임지세요.</p>
						</div>
					</li>						
				</ul>
				<script>
					$('.posSlide > .cont > li').click(function(){
						$(this).nextAll().removeClass('on');
						$(this).prevAll().removeClass('on');
						$(this).addClass('on');
					});
					$('.posSlide > .cont > li').eq(0).click(function(){
						$('#posTit').html('맛집 전문가');
						$('#posTit').css('left','100px');
					});
					$('.posSlide > .cont > li').eq(1).click(function(){
						$('#posTit').html('숙박 전문가');
						$('#posTit').css('left','calc(7.2% + 100px)');
					});
					$('.posSlide > .cont > li').eq(2).click(function(){
						$('#posTit').html('관광지 전문가');
						$('#posTit').css('left','calc(14.4% + 100px)');
					});
					$('.posSlide > .cont > li').eq(3).click(function(){
						$('#posTit').html('교통 전문가');
						$('#posTit').css('left','calc(21.6% + 100px)');
					});
					$('.posSlide > .cont > li').eq(4).click(function(){
						$('#posTit').html('사진 전문가');
						$('#posTit').css('left','calc(28.8% + 100px)');
					});
					$('.posSlide > .cont > li').eq(5).click(function(){
						$('#posTit').html('히든 전문가');
						$('#posTit').css('left','calc(36% + 100px)');
					});
				</script>
			</div>
		</div>
		<!-- //posM end -->
		
		<div class="travelM">
			<div class="titWrap">
				<p class="tit1" data-aos="fade-right" data-aos-duration="700">Let's go!</p>
				<p class="tit2" data-aos="fade-right" data-aos-duration="700">이제 떠날 준비가 되셨나요?<br/>현재 개설된 여행을 확인하고, 참여해보세요!</p>				
			</div>
			<div class="tListWrap">
				<ul class="tList">
					<li data-aos="fade-up" data-aos-duration="700">
						<img src="<c:url value="/resources/images/tl1.jpg" />" />
						<p class="tit">두근두근 긴장감 넘치는 모험</p>
						<p class="txt">추운 겨울을 보내고, 싱그럽고, 푸른 생기의 물이 오르는 3월의 대표색은 보기만 해도 싱그러운 #풋사과연두색과 새 꿈, 새 희망의 기운이 느껴지는 #푸른꿈색입니다</p>
					</li>
					<li data-aos="fade-up" data-aos-duration="700">
						<img src="<c:url value="/resources/images/tl2.jpg" />" />
						<p class="tit">익스트림 레저 스포츠</p>
						<p class="txt">추운 겨울을 보내고, 싱그럽고, 푸른 생기의 물이 오르는 3월의 대표색은 보기만 해도 싱그러운 #풋사과연두색과 새 꿈, 새 희망의 기운이 느껴지는 #푸른꿈색입니다</p>
					</li>
				</ul>
				<ul class="tList tListR">
					<li data-aos="fade-up" data-aos-duration="700">
						<img src="<c:url value="/resources/images/tl3.jpg" />" />
						<p class="tit">추억에 남을 친구와의 여행</p>
						<p class="txt">추운 겨울을 보내고, 싱그럽고, 푸른 생기의 물이 오르는 3월의 대표색은 보기만 해도 싱그러운 #풋사과연두색과 새 꿈, 새 희망의 기운이 느껴지는 #푸른꿈색입니다</p>
					</li>
					<li data-aos="fade-up" data-aos-duration="700">
						<img src="<c:url value="/resources/images/tl4.jpg" />" />
						<p class="tit">함께 떠나는 맛집 탐방!</p>
						<p class="txt">추운 겨울을 보내고, 싱그럽고, 푸른 생기의 물이 오르는 3월의 대표색은 보기만 해도 싱그러운 #풋사과연두색과 새 꿈, 새 희망의 기운이 느껴지는 #푸른꿈색입니다</p>
					</li>
					<a href="/travelMaker/travel/makingList.tm"><p class="gr">바로가기<span></span></p></a>
				</ul>
			</div>			
		</div>
		<!-- //travelM end -->

		<div class="landM">
			<div class="landBg">
			   <div class="left"></div>
			   <div class="right"></div>
			</div>
			<div class="cont">
			   <p class="tit">
				  LAND<br/>MARK
			   </p>
			   <div class="map">
				  <img src="<c:url value="/resources/images/landbg.png" />">
			   </div>
			   <div class="info">
					 <p class="landname">나만의 랜드마크</p>
					 <p class="txt">모험자들이 선정한 지역 명소!<br/>
						숨겨져 있는 장소들을 탐험해보세요
					 </p>
					 <div class="arrow">
						<a href="#">랜드마크 바로가기</a>
					 </div>
			   </div>
			</div>
		</div>
		<!-- //land end -->
		
	</div>
	<!-- //wrapAll end -->
	
	<script>
		$(document).ready(function() {
			$('.mainVisual .tit1').fadeIn(1000);
        	$('.mainVisual .tit2').delay(200).fadeIn(1000);
		});
		var myPlugin = {
	      name: 'debugger',
	      params: {
	        debugger: false,
	      },
	      on: {
	        slideChange: function() {
	          if (!this.params.debugger) return;
	          console.log('slideChange', this.previousIndex, '->', this.activeIndex);
	          $('.mainVisual .tit1').hide();
    	  	  $('.mainVisual .tit2').hide();
    	  	  $('.mainVisual .tit1').fadeIn(1000);
    	  	  $('.mainVisual .tit2').delay(200).fadeIn(1000);
	        },
	      }
	    };
	    
	    Swiper.use(myPlugin);
		var swiper = new Swiper('.mainVisual', {
			pagination: {
		        el: '.mainVisual-pagination',
		    },
		    navigation: {
		        nextEl: '.swiper-button-next',
		        prevEl: '.swiper-button-prev',
		    },
			slidesPerView: 1,
			debugger: true,
		});		
	</script>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />