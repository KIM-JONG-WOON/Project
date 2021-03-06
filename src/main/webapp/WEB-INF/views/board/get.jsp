<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  

<%@include file = "../includes/jongwoon/header.jsp" %>




<div id="banner-area" class="banner-area" style="background-image:url(/resources/heejin/constra/images/banner/banner3.jpg)">
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
          <div class="panel-heading">게시글 보기</div>
          <div class="panel-body">
            <div class="form-group">
              <label>글번호</label> <input class="form-control" name="bno"
              value='<c:out value="${board.bno}" />' readonly="readonly">
            </div>
            <div class="form-group">
              <label>글제목</label> <input class="form-control" name="title"
              value='<c:out value="${board.title}" />' readonly="readonly">
            </div>
            <div class="form-group">
              <label>내용</label> <textarea class="form-control"  rows="3" name="content" readonly="readonly"><c:out value="${board.content}" /></textarea>
            </div>
            <div class="form-group">
              <label>작성자</label> <input class="form-control" name="email"
              value='<c:out value="${board.email}" />' readonly="readonly">
            </div>
            
            <div class="text-right">
            <sec:authentication property="principal" var="pinfo"/>
			<sec:authorize access="isAuthenticated()">						
				<c:if test="${pinfo.username eq board.email}">	
           			<button data-oper='modify' class="btn btn-dark" onclick="location.href='/board/modify?bno=<c:out value="${board.bno}"/>'">
            수정</button>
            	</c:if>
			</sec:authorize>
            <button data-oper='list' class="btn btn-dark" onclick="location.href='/board/list'">목록</button>
            </div>
            <form id="operForm" action="/board/modify" method="get">
                	<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno}"/>'>
					<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
                	<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
                	
                	<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
                	<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
            </form>
          </div>
        </div>
      </div>
    </div>
   
	<div class='bigPictureWrapper'>
	  <div class='bigPicture'>
  </div>
	</div>
   
   <hr>
    <div class="row">
      <div class="col-lg-12">
        <div class="panel panel-default"> 
          <div class="panel-heading">
            <i class="fa fa-comments fa-fw"></i>댓글
            <div class="text-right">
              <button id='addReplyBtn' class='btn btn-dark btn-xs pull-right'>+</button>
             </div>
          </div>
          <div class="panel-body">
            <ul class="chat">
              
            </ul>
          </div>
          <div class="panel-footer"></div>
        </div>
      </div>
    </div>
    
    
  </div><!-- Container end -->
</section><!-- Main container end -->

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
  aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
          aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">댓글 달기</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label>내용</label> 
          <input class="form-control" name='reply' value='New Reply!!!!'>
        </div>      
        <div class="form-group">
          <label>작성자</label> 
          <input class="form-control" name='replyer' value='replyer' readonly>
        </div>
        <div class="form-group">
          <label>Reply Date</label> 
          <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
        </div>
      </div>
	  <div class="modal-footer">
	  <sec:authentication property="principal" var="pinfo"/>
			<sec:authorize access="isAuthenticated()">						
				<c:if test="${pinfo.username eq board.email}">
	    <button id='modalModBtn' type="button" class="btn btn-default">수정</button>
	    <button id='modalRemoveBtn' type="button" class="btn btn-default">삭제</button>
	    </c:if>
	    </sec:authorize>
	    <button id='modalRegisterBtn' type="button" class="btn btn-default">등록</button>
	    <button id='modalCloseBtn' type="button" class="btn btn-default">취소</button>
	  </div>          
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->





