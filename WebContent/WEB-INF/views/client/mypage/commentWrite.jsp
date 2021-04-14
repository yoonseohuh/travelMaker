<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/header.jsp" />



<body>
   
	<jsp:include page="/WEB-INF/views/include/top.jsp" />
	<!-- //top end -->
	
	<div class="myPageWrap">
	
	<c:if test="${sessionScope.memId==null}">
		<script>
			alert("로그인 후에 접근 가능합니다");
			location.href='/travelMaker/mem/loginForm.tm';
		</script>
	</c:if>
	
	<h4>${fin}</h4>
		<select id="group">
			<option>group</option>
		</select>

   		<select id="group_depth">
   			<option>group_depth</option>
   		</select>
   
  		<script type="text/javascript"> 
		$(document).ready(function() {
		    var groupArray = new Array();
		    var groupObject = new Object();
		    
		    groupObject = new Object();
		    groupObject.main_category_id = "1";
		    groupObject.main_category_name = "스포츠";
		    groupArray.push(groupObject);
		    
		    groupObject = new Object();
		    groupObject.main_category_id = "2";
		    groupObject.main_category_name = "공연";
		    groupArray.push(groupObject);
		    
		    //Sub 카테고리 셋팅 (DB에서 값을 가져와 셋팅 하세요.)
		    var group_depthArray = new Array();
		    var group_depthObject = new Object();
		    
		    //스포츠에 해당하는 sub category 리스트
		    group_depthObject = new Object();
		    group_depthObject.main_category_id = "1";
		    group_depthObject.sub_category_id = "1"
		    group_depthObject.sub_category_name = "야구"    
		    group_depthArray.push(group_depthObject);
		    
		    group_depthObject = new Object();
		    group_depthObject.main_category_id = "1";
		    group_depthObject.sub_category_id = "2"
		    group_depthObject.sub_category_name = "농구"    
		    group_depthArray.push(group_depthObject);
		    
		    group_depthObject = new Object();
		    group_depthObject.main_category_id = "1";
		    group_depthObject.sub_category_id = "3"
		    group_depthObject.sub_category_name = "축구"    
		    group_depthArray.push(group_depthObject);
		    
		    //공연에 해당하는 sub category 리스트
		    group_depthObject = new Object();
		    group_depthObject.main_category_id = "2";
		    group_depthObject.sub_category_id = "1"
		    group_depthObject.sub_category_name = "연극"    
		    group_depthArray.push(group_depthObject);
		    
		    group_depthObject = new Object();
		    group_depthObject.main_category_id = "2";
		    group_depthObject.sub_category_id = "2"
		    group_depthObject.sub_category_name = "뮤지컬"    
		    group_depthArray.push(group_depthObject);
		    
		    group_depthObject = new Object();
		    group_depthObject.main_category_id = "2";
		    group_depthObject.sub_category_id = "3"
		    group_depthObject.sub_category_name = "오페라"    
		    group_depthArray.push(group_depthObject);
		    
		    group_depthObject = new Object();
		    group_depthObject.main_category_id = "2";
		    group_depthObject.sub_category_id = "4"
		    group_depthObject.sub_category_name = "콘서트"    
		    group_depthArray.push(group_depthObject);
		    //****************이부분은 DB로 셋팅하세요.
		    
		    
		    //메인 카테고리 셋팅
		    var groupSelectBox = $("select[name='group']");
		    
		    for(var i=0;i<${group};i++){
		        groupSelectBox.append("<option value='"+${group[i]}.main_category_id+"'>"+${group[i]}.main_category_name+"</option>");
		    }
		    
		    //*********** 1depth카테고리 선택 후 2depth 생성 START ***********
		    $(document).on("change","select[name='group']",function(){
		        
		        //두번째 셀렉트 박스를 삭제 시킨다.
		        var group_depthSelectBox = $("select[name='group_depth']");
		        group_depthSelectBox.children().remove(); //기존 리스트 삭제
		        
		        //선택한 첫번째 박스의 값을 가져와 일치하는 값을 두번째 셀렉트 박스에 넣는다.
		        $("option:selected", this).each(function(){
		            var selectValue = $(this).val(); //main category 에서 선택한 값
		            group_depthSelectBox.append("<option value=''>전체</option>");
		            for(var i=0;i<group_depthArray.length;i++){
		                if(selectValue == group_depthArray[i].main_category_id){
		                    
		                    group_depthSelectBox.append("<option value='"+group_depthArray[i].sub_category_id+"'>"+group_depthArray[i].sub_category_name+"</option>");
		                    
		                }
		            }
		        });
		        
		    });
		    //*********** 1depth카테고리 선택 후 2depth 생성 END ***********
		        
		});
		</script>

  
	</div>
	<!-- //wrapAll end -->

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- //footer end -->
   
</body>
</html>