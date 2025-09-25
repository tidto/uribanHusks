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
</style>
</head>
<body>
<sec:authentication property="principal" var="p" />
	<div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                    	<div class="card mb-3">
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12">
										<h4 class="mb-2">우리반 톡 -> 보낸 톡 보기 -> <strong id="line">보낸 톡 확인</strong></h4>
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
                            <div class="toolbar" role="toolbar">
                                <div class="btn-group m-b-20">
                                    <button type="button" class="btn btn-light"><i class="fa fa-archive"></i>
                                    </button>
                                    <button type="button" class="btn btn-light"><i class="fa fa-exclamation-circle"></i>
                                    </button>
                                    <button type="button" class="btn btn-light"><i class="fa fa-trash"></i>
                                    </button>
                                </div>
                                <div class="btn-group m-b-20">
                                    <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown"><i class="fa fa-folder"></i>  <b class="caret m-l-5"></b>
                                    </button>
                                    <div class="dropdown-menu"><a class="dropdown-item" href="javascript: void(0);">Social</a>  <a class="dropdown-item" href="javascript: void(0);">Promotions</a>  <a class="dropdown-item" href="javascript: void(0);">Updates</a> 
                                        <a class="dropdown-item" href="javascript: void(0);">Forums</a>
                                    </div>
                                </div>
                                <div class="btn-group m-b-20">
                                    <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown"><i class="fa fa-tag"></i>  <b class="caret m-l-5"></b>
                                    </button>
                                    <div class="dropdown-menu"><a class="dropdown-item" href="javascript: void(0);">Updates</a>  <a class="dropdown-item" href="javascript: void(0);">Promotions</a> 
                                        <a class="dropdown-item" href="javascript: void(0);">Forums</a>
                                    </div>
                                </div>
                                <div class="btn-group m-b-20">
                                    <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown">More <span class="caret m-l-5"></span>
                                    </button>
                                    <div class="dropdown-menu"><a class="dropdown-item" href="javascript: void(0);">Mark as Unread</a>  <a class="dropdown-item" href="javascript: void(0);">Add to Tasks</a>  <a class="dropdown-item"
                                        href="javascript: void(0);">Add Star</a>  <a class="dropdown-item" href="javascript: void(0);">Mute</a>
                                    </div>
                                </div>
                            </div>
                            <div class="read-content">
                                <div class="media pt-5">
                                    <div class="media-body">
                                        <h5 class="m-b-3">
	                                        	[${mailSendInfo.mailTypeName }] ${mailSendInfo.receiverName } 에게 보내신 톡</h5>
                                        <p class="m-b-2"><fmt:formatDate value="${mailSendInfo.mailSendDate }" pattern="yy년 MM월 dd일 작성" /></p>
                                    </div>
                                    
                                </div>
                                <hr>
                                <div class="media mb-4 mt-1">
                                    <div class="media-body"><span class="float-right"><fmt:formatDate value="${mailSendInfo.mailSendDate }" pattern="HH시 mm분" /> </span>
                                        <h4 class="m-0 text-primary">${mailSendInfo.mailTitle }</h4><small class="text-muted">To. ${mailSendInfo.receiverId } in your ourclass</small>
                                    </div>
                                </div>
                                <h5 class="m-b-15">수신 톡 내용: </h5>
                                <p><pre  class="mb-2"  style="white-space: pre-wrap; word-break: keep-all;">${mailSendInfo.mailContents }</pre></p>
                                <c:if test="${mailSendInfo.noticeNo != 0 }">
                                <hr>
                            		<h6 class="p-t-15"><i class="fa fa-download mb-2"></i> 관련 공지사항 </h6>
	                                <div class="row m-b-30">
		                                <c:choose>
				                            <c:when test="${mailSendInfo.noticeSet eq 'F401'}">
					                        	<div class="col-auto"><a href="${pageContext.request.contextPath }/notice/noticeF401List" class="text-muted">&#187; 새로 올라온 가정통신문 게시글로 확인하러 가기 &#171;</a></div>	                                	
				                            </c:when>
				                            <c:otherwise>
				                           		<div class="col-auto"><a href="${pageContext.request.contextPath }/notice/noticeF402List" class="text-muted">&#187; 새로 올라온 알림장 게시글로 확인하러 가기 &#171;</a></div>	 
				                            </c:otherwise>
			                            </c:choose>
	                                </div>
                                </c:if>
							<hr>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