<script type="text/javascript" src="/resources/jongwoon/js/reply.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click",function(e){
		
		operForm.attr("action","/board/modify").submit();
	});
	
	$("button[data-oper='list']").on("click",function(e){
		
		operForm.find("#bno").remove();
		operForm.attr("action","/board/list");
		operForm.submit();
	});
	
	var bnoValue = '<c:out value="${board.bno}"/>';
	var replyUL = $(".chat");
	
	showList(1);
	
    function showList(page){
    	
		console.log("show list " + page);
		replyService.getList({bno:bnoValue,page: page|| 1 }, function(replyCnt,list) {
			
			console.log("replyCnt: "+ replyCnt );
			console.log("list: " + list);
			console.log(list);
			
			if(page == -1){
				pageNum = Math.ceil(replyCnt/10.0);
				showList(pageNum);
				return;
			}
			
			var str="";
			
			if(list == null || list.length == 0){
				return;
			}
         
			for (var i = 0, len = list.length || 0; i < len; i++) {
				str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
				str +="  <div><div class='header'><strong class='primary-font'>["
				 +list[i].rno+"] "+list[i].replyer+"</strong>"; 
				str +="    <small class='pull-right text-muted'>"
				    +replyService.displayTime(list[i].replyDate)+"</small></div>";
				str +="    <p>"+list[i].reply+"</p></div></li>";
			}
	         
			replyUL.html(str);
			
			showReplyPage(replyCnt);
			
		});//end function
    }//endshowList
    
    

    var modal = $(".modal");
    var modalInputReply = modal.find("input[name='reply']");
    var modalInputReplyer = modal.find("input[name='replyer']");
    var modalInputReplyDate = modal.find("input[name='replyDate']");
    
    var modalModBtn = $("#modalModBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");
    
    $("#modalCloseBtn").on("click", function(e){
    	
    	modal.modal('hide');
    });
    
    var replyer = null;
    
    <sec:authorize access="isAuthenticated()">
    
    replyer = '<sec:authentication property="principal.username"/>';   
    
	</sec:authorize>
 
    var csrfHeaderName ="${_csrf.headerName}"; 
    var csrfTokenValue="${_csrf.token}";
    
    
    
    $("#addReplyBtn").on("click", function(e){
        
        modal.find("input").val("");
        modal.find("input[name='replyer']").val(replyer);
        modalInputReplyDate.closest("div").hide();
        modal.find("button[id !='modalCloseBtn']").hide();
        
        modalRegisterBtn.show();
        
        $(".modal").modal("show");
        
	});
    
    
    
    
    $(document).ajaxSend(function(e, xhr, options) { 
        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
      }); 
    
    
    var pageNum = 1;
    var replyPageFooter = $(".panel-footer");
    
    function showReplyPage(replyCnt){
        
        var endNum = Math.ceil(pageNum / 10.0) * 10;  
        var startNum = endNum - 9; 
        
        var prev = startNum != 1;
        var next = false;
        
        if(endNum * 10 >= replyCnt){
          endNum = Math.ceil(replyCnt/10.0);
        }
        
        if(endNum * 10 < replyCnt){
          next = true;
        }
        
        var str = "<ul class='pagination pull-right'>";
        
        if(prev){
          str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
        }
        
         
        
        for(var i = startNum ; i <= endNum; i++){
          
          var active = pageNum == i? "active":"";
          
          str+= "<li class='page-item '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
        }
        
        if(next){
          str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
        }
        
        str += "</ul></div>";
        
        console.log(str);
        
        replyPageFooter.html(str);
      }
       
	replyPageFooter.on("click","li a", function(e){
		e.preventDefault();
		console.log("page click");
		
		var targetPageNum = $(this).attr("href");
		
		console.log("targetPageNum: " + targetPageNum);
		
		pageNum = targetPageNum;
		
		showList(pageNum);
	}); 
    
	
	$("button[data-oper='modify']").on("click",function(e){
		
		operForm.attr("action","/board/modify").submit();
	});
	
	$("button[data-oper='list']").on("click",function(e){
		
		operForm.find("#bno").remove();
		operForm.attr("action","/board/list");
		operForm.submit();
	});
	
    modalRegisterBtn.on("click",function(e){
        
        var reply = {
              reply: modalInputReply.val(),
              replyer:modalInputReplyer.val(),
              bno:bnoValue
            };
        replyService.add(reply, function(result){
          
          alert(result);
          
          modal.find("input").val("");
          modal.modal("hide");
          
          showList(-1);
          
		});
        
        
        
	});
    
    $(".chat").on("click", "li", function(e){
        
        var rno = $(this).data("rno");
        
        replyService.get(rno, function(reply){
        
          modalInputReply.val(reply.reply);
          modalInputReplyer.val(reply.replyer);
          modalInputReplyDate.val(replyService.displayTime( reply.replyDate))
          .attr("readonly","readonly");
          modal.data("rno", reply.rno);
          
          modal.find("button[id !='modalCloseBtn']").hide();
          modalModBtn.show();
          modalRemoveBtn.show();
          
          $(".modal").modal("show");
              
		});
	});
    
	modalModBtn.on("click", function(e){
  	  
		var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
   	  
		replyService.update(reply, function(result){
     	    alert("수정");
			alert(result);
			modal.modal("hide");
			showList(pageNum);
		});
     	  
	});
	
	modalRemoveBtn.on("click", function(e){
		
		var rno = modal.data("rno");
		
		replyService.remove(rno, function(result){
			console.log("삭제완료함수");
			alert(result);
			modal.modal("hide");
			showList(pageNum);
		});
	});
    
	
	
}); 
</script>

<script>
$(document).ready(function(){
	(function(){
		console.log(replyService);
		var bno = '<c:out value="${board.bno}"/>';
		
		$.getJSON("/board/getAttachList", {bno: bno}, function(arr){
	        
			console.log(arr);
		       
			var str = "";
		       
			$(arr).each(function(i, attach){
		       
			//image type
			if(attach.fileType){
				var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
		           
				str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
				str += "<img src='/display?fileName="+fileCallPath+"'>";
				str += "</div>";
				str +"</li>";
				}else{
		             
		         str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
		         str += "<span> "+ attach.fileName+"</span><br/>";
		         str += "<img src='/resources/jongwoon/img/attach.png'></a>";
		         str += "</div>";
		         str +"</li>";
				}
			});
		       
			$(".uploadResult ul").html(str);
		});//end getjson
	
		
	})();
	
	
/* 	replyService.getList({bno:bnoValue, page:1}, function(list){
		for(var i = 0, len = list.length||0; i < len; i++) {
			console.log(list[i]);
		}
	});
	
	replyService.add(
			{reply:"JS Test", replyer:"Tester",bno:bnoValue},
			function(result){
				alert("RESULT: " + result);
			}
	);
	
	replyService.remove(23, function(count){
		if (count == "success"){
			alert("REMOVED");
		}
	}, function(err){
		alert('error.,...');
	});
	
	replyService.update({
		rno : 22,
		bno : bnoValue,
		reply : "modified reply..."
	}, function(result){
		alert("수정 완료!");
	});
	
	replyService.get(10,function(data){
		console.log(data);
	});
 */

$(".uploadResult").on("click","li", function(e){
    
	console.log("view image");
    
    var liObj = $(this);
    
    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
    
    if(liObj.data("type")){
      showImage(path.replace(new RegExp(/\\/g),"/"));
    }else {
		//download 
		self.location ="/download?fileName="+path
	}
});

function showImage(fileCallPath){
    
    alert(fileCallPath);
    
    $(".bigPictureWrapper").css("display","flex").show();
    
    $(".bigPicture")
    .html("<img src='/display?fileName="+fileCallPath+"' >")
    .animate({width:'100%', height: '100%'}, 1000);
    
}

});
</script>

<script>




</script>



<%@include file="../includes/jongwoon/footer.jsp" %>

