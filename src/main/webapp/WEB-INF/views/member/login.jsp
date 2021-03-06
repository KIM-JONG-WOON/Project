<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>로그인 페이지</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/heejin/login/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/heejin/login/css/project.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-dark">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-6">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">로그인 페이지</h1>
                                        
                                        <c:if test="${not empty result  }">
                                        	<h3 class="h6 text-gray-900 mb-4">회원이 되신것을 환영합니다!</h3>
                                        </c:if>
                                        
                                    </div>
                                    <form class="user" role='form' method='post' action='/login'>
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="exampleInputEmail" name="username" aria-describedby="emailHelp"
                                                placeholder="이메일" value="${username }">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="exampleInputPassword" name="password" placeholder="비밀번호"
                                                value="${password }">
                                        </div>
                                        
                                        	<c:choose>
                                        		<c:when test="${ERRORMSG eq 'UserDetailsService returned null, which is an interface contract violation' }">
                                        			<div class="alert alert-danger" id="alert-danger">계정이 존재하지 않습니다.</div>
                                        		</c:when>
                                        		<c:when test="${ERRORMSG eq 'Bad credentials' }">
                                        			<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
                                        		</c:when>
                                        	</c:choose>
                                        
                                        
                                        
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck" name="remember-me">
                                                <label class="custom-control-label" for="customCheck">
                                                    자동 로그인</label>
                                            </div>
                                        </div>
                                        <a href="#" class="btn btn-warning btn-user btn-block">
                                            로그인
                                        </a>
                                        <!-- <hr>
                                        <a href="index.html" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> Login with Google
                                        </a>
                                        <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                        </a> -->
                                        
                                        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="/member/forgotPassword">비밀번호 찾기</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="/member/memberRegister">회원가입</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/heejin/login/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/heejin/login/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/heejin/login/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/heejin/login/js/sb-admin-2.min.js"></script>
	
	<script type="text/javascript">
		$(".btn-user").on("click", function(e){
			e.preventDefault();
			$("form").submit();
		});
	</script>

</body>

</html>