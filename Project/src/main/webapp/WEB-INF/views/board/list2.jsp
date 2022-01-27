<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    

<%@include file = "../includes/jongwoon/header.jsp" %>


<div id="banner-area" class="banner-area" style="background-image:url(/resources/heejin/constra/images/banner/banner2.jpg)">
  <div class="banner-text">
    <div class="container">
        <div class="row">
          <div class="col-lg-12">
              <div class="banner-heading">
                <h1 class="banner-title" style="text-shadow: 4px 4px 3px #000;">자유 게시판</h1>
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
      <div class="col-md-12 board">
        <div class="panel panel-default">
          <div class="panel-heading regBtn">
  			<button id='regBtn' type="button" class="btn btn-xs pull-right">글 등록</button>
 		  </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12 board">
        <div class="panel panel-default">
          <div class="panel-body">
            <table class="table-board">
              <thead>
                <tr>
                  <td id="BT01"></td>
                  <td id="BT02">글제목</td>
                  <td id="BT03">작성자</td>
                  <td id="BT04">작성일</td>
                  <td id="BT05">수정일</td>
                </tr>
              </thead>
              <c:forEach items="${list}" var="board">
                <tr>
                  <td><c:out value="${board.bno}" /></td>
                  <td><a class='move' href='<c:out value="${board.bno}" />'>
                  	  <c:out value="${board.title }"/> <b><c:if test="${0 != board.replyCnt}">[<c:out value="${board.replyCnt }"/>]</c:if></b></a></td>
                  <td><c:out value="${board.email}" /></td>
                  <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
                  <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
                </tr>
              </c:forEach>
            </table>
            
            <div class="row">
              <div class="col-md-12">
              <div class="searchForm">
              <form id='searchForm' action="/board/list" method='get'>
                <select name='type'>
                  <option value=""
                    <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
                    <option value="T"
                      <c:out value="${pageMaker.cri.type eq 'T' ?'selected':'' }"/>>제목</option>
                    <option value="C"
                      <c:out value="${pageMaker.cri.type eq 'C' ?'selected':'' }"/>>내용</option>
                    <option value="W"
                      <c:out value="${pageMaker.cri.type eq 'W' ?'selected':'' }"/>>작성자</option>
                </select>
                <input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
                <input type="hidden" name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'>
                <input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>'>
                <button class="btn btn-default">검색</button> 
              </form>
              </div>
              </div>
            </div>
            
            <div class='pull-right'>
              <ul class="pagination">
                <c:if test="${pageMaker.prev}">
                  <li class="paginate_button previous"><a href="${pageMaker.startPage -1 }">이전</a></li>
                </c:if>
                
                <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                  <li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""}"><a href="${num}">${num }</a></li>
                </c:forEach>
                
                <c:if test="${pageMaker.next }">
                  <li class="paginate_button next"><a href="${pageMaker.endPage + 1 }">다음</a></li>
                </c:if>>
              </ul>
            </div>
            
            <form id='actionForm' action="/board/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>	
				<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>		
			</form>
            
            
            
            
            
            
                 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                           	    <h4 class="modal-title" id="myModalLabel">게시글 등록</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                처리가 완료되었습니다.
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>                                            
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
				<!-- /.modal -->
            
            
            
          </div>
        </div>
      </div>
    </div>
  </div><!-- Container end -->
</section><!-- Main container end -->



<script type="text/javascript" >
$(document).ready(function(){
  var result = '<c:out value="${result}"/>';	
  
  checkModal(result);
  
  history.replaceState({},null,null);
  
  function checkModal(result){
	  if(result === '' || history.state ){
		  return;
	  }
	  if(parseInt(result)>0) {
		  $(".modal-body").html("게시글이 등록되었습니다!");
	  }
	  $("#myModal").modal("show");
  }
  $("#regBtn").on("click",function(){
	  self.location = "/board/register";
  });
  
  var actionForm = $("#actionForm");
  
  $(".paginate_button a").on("click",function(e){
	  
	  e.preventDefault();
	  
	  console.log('click');
	  
	  actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	  actionForm.submit();
  });
  
  $(".move").on("click",function(e){
	  e.preventDefault();
	  actionForm.append("<input type='hidden' name ='bno' value='"+$(this).attr("href")+"'>");
	  actionForm.attr("action","/board/get");
	  actionForm.submit();
  });
  
  var searchForm = $("#searchForm");
  
  $("#searchForm button").on("click",function(e){
	  
	  if(!searchForm.find("option:selected").val()){
		  alert("검색종류를 선택하세요");
		  return false;
	  } 
	  if(!searchForm.fin("input[name='keyword']").val()){
		  return false;
	  }
	  searchForm.find("input[name='pageNum']").val("1");
	  e.preventDefault();
	  
	  searchForm.submit();
	  
  });
});
</script>


<%@include file="../includes/jongwoon/footer.jsp" %>
