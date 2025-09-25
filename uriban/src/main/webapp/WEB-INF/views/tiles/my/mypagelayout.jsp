<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리반하다</title>
<!--  스프링 시큐리티 토큰 -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Favicon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/myassets/images/favicon.ico" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/myassets/css/backend-plugin.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/myassets/css/backend.css?v=1.0.0">
<link rel="stylesheet" href="${pageContext.request.contextPath }/myassets/vendor/line-awesome/dist/line-awesome/css/line-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/myassets/vendor/remixicon/fonts/remixicon.css">

<link rel="stylesheet" href="${pageContext.request.contextPath }/myassets/vendor/tui-calendar/tui-calendar/dist/tui-calendar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/myassets/vendor/tui-calendar/tui-date-picker/dist/tui-date-picker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/myassets/vendor/tui-calendar/tui-time-picker/dist/tui-time-picker.css">
</head>

<body class="  ">
<sec:authentication property="principal" var="p" />
<!-- Wrapper Start -->
    <div class="wrapper">
	<header>
		<tiles:insertAttribute name="header" />
	</header>
	<main>
	<div class="content-page">
		<tiles:insertAttribute name="content" />
	</div>
	</main>
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>
	</div>
	
	
    <!-- Backend Bundle JavaScript -->
    <script src="${pageContext.request.contextPath }/myassets/js/backend-bundle.min.js"></script>
    
    <!-- Table Treeview JavaScript -->
    <script src="${pageContext.request.contextPath }/myassets/js/table-treeview.js"></script>
    
    <!-- Chart Custom JavaScript -->
    <script src="${pageContext.request.contextPath }/myassets/js/customizer.js"></script>
    
    <!-- Chart Custom JavaScript -->
    <script async src="${pageContext.request.contextPath }/myassets/js/chart-custom.js"></script>
    <!-- Chart Custom JavaScript -->
    <script async src="${pageContext.request.contextPath }/myassets/js/slider.js"></script>
    
    <!-- app JavaScript -->
    <script src="${pageContext.request.contextPath }/myassets/js/app.js"></script>
    
    <script src="${pageContext.request.contextPath }/myassets/vendor/moment.min.js"></script>
    
    <script src="${pageContext.request.contextPath }/myassets/vendor/moment.min.js"></script>
    
    <script src="${pageContext.request.contextPath }/security/token.js"></script>
	
</body>
</html>