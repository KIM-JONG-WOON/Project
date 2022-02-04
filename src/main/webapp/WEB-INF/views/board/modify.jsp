<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<%@include file = "../includes/jongwoon/header.jsp" %>




<div id="banner-area" class="banner-area" style="background-image:url(/resources/heejin/constra/images/banner/banner4.jpg)">
  <div class="banner-text">
    <div class="container">
        <div class="row">
          <div class="col-lg-12">
              <div class="banner-heading">
                <h1 class="banner-title" style="text-shadow: 4px 4px 3px #000;">GO 캠핑장 게시판</h1>
                <nav aria-label="breadcrumb">
								<ol class="breadcrumb justify-content-center">
									<!-- <li class="breadcrumb-item"><a href="#">Home</a></li>
                      <li class="breadcrumb-item"><a href="#">Company</a></li> -->
									<li class="breadcrumb-item active" aria-current="page" style="text-shadow: 4px 4px 3px #000;">Community</li>
								</ol>
							</nav>
              </div>
          </div><!-- Col end -->
        </div><!-- Row end -->
    </div><!-- Container end -->
  </div><!-- Banner text end -->
</div><!-- Banner area end --> 


  
<!-- 게시판-->
<section id="main-container" class="main-container">
  <div class="container">

    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div class="panel-heading">
            <div class="modify-see">
              <h4>게시글 보기</h4>
            </div>
          </div>
          <div class="panel-body">
            <form role="form" action="/board/modify" method="post">
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
            	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/> '>
            	<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/> '>
            	<input type='hidden' name='type' value='<c:out value="${cri.type }"/> '>
            	<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/> '>
            	
	            <div class="form-group">
	              <label>글번호</label> <input class="form-control" name="bno"
	              value='<c:out value="${board.bno}" />' readonly="readonly">
	            </div>
	            <div class="form-group">
	              <label>글제목</label> <input class="form-control" name="title"
	              value='<c:out value="${board.title}" />' >
	            </div>
	            <div class="form-group">
	              <label>내용</label><textarea class="form-control"  rows="3" name="content"><c:out value="${board.content}" /></textarea>
	            </div>
	            <div class="form-group">
	              <label>작성자</label> <input class="form-control" name="email"
	              value='<c:out value="${board.email}" />' readonly="readonly">
	            </div>
	            <div class="form-group">
	              <label>작성한 날짜</label> <input class="form-control" name="regDate" value='<fmt:formatDate pattern ="yyyy/MM/dd" value="${board.regdate }"/>' readonly="readonly">
	            </div>
	            <div class="form-group">
	              <label>수정한 날짜</label> <input class="form-control" name="updateDate" value='<fmt:formatDate pattern ="yyyy/MM/dd" value="${board.updateDate }"/>' readonly="readonly">
	            </div>
            </form>
              <!-- <div class="panel-body">
                <label>파일</label>
                <div class="form-group uploadDiv">
                  <input type="file" name='uploadFile' multiple="multiple">
                </div>
                <div class='uploadResult'>
                  <ul></ul>
                </div>
                <div class='bigPictureWrapper'>
                  <div class='bigPicture'></div>
   		        </div>
              </div> -->
            <div class="UploadF">
              <div class="form-button">
	            <button type="submit" data-oper='modify' class="btn btn-default">수정</button>
	            <button type="submit" data-oper="remove" class="btn btn-default">삭제</button>
	            <button type="submit" data-oper='list' class="btn btn-default">목록</button>
	            
	          </div>
	        </div>
          </div>
          <div class="panel-footer"></div>



    


  </div><!-- Container end -->
</section><!-- Main container end -->




<script type="text/javascript">
$(document).ready(function(){
	/*첨부파일  */
	
	(function(){
		var bno = '<c:out value="${board.bno}"/>';
		
		$.getJSON("/board/getAttachList",{bno:bno}, function(arr){
			
			var str="";
			
			$(arr).each(function(i, attach){
				
				if(attach.fileType){
					
					var fileCallPath = encodeURIComponent(
							attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
					str += "<li data-path='"+attach.uploadPath+"'data-uuid='"+attach.uuid+
					"' " 
					str +="data-filename'"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
					str += "<span>" + attach.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\'data-type='image'"
					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></btton><br>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str += "</li>";
				}else{
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
					str += "data-filename='"+attach.fileName+"'data-type='"+attach.fileType+"'><div>";
					str += "<span>" + attach.fileName+"</span><br/>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\'data-type='file'"
					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></btton><br>";
					str += "<img src='/resources/jongwoon/images/attach.png'></a>";
					str += "</div>";
					str += "</li>";
				}
			});
			
			
			$(".uploadResult ul").html(str);
		});
		
		
		$(".uploadResult").on("click","button", function(e){
			
			if(confirm("파일을 지우시겠습니까?")){
				var targetLi = $(this).closest("li");
				targetLi.remove();
			}
		});
	})();
	
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880;
	
	function checkExtension(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("파일크기 가 큽니다.");
			return false;
		}
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	$("input[type='file']").change(function(e){
		
		var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		
		for(var i=0; i< files.length; i++){
			if(!checkExtension(files[i].name,files[i].size)){
				return false;
			}
			formData.append("uploadFile",files[i]);
		}
		
		$.ajax({
			url: '/uploadAjaxAction',
		      processData: false, 
		      contentType: false,
		      beforeSend: function(xhr) {
		          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		      },
		      data:formData,
		      type: 'POST',
		      dataType:'json',
		        success: function(result){
		          console.log(result); 
				  showUploadResult(result); 
		        }
		});
	});
	
	function showUploadResult(uploadResultArr){
	    
	    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
	    
	    var uploadUL = $(".uploadResult ul");
	    
	    var str ="";
	    
	    $(uploadResultArr).each(function(i, obj){
	    	if(obj.image){
				var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
				str += "<li data-path='"+obj.uploadPath+"'";
				str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
				str +" ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' "
				str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/display?fileName="+fileCallPath+"'>";
				str += "</div>";
				str +"</li>";
			}else{
				var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
			    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			      
				str += "<li "
				str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
				str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/resources/jongwoon/img/attach.png'></a>";
				str += "</div>";
				str +"</li>";
			}
	    });
	    
	    uploadUL.append(str);
	 }
	
	var formObj = $("form");
	
	$('button').on("click",function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation==='remove'){
			formObj.attr("action", "/board/remove");
			
		} else if(operation==='list'){
			
			//list로 돌아가기
			formObj.attr("action","/board/list").attr("method","get");
			
			// hidden tag 복제
			var pageNumTag=$("input[name='pageNum']").clone();
			var amountTag=$("input[name='amount']").clone();
			var typeTag=$("input[name='type']").clone();
			var keywordTag=$("input[name='keyword']").clone();
			
			// form태그 내부 자식 태그 모두 삭제
			formObj.empty();
			
			// 다시 hidden tag 추가
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(typeTag);
			formObj.append(keywordTag);
	    }else if (operation === 'modify'){
	    	
	    	var str="";
	    	
	    	$(".uploadResutl ul li").each(function(i, obj){
	    		var jobj = $(obj);
	    		
	    		str += "<input type='hidden' name='attachList["+i+"].fileName' value='" +jobj.data("filename")+"'>";
	    		str += "<input type='hidden' name='attachList["+i+"].uuid'value='"+jobj.data("uuid")+"'>";
	    		str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	    		str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
	    		
	    	});
	    	formObj.append(str).submit();
	    }
		formObj.submit();
	});
});
</script>


<%@include file="../includes/jongwoon/footer.jsp" %>

