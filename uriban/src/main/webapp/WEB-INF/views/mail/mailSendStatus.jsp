<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body {
		display: flex;
		align-items: center;
		margin: 0 auto;
		justify-content: center;
	}
	#line{
		text-decoration: underline;
	}
	h1{
		margin-top: 200px;
		animation-duration: 3s;
		animation-name: slidein;
		animation-iteration-count: infinite;
		animation-direction: alternate;
	}
	h2{
		margin-bottom: 50px;
		animation-duration: 3s;
		animation-name: slidein;
		animation-iteration-count: infinite;
		animation-direction: alternate;
	}
	#under{
		text-decoration: underline;
	}
}
</style>
</head>
<body>
<sec:authentication property="principal" var="p" />
	 <div class="papeAirrplane" align="center"> 
		<h1><i class="fa fa-paper-plane font-18 align-middle mr-2"></i></h1>
        <h2>톡 보내기 성공!</h2>
        <a href="../mail/mailReceiveList?mailReceiver=${p.memberId }" id="under">
			&#187; 확인 후 돌아가기 &#171;
		</a> 
    </div>
</body>
</html>