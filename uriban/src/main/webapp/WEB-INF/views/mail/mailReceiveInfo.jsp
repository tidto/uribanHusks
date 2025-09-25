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
										<h4 class="mb-2">우리반 톡 -> 받은 톡 보기 -> <strong id="line">받은 톡 확인</strong></h4>
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
								<a href="../mail/mailReceiveList?mailReceiver=${p.memberId }" class="list-group-item border-0 text-primary p-r-0">
									<i class="fa fa-inbox font-18 align-middle mr-2"></i><b>받은 톡 보기</b>
								</a> 
								<a href="../mail/mailSendList?senderId=${p.memberId }" class="list-group-item border-0 p-r-0">
									<i class="fa fa-paper-plane font-18 align-middle mr-2"></i>보낸 톡 보기
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
                                    <!-- 나에게 보내기에선 다르게 표기 -->
	                                    <c:choose>
	                                    	<c:when test="${p.memberId != mailReceiveInfo.senderId }">
	                                    		<h5 class="m-b-3"> &#91;${mailReceiveInfo.mailTypeName }&#93; ${p.memberName } 님, ${mailReceiveInfo.senderName } ${mailReceiveInfo.senderAuthority }에게 받은 톡을 확인하세요!</h5>
	                                    	</c:when>
	                                    	<c:otherwise>
	                                    		<h5 class="m-b-3">&#91;Talk to Me&#93; ${p.memberName } 님, 내게 쓴 톡을 확인하세요!</h5>
	                                    	</c:otherwise>
	                                    </c:choose>
                                        <p class="m-b-2"><fmt:formatDate value="${mailReceiveInfo.receiveDate }" pattern="yy년 MM월 dd일 받음" /></p>                                    
                                    </div>
                                </div>
                                <hr>
                                <div class="media mb-4 mt-1">
                                    <div class="media-body"><span class="float-right"><fmt:formatDate value="${mailReceiveInfo.receiveDate }" pattern="HH시 mm분" /> </span>
                                        <h4 class="m-0 text-primary">${mailReceiveInfo.receiveTitle }</h4><small class="text-muted">To:@${mailReceiveInfo.mailReceiver } in our class</small>
                                    </div>
                                </div>
                                
                            	<!-- 톡내용: 나에게 보내기에선 다르게 표기 -->
                                <c:choose>
                                	<c:when test="${p.memberId != mailReceiveInfo.senderId }">
                                		<h5 class="m-b-15">안녕하세요? </h5>
                                		<p><strong>&#91;${mailReceiveInfo.senderAuthority }&#93; ${mailReceiveInfo.senderName }님이 보낸 톡 입니다.</strong></p>
                             			<p> ${mailReceiveInfo.receiveContents }</p>
                                	</c:when>
                                	<c:otherwise>
                                		<h5 class="m-b-15">내게 쓰기 톡 내용:  </h5>
                                		<p> </p>
                                		<p><pre  class="mb-2"  style="white-space: pre-wrap; word-break: keep-all;">${mailReceiveInfo.receiveContents }</pre></p>
                                	</c:otherwise>
                                </c:choose>
                                <c:if test="${mailReceiveInfo.noticeNo != 0 }">
	                                <hr>
	                                <h5 class="p-t-15"><i class="fa fa-download mb-2"></i> 관련 공지사항 </h5>
	                                <div class="row m-b-30">
		                                <c:choose>
			                                <c:when test="${mailReceiveInfo.noticeSet eq 'F401' }">
				                            	<div class="col-auto"><a href="${pageContext.request.contextPath }/notice/noticeF401List" class="text-muted">&#187; 새로 올라온 가정통신문 게시글로 확인하러 가기 &#171;</a></div>	                                	
			                                </c:when>
			                                <c:otherwise>
			                                	<div class="col-auto"><a href="${pageContext.request.contextPath }/notice/noticeF402List" class="text-muted">&#187; 새로 올라온 알림장 게시글로 확인하러 가기 &#171;</a></div>	 
			                                </c:otherwise>
		                                </c:choose>
	                                </div>
                                </c:if>
                                <hr>
                                <!-- 나에게 보내기에선 기능 XX -->
                                <c:if test="${p.memberId != mailReceiveInfo.senderId && mailReceiveInfo.noticeNo eq 0}">
		                           	<!-- 메일 회신폼 -->
		                            <form name="reactionMailForm" action="mailInsert?${_csrf.parameterName}=${_csrf.token}" method="post">
		                                <div class="form-group p-t-15">
	                                	<!-- 회신 내용 직접입력 -->
		                                    <textarea class="w-100 p-20 l-border-1" name="mailContents" id="mailContents" cols="30" rows="5" 
		                                    placeholder="받으신 톡 형식을 따로 작성하실 필요없이 바로 답장 톡을 보낼 수 있어요."  maxlength="1600"></textarea>
			                            <!-- 클래스 ID -->
			                            	<input type="hidden" id="classId" 		name="classId"  		value="${ourClassId }">
			                           	<!--  메일 유형 -->
			                            	<input type="hidden" id="mailType" 		name="mailType"  		value="${mailReceiveInfo.mailType }">
			                           	<!-- 메일 제목 -->
			                            	<input type="hidden" id="mailTitle" 	name="mailTitle"  		value="Re:${mailReceiveInfo.receiveTitle }">
			                           	<!-- 발신ID -->
			                            	<input type="hidden" id="senderId" 		name="senderId"  		value="${p.memberId }">
			                           	<!-- 수신 받을 ID -->
			                            	<input type="hidden" id="mailReceiver" 	name="mailReceiver"  	value="${mailReceiveInfo.senderId }">
		                                </div>
		                                <!-- 회신 버튼 -->
			                            <div class="text-right">
			                                <button type="submit" class="btn btn-primaryw-md m-b-30" >톡 보내기</button>
			                            </div>
		                            </form>
	                            </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
	<div class="alert text-white bg-info layer layer1" id="done" role="alert">
        <div class="iq-alert-text done"></div>
        <button type="button" class="close close1">
            <i class="ri-close-line"></i>
        </button>
    </div>
    <div class="alert text-white bg-info layer layer2" id="tem" role="alert">
        <div class="iq-alert-text tem"></div>
        <button type="button" class="close close1">
            <i class="ri-close-line"></i>
        </button>
    </div>
    
	<script type="text/javascript">
	
		$('.close1').on('click', function() {
		    $('.layer').hide();
		}) 
		
		// 회신 보내기 (다중전송 적용)
		$('[name="reactionMailForm"]').on('submit', function(e){
			
			// 값 입력 경고 메세지
			let contents = 	$('[name=mailContents]');
			
			if(contents.val() 	== '' ){
				$('.done').text('회신하실 톡 내용이 없으면 회신이 불가능 합니다.');
				$('#done').show();
				setTimeout(function(){
					$('.layer1').hide();
				}, 2000)
// 				alert("회신하실 톡 내용이 없으면 회신이 불가능 합니다.");
				return false;
			}
			
			$('.tem').text('회신을 전송하였습니다.');
			$('#tem').show();
			setTimeout(function(){
				$('.layer2').hide();
			}, 10000)
// 			alert("회신을 전송하였습니다.");
			return true;
		})
	</script>
</body>
</html>