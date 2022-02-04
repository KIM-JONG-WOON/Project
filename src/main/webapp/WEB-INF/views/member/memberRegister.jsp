<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Register</title>

<!-- Custom fonts for this template-->
<link href="/resources/heejin/login/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/heejin/login/css/project.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-dark">

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">회원가입 페이지</h1>
							</div>
							<form class="user" role="form" action="/member/memberRegister"
								method="post">
								<div class="form-group">
									<input type="email"
										class="form-control form-control-user required" id="email"
										name="email" placeholder="이메일">
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="text"
											class="form-control form-control-user required" id="name"
											name="name" placeholder="이름">
									</div>
									<div class="col-sm-6">
										<input type="text"
											class="form-control form-control-user required"
											id="phoneNumber" name="phoneNumber" placeholder="연락처">
									</div>
								</div>
								<div class="form-group">
									<input type="password"
										class="form-control form-control-user required" id="password"
										placeholder="비밀번호">
								</div>
								<div class="form-group">
									<input type="password"
										class="form-control form-control-user required"
										id="repeatPassword" name="password" placeholder="비밀번호 확인">
								</div>
								<div class="alert alert-success" id="alert-success">비밀번호가
									일치합니다.</div>
								<div class="alert alert-danger" id="alert-danger">비밀번호가
									일치하지 않습니다.</div>
								​ <a href="#" class="btn btn-warning btn-user btn-block">
									회원가입 </a> <input type="hidden" name="${_csrf.parameterName }"
									value="${_csrf.token }" />
							</form>
							<hr>
							<div class="text-center">
								<a class="small" href="/member/forgotPassword">비밀번호 찾기</a>
							</div>
							<div class="text-center">
								<a class="small" href="/member/login">로그인</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/heejin/login/vendor/jquery/jquery.min.js"></script>
	<script
		src="/resources/heejin/login/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="/resources/heejin/login/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/heejin/login/js/sb-admin-2.min.js"></script>
	<script>
		$(document).ready(
				function() {
					$("#alert-success").hide();

					$("#alert-danger").hide();

					$("input[type=password]")
							.keyup(
									function() {
										var hasVar = true;
										$("input[type=password]").each(
												function() {
													if ($(this).val() == "") {
														hasVar = false;
													}
												})
										if ($(hasVar == true && "#password")
												.val() == $("#repeatPassword")
												.val()) {
											$("#alert-success").show();
											$("#alert-danger").hide();
										} else if (hasVar == true) {
											$("#alert-success").hide();
											$("#alert-danger").show();
										}

									});

					$(".btn-user").on(
							"click",
							function(e) {

								var hasVar = true;

								e.preventDefault();

								$(".required").each(function() {
									if ($(this).val() == "") {
										hasVar = false;
									}
								})

								if (hasVar == true
										&& $("#password").val() == $(
												"#repeatPassword").val()) {
									$("form").submit();
								}
								else{
				                    alert("모든 항목을 제대로 입력해주세요!");
				                }

							});

				});
	</script>
</body>

</html>