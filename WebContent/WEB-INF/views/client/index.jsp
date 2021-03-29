<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<jsp:include page="/WEB-INF/views/include/top_index.jsp" />
	<!-- //top end -->
	
	<div class="wrapAll">
	
		<ul id="menu">
	        <li data-menuanchor="firstPage" class="active"><a href="#firstPage">1st slide</a></li>
	        <li data-menuanchor="secondPage"><a href="#secondPage">2nd slide</a></li>
	        <li data-menuanchor="3rdPage"><a href="#3rdPage">3rd slide</a></li>
	        <li data-menuanchor="4thpage"><a href="#4thpage">4th slide</a></li>
	        <li data-menuanchor="lastPage"><a href="#lastPage">5th slide</a></li>
	    </ul>
	    <div id="fullpage">
	        <div class="section active" id="section0">
	            <h1>Section 1</h1>
	            <h2>세션확인 :${sessionScope.memId}</h2>  
	        </div>
	        <div class="section" id="section1">
	            <div class="slide active" id="slide1" data-anchor="slide1">
	                <h1>2-1section</h1>
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
	        </div>
	        <div class="section" id="section3">
	            <h1>4section</h1>
	            <h2>test4</h2>
	        </div>
	        <div class="section" id="section4">
	            <h1>5section</h1>
	            <h2>test5</h2>
	        </div>
	    </div>
	    <script type="text/javascript">
	        var myFullpage = new fullpage('#fullpage', {
	            sectionsColor: ['#1bbc9b', '#4BBFC3', '#7BAABE', 'whitesmoke', '#ccddff'],
	            anchors: ['firstPage', 'secondPage', '3rdPage', '4thpage', 'lastPage'],
	            menu: '#menu',
	            navigation:true,
	            navigationTooltips: ['Page 1', 'Page 2', 'Page 3', 'Page 4', 'Page 5'],
	            showActiveTooltip: true,
	            slidesNavigation: true,
	            // lazyLoad: true
	        });
	    </script>
	</div>
	<!-- //wrapAll end -->