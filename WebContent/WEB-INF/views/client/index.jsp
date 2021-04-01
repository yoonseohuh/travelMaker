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
            <div class="slide active" id="slide1" data-anchor="slide1">
                 <h1>2-1section</h1>
                 <h2>세션확인 :${sessionScope.memId}</h2> 
                 <h2>쿠키확인 :${cooMap.autoId}</h2>                 
            </div>
            <div class="slide" id="slide2" data-anchor="slide2">
                <h1>2-2section</h1>                
            </div>
            <div class="slide" id="slide3" data-anchor="slide3">
                <h1>2-3section</h1>
            </div>    
        </div>
        <div class="section" id="section2">
            <h1>3section</h1>
            <h2>test3</h2>
            <div class="quick quick1"></div>
            <div class="quick quick2"></div>
        </div>
        <div class="section" id="section3">
            <h1>4section</h1>
            <h2>test4</h2>
        </div>
        <div class="section" id="section4">
            <h1>5section</h1>
            <h2>test5</h2>
            <div style="height: 100vh;"></div>
            <jsp:include page="/WEB-INF/views/include/footer.jsp" />
			<!-- //footer end -->
        </div>
    </div>
    <script type="text/javascript">
        var myFullpage = new fullpage('#fullpage', {
        	v2compatible: true,
            sectionsColor: ['#eee', '#4BBFC3', '#7BAABE', 'whitesmoke', '#ccddff'],
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