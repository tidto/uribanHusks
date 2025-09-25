<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>우리반하다</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link
	href="${pageContext.request.contextPath }/assets/images/ban.ico"
	rel="icon">
<link
	href="${pageContext.request.contextPath }/homeview/img/apple-touch-icon.png"
	rel="apple-touch-icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath }/homeview/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/homeview/vendor/aos/aos.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/homeview/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/homeview/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/homeview/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/homeview/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/homeview/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath }/homeview/css/style.css"
	rel="stylesheet">

<!-- =======================================================
  * Template Name: Mentor
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top">
		<div class="container d-flex align-items-center">


			<!-- Uncomment below if you prefer to use an image logo -->
			<a href="${pageContext.request.contextPath }" class="logo me-auto"><img
				src="${pageContext.request.contextPath }/homeview/img/logoGR.png"
				alt="" class="img-fluid"></a>

			<nav id="navbar" class="navbar order-last order-lg-0">
				<!-- <UL>
					<LI><A CLASS="ACTIVE" HREF="INDEX.HTML">HOME</A></LI>
					<LI><A HREF="ABOUT.HTML">ABOUT</A></LI>
					<LI><A HREF="COURSES.HTML">COURSES</A></LI>
					<LI><A HREF="TRAINERS.HTML">TRAINERS</A></LI>
					<LI><A HREF="EVENTS.HTML">EVENTS</A></LI>
					<LI><A HREF="PRICING.HTML">PRICING</A></LI>

					<LI CLASS="DROPDOWN"><A HREF="#"><SPAN>DROP DOWN</SPAN> <I
							CLASS="BI BI-CHEVRON-DOWN"></I></A>
						<UL>
							<LI><A HREF="#">DROP DOWN 1</A></LI>
							<LI CLASS="DROPDOWN"><A HREF="#"><SPAN>DEEP DROP
										DOWN</SPAN> <I CLASS="BI BI-CHEVRON-RIGHT"></I></A>
								<UL>
									<LI><A HREF="#">DEEP DROP DOWN 1</A></LI>
									<LI><A HREF="#">DEEP DROP DOWN 2</A></LI>
									<LI><A HREF="#">DEEP DROP DOWN 3</A></LI>
									<LI><A HREF="#">DEEP DROP DOWN 4</A></LI>
									<LI><A HREF="#">DEEP DROP DOWN 5</A></LI>
								</UL></LI>
							<LI><A HREF="#">DROP DOWN 2</A></LI>
							<LI><A HREF="#">DROP DOWN 3</A></LI>
							<LI><A HREF="#">DROP DOWN 4</A></LI>
						</UL></LI>
					<LI><A HREF="CONTACT.HTML">CONTACT</A></LI>
				</UL>
				<I CLASS="BI BI-LIST MOBILE-NAV-TOGGLE"></I> -->
			</nav>
			<!-- .navbar -->

			<sec:authorize access="isAnonymous()">
				<a href="${pageContext.request.contextPath}/login"
					class="get-started-btn">로그인</a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<a href="#"
					class="get-started-btn"
					onclick="document.getElementById('logoutFrm').submit();">로그아웃</a>
				<!-- 로그아웃 정보를 넘겨주는 폼  -->
				<form id="logoutFrm"
					action="${pageContext.request.contextPath }/logout" method="POST">
					<input name="${_csrf.parameterName}" type="hidden"
						value="${_csrf.token}" />
				</form>
			</sec:authorize>
		</div>
	</header>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<section id="hero"
		class="d-flex justify-content-center align-items-center">
		<div class="container position-relative" data-aos="zoom-in"
			data-aos-delay="100">
			<h2><img src="${pageContext.request.contextPath }/homeview/img/logoWH.png"alt="" class="pb-3" style="height: 70px;"></h2>
			<h1>
				온라인에서 만나는<br>또 하나의 우리반
			</h1>

			<a href="${pageContext.request.contextPath}/myhome"
				class="btn-get-started">시작하기</a>
		</div>
	</section>
	<!-- End Hero -->

	<!-- ======= Footer ======= -->
	<footer id="footer">

		<div class="container d-md-flex py-4" style="height: 100%;">

			<div class="me-md-auto text-center text-md-start">
				<div class="copyright">
					&copy; Copyright <strong><span>OurClass</span></strong>. All Rights
					Reserved
				</div>
				<div class="credits">
					<!-- All the links in the footer should remain intact. -->
					<!-- You can delete the links only if you purchased the pro version. -->
					<!-- Licensing information: https://bootstrapmade.com/license/ -->
					<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/ -->
					Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
				</div>
			</div>
			<div class="social-links text-center text-md-right pt-3 pt-md-0">
				<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
					href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
					href="#" class="instagram"><i class="bx bxl-instagram"></i></a> <a
					href="#" class="google-plus"><i class="bx bxl-skype"></i></a> <a
					href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
			</div>


		</div>
	</footer>
	<!-- End Footer -->

	<div id="preloader"></div>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script
		src="${pageContext.request.contextPath }/homeview/vendor/purecounter/purecounter_vanilla.js"></script>
	<script
		src="${pageContext.request.contextPath }/homeview/vendor/aos/aos.js"></script>
	<script
		src="${pageContext.request.contextPath }/homeview/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/homeview/vendor/swiper/swiper-bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/homeview/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="${pageContext.request.contextPath }/homeview/js/main.js"></script>
	
</body>

</html>
