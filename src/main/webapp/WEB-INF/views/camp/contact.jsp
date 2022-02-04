<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../includes/heejin/header.jsp"%>








<div id="banner-area" class="banner-area"
	style="background-image: url(/resources/heejin/constra/images/banner/banner4.jpg)">
	<div class="banner-text">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="banner-heading">
						<h1 class="banner-title" style="text-shadow: 4px 4px 3px #000;">문의하기</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<!-- <li class="breadcrumb-item"><a href="#">Home</a></li>
                      <li class="breadcrumb-item"><a href="#">Company</a></li> -->
								<li class="breadcrumb-item active" aria-current="page" style="text-shadow: 4px 4px 3px #000;">Contact</li>
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



<section id="main-container" class="main-container">
	<div class="container">

		<!-- <div class="row text-center">
				<div class="col-12">
					<h2 class="section-title">Reaching our Campsite</h2>
					<h3 class="section-sub-title">캠핑장 찾기</h3>
				</div>
			</div> -->
		<!--/ Title row end -->




		<div class="row">

			<div class="col-md-12">
				<!-- <h3 class="column-title">We love to hear</h3> -->
				<!-- contact form works with formspree.io  -->
				<!-- contact form activation doc: https://docs.themefisher.com/constra/contact-form/ -->
				<form id="contact-form" action="#" method="post" role="form">
					<div class="error-container"></div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>제목</label> <input
									class="form-control form-control-name" name="name" id="name"
									placeholder="" type="text" required>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Email</label> <input
									class="form-control form-control-email" name="email" id="email"
									placeholder="" type="email" value='<sec:authentication property="principal.username"/>' readonly>
							</div>
						</div>
						<!-- <div class="col-md-4">
							<div class="form-group">
								<label>Subject</label> <input
									class="form-control form-control-subject" name="subject"
									id="subject" placeholder="" required>
							</div>
						</div> -->
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control form-control-message" name="message"
							id="message" placeholder="" rows="10" required></textarea>
					</div>
					<div class="text-right">
						<br>
						<button class="btn btn-primary solid blank" type="submit">보내기</button>
					</div>
				</form>
			</div>

		</div>
		<!-- Content row -->

		<div class="gap-40"></div>

	

	</div>
	<!-- Conatiner end -->
</section>
<!-- Main container end -->




<!-- Javascript Files
  ================================================== -->





<!-- Body inner end -->
<%@ include file="../includes/heejin/footer.jsp"%>
