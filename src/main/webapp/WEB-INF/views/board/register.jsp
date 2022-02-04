<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  

<%@include file = "../includes/jongwoon/header.jsp" %>

<div id="banner-area" class="banner-area" style="background-image:url(/resources/heejin/constra/images/banner/banner1.jpg)">
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
        <div class="panel-heading"><h1>게시글 등록하기</h1></div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-md-12">
      <div class="panel panel-default">
        <div class="panel-body">
          <form role="form" action="/board/register" method="post">
          <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
          <div class="form-group">
              <label>작성자</label> <input class="form-control" name="email" value='<sec:authentication property="principal.username"/>' readonly="readonly">
            </div>
            <div class="form-group">
              <label>글 제목</label> <input class="form-control" name="title">
            </div>
            <div class="form-group">
              <label>글 내용</label> <textarea class="form-control" rows='5' name="content"></textarea>
            </div>

          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- <div class="row">
    <div class="col-md-12">
      <div class="panel panel-default">
        <div class="panel-heading">파일 첨부</div>
        <div class="panel-body">
          <div class="form-grop uploadDiv">
            <input type="file" name='uploadFile' multiple>
          </div>
          <div class='uploadResult'>
            <ul></ul>
          </div>
        </div>
      </div>
    </div>
  </div> -->
  <div class="row">
    <div class="col-md-12">
      <div class="panel panel-default text-right">
        <button type="submit" class="btn btn-primary">등록</button>
        
      </div>
    </div>
  </div>




  </div><!-- Container end -->
</section><!-- Main container end -->






<script>
$(document).ready(function(e){
	var formObj = $("form[role='form']");
	
	$("button[type='reset']").on("click", function(e){
		e.preventDefault();
		
	});
	
	$("button[type='submit']").on("click", function(e){
		e.preventDefault();
		
	    var str ="";
	    
	    $(".uploadResult ul li").each(function(i, obj){
	        
	        var jobj = $(obj);
	        
	        console.dir(jobj);
	        console.log("-------------------------");
	        console.log(jobj.data("filename"));
	        
	        
	        str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	        str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	        str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	        str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
	        
	      });
	      
	      console.log(str);
	      
	      formObj.append(str).submit();
	    
	});
	
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
	
	$(".uploadResult").on("click", "button", function(e){
	    
		console.log("delete file");
	      
	    var targetFile = $(this).data("file");
	    var type = $(this).data("type");
	    
	    var targetLi = $(this).closest("li");
	    
	    $.ajax({
			url: '/deleteFile',
			data: {fileName: targetFile, type:type},
			beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},

		dataType:'text',
		type: 'POST',
		
		success: function(result){
			alert(result);
			targetLi.remove();
		}
		}); //$.ajax
	});
	
});
</script>

<%@include file="../includes/jongwoon/footer.jsp" %>

