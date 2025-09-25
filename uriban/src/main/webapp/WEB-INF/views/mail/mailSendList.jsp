<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#line{
		text-decoration: underline;
	}
	.AllDropbox{
		margin-left: 20px; 
	}
 	.dropbox{ 
 		margin-left: 35px; 
 	} 
/* 	#dropMail{ */
/* 		float: right; */
/* 		margin-right: 9px; */
/* 	} */
	.droptop{
		margin-left: 25px;
	}
	h1{
		text-align: center;
		margin: 150px 0 150px 0;
		color: #e0e0e0;
	}
</style>
</head>
<body>
<sec:authentication property="principal" var="p" />
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body" style="min-height:85vh">
						<div class="card mb-3">
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12">
										<h4 class="mb-2">우리반 톡 -> <strong id="line">보낸 톡 보기</strong></h4>
									</div>
								</div>
							</div>
						</div>
						<div class="email-left-box">
							<a href="../mail/mailInsert" class="btn btn-primary btn-block">
								<i class="mdi mdi-file-document-box font-18 align-middle mr-2"></i>
								톡 보내기</a>
							<a href="../mail/mailToMeInsert" class="btn btn-primary btn-block">
								<i class="fa fa-star-o font-18 align-middle mr-2"></i>
								내게 톡 쓰기</a>
							<div class="mail-list mt-4">
								<a href="../mail/mailReceiveList?mailReceiver=${p.memberId }" class="list-group-item border-0 p-r-0">
									<i class="fa fa-inbox font-18 align-middle mr-2"></i>받은 톡 보기
								</a> 
								<a href="../mail/mailSendList?senderId=${p.memberId }" class="list-group-item border-0 text-primary p-r-0">
									<i class="fa fa-paper-plane font-18 align-middle mr-2"></i><b>보낸 톡 보기</b>
								</a> 
								<a href="../mail/mailToMeList?mailReceiver=${p.memberId }" class="list-group-item border-0 p-r-0">
									<i class="fa fa-star-o font-18 align-middle mr-2"></i>내게 쓴 톡 보기 
								</a> 
							</div>
						</div>
						<div class="email-right-box">
							<c:if test="${empty mailSendList }">
								<h1>보낸 톡이 없습니다</h1>
							</c:if>
							<c:forEach items="${mailSendList }" var="sl" varStatus="sat">
						
							<input type="hidden" id="mailNo" 	name="mailNo" 	value="${sl.mailNo }">
							<input type="hidden" id="classId" 	name="classId" 	value="${ourClassId }">
							<input type="hidden" id="senderId" 	name="senderId" value="${p.memberId }">
							
							<div class="email-list m-t-15">
								<div class="message">
									<a href="../mail/mailSendInfo?mailNo=${sl.mailNo }"">
										<div class="col-mail col-mail-2">
											<!-- 메일 제목 -->
											<div class="subject">
												&#91;${sl.mailTypeName }&#93; ${sl.mailTitle}
											</div>
											<!-- 시간 MM:dd HH:mm -->							
											<div class="date">
												<fmt:formatDate value="${sl.mailSendDate }" pattern="MM.dd HH:mm" />
											</div>
										</div>
									</a>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
