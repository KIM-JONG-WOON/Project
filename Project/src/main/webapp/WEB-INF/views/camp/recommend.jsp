<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../includes/heejin/header.jsp"%>








<div id="banner-area" class="banner-area"
	style="background-image: url(/resources/heejin/constra/images/banner/banner3.jpg)">
	<div class="banner-text">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="banner-heading">
						<h1 class="banner-title" style="text-shadow: 4px 4px 3px #000;">추천 캠핑장</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<!-- <li class="breadcrumb-item"><a href="#">Home</a></li>
                      <li class="breadcrumb-item"><a href="#">Company</a></li> -->
								<li class="breadcrumb-item active" aria-current="page" style="text-shadow: 4px 4px 3px #000;">Recommend Campsite</li>
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

    <div class="row">
      <div class="col-lg-8">
        <div id="page-slider" class="page-slider small-bg">
          <div class="item">
            <img loading="lazy" class="img-fluid" src="/resources/heejin/constra/images/recommend/gosapo1.jpg" alt="project-image" />
          </div>

          <div class="item">
            <img loading="lazy" class="img-fluid" src="/resources/heejin/constra/images/recommend/gosapo2.jpg" alt="project-image" />
          </div>
          
          <div class="item">
            <img loading="lazy" class="img-fluid" src="/resources/heejin/constra/images/recommend/gosapo3.jpg" alt="project-image" />
          </div>
        </div><!-- Page slider end -->
      </div><!-- Slider col end -->

      <div class="col-lg-4 mt-5 mt-lg-0">

        <h3 class="column-title mrt-0">변산반도국립공원 고사포 야영장</h3>
        <p>고사포해수욕장 송림안에 마련된 국립공원관리공단 운영 캠핑장</p>

        <ul class="project-info list-unstyled">
          <li>
            <p class="project-info-label">주소</p>
            <p class="project-info-content">전라북도 부안군 변산면 운산리 441-11</p>
          </li>
          <li>
            <p class="project-info-label">문의처</p>
            <p class="project-info-content">063-582-7808</p>
          </li>
          <li>
            <p class="project-info-label">테마</p>
            <p class="project-info-content">해변, 국립공원</p>
          </li>
          <li>
            <p class="project-info-label">캠핑장 유형</p>
            <p class="project-info-content">일반야영장, 자동차야영장</p>
          </li>
          <li>
            <p class="project-info-label">캠핑장 시설정보</p>
            <p class="project-info-content">전기, 와이파이, 온수, 놀이터, 산책로, 마트, 편의점</p>
          </li>
          <li>
            <p class="project-link">
              <a class="btn btn-primary" target="_blank" href="#">예약하기</a>
            </p>
          </li>
        </ul>

      </div><!-- Content col end -->

    </div><!-- Row end -->

  </div><!-- Conatiner end -->
</section><!-- Main container end -->




<!-- Javascript Files
  ================================================== -->


<!-- Body inner end -->
<%@ include file="../includes/heejin/footer.jsp"%>
