<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <!-- Basic Page Needs
================================================== -->
  <meta charset="utf-8">
  <title>한국관광공사 Go캠핑 </title>

  <!-- Mobile Specific Metas
================================================== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Construction Html5 Template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">

  <!-- Favicon
================================================== -->
  <link rel="icon" type="image/png" href="/resources/seungwan/CampingGo/CampingGo_index_img/favicon/favicon.ico">

  <!-- CSS
================================================== -->
  <!-- Bootstrap -->
  <link rel="stylesheet" href="/resources/seungwan/plugins/bootstrap/bootstrap.min.css">
  <!-- FontAwesome -->
  <link rel="stylesheet" href="/resources/seungwan/plugins/fontawesome/css/all.min.css">
  <!-- Animation -->
  <link rel="stylesheet" href="/resources/seungwan/plugins/animate-css/animate.css">
  <!-- slick Carousel -->
  <link rel="stylesheet" href="/resources/seungwan/plugins/slick/slick.css">
  <link rel="stylesheet" href="/resources/seungwan/plugins/slick/slick-theme.css">
  <!-- Colorbox -->
  <link rel="stylesheet" href="/resources/seungwan/plugins/colorbox/colorbox.css">
  <!-- Template styles-->
  <link rel="stylesheet" href="/resources/seungwan/css/style.css">
  

  
  
    
  <!-- datepicker -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet"
	href="/resources/heejin/constra/plugins/jQuery/jquery-ui.css">
  
  
  
  <!-- 예약페이지 -->
  <!-- <link rel="stylesheet" href="/resources/jongwoon/css/reservation.css"> -->
  
  
  <!-- 게시판페이지 -->
  <link rel="stylesheet" href="/resources/jongwoon/css/board.css">
  
  
<!-- jQuery모듈 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>





</head>

<body>
  <div class="body-inner">


    <!-- Header start -->
    <header id="header" class="header-one">
      <div class="bg-white">
        <div class="container">
          <div class="logo-area">
            <div class="row align-items-center">
              <div class="logo col-lg-3 text-center text-lg-left mb-3 mb-md-5 mb-lg-0">
                <a class="d-block" href="https://kto.visitkorea.or.kr" target="_blank" title="새창">
                  <img loading="lazy" src="/resources/seungwan/CampingGo/CampingGo_index_img/logo/logo_t.png" alt="한국관광공사">
                </a>

              </div><!-- logo end -->

              <div class="col-lg-9 header-right">
                <!-- text-center header-right -->
                <ul class="top-info-box">
                  <li>
                    <div class="info-box">
                      <div class="info-box-content">
                        <p class="info-box-subtitle mr-4 mt-3">통합로그인링크</p>
                      </div>
                    </div>
                  </li>

                  <li>
                    <div class="info-box">
                      <div class="info-box-content">
                        <p class="info-box-title mt-3">대한민국 구석구석</p>
                      </div>
                    </div>
                  </li>
                  <li>
                    <div class="info-box">
                      <div class="info-box-content">
                        <p class="info-box-title mt-3">고캠핑</p>
                      </div>
                    </div>
                  </li>
                  <li class="last">
                    <div class="info-box last">
                      <div class="info-box-content">
                        <p class="info-box-title mt-3">사진갤러리</p>
                      </div>
                    </div>
                  </li>
                  <li class="header-get-a-quote">
                  <sec:authorize access="isAnonymous()">
                    <a class="btn btn-primary" href="/member/login">통합로그인<img src="/resources/seungwan/CampingGo/CampingGo_index_img/ico_login.png"
                        class="pl-3"></a>
                  </sec:authorize>
                  <sec:authorize access="isAuthenticated()">
                    
                        <form action="/member/logout" method="post" id="logoutForm">
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
							<a class="btn btn-primary" href="#">로그아웃<img src="/resources/seungwan/CampingGo/CampingGo_index_img/ico_login.png" class="pl-3"></a>
						</form>
                  </sec:authorize>
                  
                  </li>
                </ul><!-- Ul end -->
              </div><!-- header right end -->
            </div><!-- logo area end -->

          </div><!-- Row end -->
        </div><!-- Container end -->
      </div>
<script>
var logoutForm = $("#logoutForm");

