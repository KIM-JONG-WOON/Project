<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<sec:authorize access="isAnonymous()">
<a href="/camp/main">GO캠핑 홈페이지</a>
<a href="/member/login">로그인</a>
</sec:authorize>
<a href="/member/logined">로그인확인</a>
<a href="/camp/search">검색</a>
<sec:authorize access="isAuthenticated()">
<a href="/member/logout">로그아웃</a>
<a href="/member/testUser">일반회원 페이지</a>
<a href="/member/testAdmin">관리자 페이지</a>
</sec:authorize>
<script>
self.location = "/camp/main";

</script>

</body>
</html>
