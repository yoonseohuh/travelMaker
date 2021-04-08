<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top_index.jsp" />
	<!-- //top end -->

    <div id="fullpage">
    	<div class="section active" id="section0">    		
        	<div class="swiper-container mainSwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide bg1">
						<div class="titWrap">
							<p class="tit1">Let's Go Together!</p>
							<p class="tit1">Travel Maker</p>
							<p class="tit2">당신도 가이드가 될 수 있습니다!<br/>함께 만들어가는 여행 플랫폼</p>
						</div>
					</div>
					<div class="swiper-slide bg2">
						<div class="titWrap">
							<p class="tit1">Let's Go Together!</p>
							<p class="tit1">Travel Maker</p>
							<p class="tit2">당신도 가이드가 될 수 있습니다!<br/>함께 만들어가는 여행 플랫폼</p>
						</div>
					</div>
					<div class="swiper-slide bg3">
						<div class="titWrap">
							<p class="tit1">Let's Go Together!</p>
							<p class="tit1">Travel Maker</p>
							<p class="tit2">당신도 가이드가 될 수 있습니다!<br/>함께 만들어가는 여행 플랫폼</p>
						</div>
					</div>
				</div>
				<!-- Add Pagination -->
				<div class="mainSwiper-pagination swiper-pagination"></div>
				<!-- Add Arrows -->
			    <div class="swiper-button-next"></div>
			    <div class="swiper-button-prev"></div>
			</div>
			<div class="searchBar">
				<p class="open"></p>
			</div>		
        </div>        
        <div class="section" id="section1">
	        <div class="rankPos">
	        	<div class="titWrap">
					<p class="tit1">Rank/Position System</p>
					<p class="tit2">여행 횟수에 따라 랭크를 올려보세요</p>
				</div>
				<div class="rankFlow">
					<div class="step start">
						<div class="contWrap">
							<p class="rkCount">0회</p>
							<div class=".클래스">
								<img src="/travelMaker/resources/images/rico1.png" width="50px"/>
								스타터
							</div>
							<p class="rkCont">1인여행 개설 가능</p>
							<p class="rkCont">생성된 모험에 참여 가능</p>
						</div>
						<div class="rico">1</div>
					</div>
					<div class="step travel">
						<div class="contWrap">
							<p class="rkCount">10회</p>
							<p class="rkCont">포지션 설정 가능</p>
						</div>
						<div class="rico"></div>
					</div>
					<div class="step advise">
						<div class="contWrap">
							<p class="rkCount">25회</p>
							<p class="rkCont">여행 개설 가능</p>
							<p class="rkCont">포지션 변경 가능</p>
						</div>
						<div class="rico"></div>
					</div>
					<div class="step master">
						<div class="contWrap">
							<p class="rkCount">50회</p>
							<p class="rkCont">포지션 추가 가능</p>
						</div>
						<div class="rico"></div>
					</div>
				</div>
	        </div>
        </div>
        <div class="section" id="section2">
        	<br/><br/><br/><br/>
            <h1>3section</h1>
            <h1>여행 전체 리스트 박스박스</h1>
            <div class="quick quick1"></div>
            <div class="quick quick2"></div>
        </div>
        <div class="section" id="section3">
       		<br/><br/><br/><br/>
            <h1>4section</h1>
            <h1>코스공유 박스박스</h1>
        </div>
        <div class="section" id="section4">
        	<br/><br/><br/><br/>
            <h1>5section</h1>
           <h1>랜드마크</h1>
            <div style="height: 100vh;"></div>
            <jsp:include page="/WEB-INF/views/include/footer.jsp" />
			<!-- //footer end -->
        </div>
    </div>
    <script type="text/javascript">
        var myFullpage = new fullpage('#fullpage', {
        	v2compatible: true,
            sectionsColor: ['#eee', 'ffffff', '#7BAABE', 'whitesmoke', '#ccddff'],
            anchors: ['firstPage', 'secondPage', '3rdPage', '4thpage', 'lastPage'],            
            navigation:true,
            navigationTooltips: ['Page 1', 'Page 2', 'Page 3', 'Page 4', 'Page 5'],
            showActiveTooltip: true,
            slidesNavigation: true,
			scrollOverflow: true,
			afterLoad: function(index){
	           if(index == "firstPage"){
	        	   $("#fp-nav").fadeOut(100);
	           }else{
	        	   $("#fp-nav").fadeIn(300);
	           }
	        }
        });
        
        $(".searchBar").click(function(){
		    $(this).toggleClass("on");
		});
		$(document).ready(function() {
			$('.tit1').fadeIn(1000);
        	$('.tit2').delay(200).fadeIn(1000);
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
	          $('.tit1').hide();
    	  	  $('.tit2').hide();
    	  	  $('.tit1').fadeIn(1000);
    	  	  $('.tit2').delay(200).fadeIn(1000);
	        },
	      }
	    };
	    
	    Swiper.use(myPlugin);
		var swiper = new Swiper('.mainSwiper', {
			pagination: {
		        el: '.mainSwiper-pagination',
		    },
		    navigation: {
		        nextEl: '.swiper-button-next',
		        prevEl: '.swiper-button-prev',
		    },
			slidesPerView: 1,
			debugger: true,
		});
    </script>