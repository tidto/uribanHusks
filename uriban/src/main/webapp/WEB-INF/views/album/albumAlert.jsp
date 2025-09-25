<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.layer {
	display: none;
	position: fixed;
	width: 20%;
	left: 50%;
	margin-left: -10%; /* half of width */
	top: 50%;
	margin-top: -150px; /* half of height */
	overflow: auto;
	z-index: 10000;
}
</style>
</head>
<body>
<div class="alert text-white bg-danger layer " id="err" role="alert">
	<div class="iq-alert-text err">
		A simple <b>info</b> alert—check it out!
	</div>
<button type="button" class="close close1">
	<i class="ri-close-line"></i>
</button>
</div>

<div class="alert text-white bg-danger layer" id="cnf" role="alert">
	<div class="iq-alert-text cnf align-self-center">
		이미지 이외의 파일은 등록할 수 없습니다.
	</div>
	<div>
		<button type="button" id="ok" class="btn btn-light float-right">확인</button>
	</div>
</div> 

</body>
<script>
$('.close1').on('click', function() {
	$('.layer').hide();
})
    var msg = "<c:out value='${msg}'/>";
    var url = "<c:out value='${url}'/>";
	$('#cnf').show();
    
    
    $("#ok").click(function () {
    	location.href = url;
	});
</script>
</html>