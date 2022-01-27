<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="../includes/jongwoon/header.jsp"%>

<div id="banner-area" class="banner-area"
	style="background-image: url(/resources/heejin/constra/images/banner/banner2.jpg)">
	<div class="banner-text">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="banner-heading">
						<h1 class="banner-title" style="text-shadow: 4px 4px 3px #000;">캠핑장
							예약하기</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<!-- <li class="breadcrumb-item"><a href="#">Home</a></li>
                      <li class="breadcrumb-item"><a href="#">Company</a></li> -->
								<li class="breadcrumb-item active" aria-current="page"
									style="text-shadow: 4px 4px 3px #000;">Book</li>
							</ol>
						</nav>
					</div>
				</div>
				<!-- Col end -->
			</div>
			<!-- Row end -->
		</div>
		<!-- Container end -->
	</div>
	<!-- Banner text end -->
</div>
<!-- Banner area end -->



<section id="ts-features" class="ts-features pb-2">
	<div class="container container-res">
		<div class="row row-res">
			<div class="col-md-6">
				<p class="project-info-label">예약 날짜</p>
				<div id="datepicker" style="width: 100%;"></div>
				<!-- Service1 end -->
			</div>
			<!-- Col 1 end -->

			<div class="col-md-6">
				<div class="ts-service-box">
					<h3 class="column-title mrt-0"><c:out value="${camp.cname}" /></h3>
					<ul class="project-info list-unstyled">
						<li>
							<p class="project-info-label">주소</p>
							<p class="project-info-content"><c:out value="${camp.site}" /></p>
						</li>
						<li>
							<p class="project-info-label">문의처</p>
							<p class="project-info-content"><c:out value="${camp.phoneNumber}" /></p>
						</li>
						<li>
							<p class="project-info-label">테마</p>
							<p class="project-info-content"><c:out value="${camp.theme}" /></p>
						</li>
						<li>
							<p class="project-info-label">1박 이용료</p>
							<p class="project-info-content"><c:out value="${camp.price}" /></p>
						</li>
						<li>
							<p class="project-info-label">캠핑장 시설정보</p>
							<p class="project-info-content"><c:out value="${camp.facility}" /></p>
						</li>
						<li>
							<p class="project-link">
								<a class="btn btn-primary sw" target="_blank" href="#">예약하기</a>
							</p>
						</li>
					</ul>
					<!-- Service2 end -->
				</div>
				<!-- Col 2 end -->
			</div>
		</div>
		<!-- Container end -->
</section>


<section id="ts-features" class="ts-features pb-2"></section>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog resModal">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">예약정보</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<div class="row">

					<div class="col-md-12">
					
						
					
						<!-- <h3 class="column-title">We love to hear</h3> -->
						<!-- contact form works with formspree.io  -->
						<!-- contact form activation doc: https://docs.themefisher.com/constra/contact-form/ -->
						<form role="form" id="resForm" action="/camp/res" method="post">
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
							<input type="hidden" id="cno" name="cno" value='<c:out value="${camp.cno}"/>'>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>날짜</label> <input class="form-control form-control-date" name="resDate" id="resDate" placeholder="" type="text" readonly>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>이메일</label> <input class="form-control form-control-email" name="email" id="email" placeholder="" type="email" value='<sec:authentication property="principal.username"/>' readonly>
									</div>
								</div>

							</div>
							<div class="row">
								
								<div class="col-md-12">
									<div class="form-group">
										<label>이름</label> <input class="form-control form-control-name" name="rname" id="rname"	placeholder="" type="text" required>
									</div>
								</div>

							</div>
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>연락처</label> <input class="form-control" name="phoneNumber" id="phoneNumber" placeholder="" type="text" required>
									</div>
								</div>

							</div>

						</form>
					</div>

				</div>
			</div>
			
			<div class="modal-footer">
			<button class="btn btn-default solid blank resbtn">예약하기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">
					닫기</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- <section id="ts-features" class="ts-features pb-2"></section>
  -->
<div class="gap-40"></div>


<script type="text/javascript">
	$.datepicker.setDefaults({
		dateFormat : 'yymmdd',
		prevText : '이전 달',
		nextText : '다음 달',
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ],
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ],
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		showMonthAfterYear : true,
		yearSuffix : '년'
	});

	$(function() {
		var resDate = $("#resDate");
		
		$("#datepicker").datepicker({ 
	        onSelect: function() { 
	            var date = $.datepicker.formatDate("yymmdd",$("#datepicker").datepicker("getDate")); 
	            resDate.val(date);
	        }
	    });
	});
</script>

<script type="text/javascript">

	$(document).ready(function() {
		console.log("${camp.cno}")
		
		
		$(".sw").on("click", function(e) {
			e.preventDefault();
			$("#myModal").modal({
				backdrop : "static",
				keyboard : false,
				show : true
			});
			
		});
		var resForm = $("#resForm");
		
		$(".resbtn").on("click",function(e){
			e.preventDefault();
			resForm.submit();
		});
		
	});
</script>


<!-- Template custom -->
<%@ include file="../includes/jongwoon/footer.jsp"%>