$("#logoutForm a").on("click", function(e) {
	e.preventDefault();
	/* if (!searchForm.find("option:selected").val()) {
		alert("검색종류를 선택하세요");
		return false;
	} */

	/* if (!searchForm.find("input[name='keyword']").val()) {
		alert("키워드를 입력하세요");
		return false;
	} */

	//첫페이지로 이동
	logoutForm.submit();

});
</script>
      <div id="top-bar" class="top-bar">
        <div class="container">
          <div class="row">
            <div class="col-lg-8 col-md-8">
              <ul class="top-info text-center text-md-left">
                <li><i class=""></i>
                  <p class="info-text"></p>
                </li>
              </ul>
            </div>
            <!--/ Top info end -->

            <div class="col-lg-4 col-md-4 top-social text-center text-md-right">
              <ul class="list-unstyled">
                <li>
                  <a href="/oprtr/intro.do">사업자용
                  </a>
                  <a href="http://gocamping.or.kr/lms" target="_blank">안전교육
                  </a>
                  <a href="/bsite/sitemap/read.do">사이트맵
                  </a>
                </li>
              </ul>
            </div>
            <!--/ Top social end -->
          </div>
          <!--/ Content row end -->
        </div>
        <!--/ Container end -->
      </div>
      <!--/ Topbar end -->

      <div id="top-bar2" class="top-bar2">
        <div class="container">
          <div class="row">
            <div class="col-lg-4 col-md-4">
              <ul class="top-info text-center text-md-left sns_list">
                <li class="sns00 mt-4"><a href="https://www.instagram.com/gocamping_official/" target="_BLANK">고캠핑
                    인스타그램</a>
                </li>
                <li class="sns01 mt-4"><a href="https://www.facebook.com/go2thecamping/" target="_BLANK">고캠핑 공식페이스북</a>
                </li>
                <li class="sns02 mt-4"><a href="https://blog.naver.com/gocamping_official" target="_BLANK">고캠핑 공식블로그</a>
                </li>
                <li class="sns03 mt-4"><a href="https://www.youtube.com/channel/UCuCBPZUAgFBX0J1EVnkuXPQ"
                    target="_BLANK">고캠핑
                    공식유튜브</a></li>
              </ul>
              <!--/ Top social end -->
            </div>
            <div class="col-lg-4 col-md-4">
              <ul class="top-info text-center text-md-left">
                <li>
                  <!--S:로고영역-->
                  <div class="logoarea">
                    <!--S:Logo-->
                    <h1 id="logo" class="text-center ml-5">
                      <a href="/camp/main"><span class="skip"></span></a>
                    </h1>
                  </div>
                </li>
              </ul>
            </div>

            <div class="col-lg-4 col-md-4 ">
              <ul class="list-unstyled">
                <li>
                  <!--S:통합검색-->
                  <div class="m_search">
                    <form name="totalSearchForm01" action="/bsite/search/list.do" method="get">
                      <fieldset class="totalSearch">
                        <legend></legend>
                        <label for="searchKrwd_total" class="skip"></label> <input type="text"
                          class="m_search_in pl-2 pb-2" id="searchKrwd_total" name="searchKrwd"
                          style="vertical-align: middle" title="검색어 입력박스" placeholder="검색어를 입력하세요.">
                        <div class="search_btn">
                          <input type="submit" value="검색" title="새창">
                        </div>
                      </fieldset>
                    </form>
                  </div>
                  <!--//E:통합검색-->
                </li>
              </ul>
            </div>
            <!--/ Content row end -->
          </div>
          <!--/ Container end -->
        </div>
        <!--/ Topbar end -->

        <div class="site-navigation">
          <div class="container">
            <div class="row">
              <div class="col-lg-12">
                <nav class="navbar navbar-expand-lg navbar-dark p-0">
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-collapse"
                    aria-controls="navbar-collapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>

                  <div id="navbar-collapse" class="collapse navbar-collapse" style="z-index: 99999;">
                    <ul class="nav navbar-nav mr-auto">
                      <li class="nav-item"><a href="/camp/search" class="nav-link">캠핑장 검색</a></li>
                      <li class="nav-item ml-5"><a href="/camp/recommend" class="nav-link">추천 캠핑장</a></li>
                      <li class="nav-item ml-5"><a href="/board/list" class="nav-link">게시판</a></li>
                      <li class="nav-item ml-5"><a href="/camp/contact" class="nav-link">문의하기</a></li>
                    </ul>
                  </div>
                </nav>
              </div>
              <!--/ Col end -->
            </div>
            <!--/ Row end -->

            <!-- <div class="nav-search">
              <span id="search"><i class="fa fa-search"></i></span>
            </div> -->
            <!-- Search end -->

            <div class="search-block" style="display: none;">
              <label for="search-field" class="w-100 mb-0">
                <input type="text" class="form-control" id="search-field" placeholder="Type what you want and enter">
              </label>
              <span class="search-close">&times;</span>
            </div><!-- Site search end -->
          </div>
          <!--/ Container end -->

        </div>
        <!--/ Navigation end -->
    </header>
    <!--/ Header end -->







    