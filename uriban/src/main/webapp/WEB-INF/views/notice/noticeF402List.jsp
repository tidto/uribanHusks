<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#noticeDel{
		margin-right: 9px;
	}
	h1{
		text-align: center;
		margin: 230px 0 230px 0;
		color: #e0e0e0;
	}
	h6{
	 color: #807e7e;
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
	pre{
		overflow: auto;
    	white-space: pre-wrap; /* pre tag내에 word wrap */
		word-wrap: break-word;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<!-- 	알림장    -->
<sec:authentication property="principal" var="p" />
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="d-flex flex-wrap align-items-center justify-content-between breadcrumb-content">
							<h5>우리 반 &#60;알림장&#62; 게시판</h5>
							<div class="d-flex flex-wrap align-items-center">
								<c:if test="${p.authority eq 'ROLE_A102' }">
									<a href="../notice/noticeF402Insert" class="btn btn-primary">새 알림장 등록하기</a>
								</c:if>
							</div>
						</div>
						<hr>
						<small class="mb-2">&#126; 매주 목요일 아침 9시에 1달 전 전달 된 알림장이 삭제됩니다 &#126;</small>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-lg-12">
							<c:if test="${ empty noticeList }">
								<h1>우리반 알림장 공지가 없습니다</h1>
							</c:if>
							<c:forEach items="${noticeList }" var="nl"  varStatus="status"> 
							<div class="noticeitems">
								<div class="card card-widget task-card">
									<div class="card-body">
										<div class="d-flex flex-wrap align-items-center justify-content-between">
											<div class="d-flex align-items-center">
												<div>
													<h5 class="mb-2">${nl.noticeTypeName }</h5>
													<div class="media align-items-center">
														<div class="btn bg-body mr-3">
															<i class="ri-align-justify mr-2"></i>
															<%-- <a><fmt:formatDate value="${nl.noticeDate }" pattern="yy년 MM월 dd일 HH시 mm분"/></a> --%>
															<a class="timepassed"><fmt:formatDate value="${nl.noticeDate }" pattern="yyyy-MM-dd HH:mm:ss"/></a>
														</div>
														<%-- 파일 존재 O/X --%>
														<c:if test="${!empty nl.noticeFile}">
															<div class="btn bg-body align-items-center">
																<i class="ri-survey-line mr-1 align-items-center"></i>
															</div>
														</c:if>
													</div>
												</div>
												
											</div>
											<div class="media align-items-center mt-md-0 mt-3">
											<a class="btn bg-secondary-check" data-toggle="collapse"
												href="#collapseEdit${status.count }" role="button" aria-expanded="false"
												aria-controls="collapseEdit${status.count }">
												<i class="ri-edit-box-line m-0"> 펼쳐서 확인하기</i>
											</a>
											</div>
 										</div>
									</div>
								</div>
								
								<input type="hidden" id="classId" name="classId" value="${ourClassId }">
								
								<div class="collapse" id="collapseEdit${status.count }">
									<div class="card card-list task-card" data-notice_no="${nl.noticeNo }">
										<div
											class="card-header d-flex align-items-center justify-content-between px-0 mx-3">
											<div class="header-title">
												<h6 class="mb-2">게시일자: <fmt:formatDate value="${nl.noticeDate }" pattern="yyyy년 MM월 dd일 HH시 mm분"/></h6>
												<h6 class="mb-2" id="timepassed"></h6>
											</div>
											
											<c:if test="${p.authority eq 'ROLE_A102' }">
												<div>
													<a href="../notice/noticeUpdate?noticeNo=${nl.noticeNo }" class="btn bg-secondary-light edit">수정</a>
													<a class="btn bg-secondary-del noticeDel">삭제</a>
												</div>
											</c:if>
											
										</div>
										<div class="card-body">
											<div class="card mb-3">
												<div class="card-body">
													<div class="row">
														<div class="col-lg-12">
															<h5 class="mb-2">전달 내용</h5>
															<p class="mb-2" style="width: 890"><pre  class="mb-2"  style="white-space: pre-wrap; word-break: keep-all;">${nl.noticeContent }</pre></p>
														</div>
													</div>
												</div>
											</div>
											
											<!-- 파일 유무에 따라 표기 유무 -->
											<c:if test="${!empty nl.noticeFile}">
											<div class="card mb-3">
												<div class="card-body">
													<div class="row">
														<div class="col-lg-6">
															<h5 class="mb-2">첨부파일</h5>
															
															<c:forEach items="${nl.noticeFile }" var="nf" varStatus="st">
															
																<div> 파일 ${st.count}
																<button class="btn btn-link mt-2" onclick="downThisFile(${nf.fileNo})" >
				                 									<svg class="svg-icon" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" 
				                 										fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
				                    								<path d="M4 19h16v-7h2v8a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-8h2v7zM14 9h5l-7 7-7-7h5V3h4v6z"></path>
				                									</svg>
																	${nf.originalfileName}
			                 									</button>
	        													</div>
	        													
															</c:forEach>
														
														</div>
													</div>
												</div>
											</div>
											</c:if>	
											
										</div>
									</div>
								</div>
								</div>
							</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="alert alert-info layer" id="cnf" role="alert">
        <div class="iq-alert-text cnf align-self-center">
            선택한 게시판을 삭제할까요?	
        </div>
        <div>
            <button type="button" id="ok" class="btn btn-info float-right">확인</button>
            <button type="button" class="btn btn-outline-info float-right close1">취소</button>
        </div>
    </div>
    <div class="alert text-white bg-info layer layer1" id="done" role="alert">
        <div class="iq-alert-text done"></div>
        <button type="button" class="close close1">
            <i class="ri-close-line"></i>
        </button>
    </div>
    
	<script>
		$('.close1').on('click', function() {
	        $('.layer').hide();
	    }) 
		
		$('.noticeDel').on('click', noticeDrop);
		
		function noticeDrop(e){
			let noticeNo = e.target.closest(".task-card").dataset["notice_no"]
			
			$('#cnf').show();	
		    $("#ok").click(function () {
		    	$.ajax('noticeDelete',{
					type : 'post',
					data : {noticeNo}
				})
				.done(result => {
					if(result >= 0){
						e.target.closest(".noticeitems").remove();
						$('.layer').hide();
						$('.done').text('해당 게시글이 삭제되었습니다.');
						$('#done').show();
						setTimeout(function(){
							$('.layer1').hide();
						}, 1600)
					};
				})
				.fail(reject => console.log(reject));
		    });
			
// 			if(!confirm("선택한 게시판을 삭제할까요?")){
// 			    alert("취소 되었습니다.");
// 			}else{
			    
// 				$.ajax('noticeDelete',{
// 					type : 'post',
// 					data : {noticeNo}
// 				})
// 				.done(result => {
// 					if(result >= 0){
// 						e.target.closest(".noticeitems").remove();
// 						alert("해당 게시글이 삭제되었습니다.");
// 					}else{
// 						alert("오류로 인해 삭제가 취소되었습니다");
// 					};
// 				})
// 				.fail(reject => console.log(reject));
				
// 			}
		}
		
//		각 게시클 마다 첨부되어있는 값을 돌송
		function downThisFile(fileNo){
			console.log(fileNo);
			location.href='${pageContext.request.contextPath }/filedownload?fileNo=' + fileNo;
		}
		
		
		// 업로드 시간 측정 / 뿌리고 거두는 형식 함수
		$('.timepassed').each(function(idx, tag){
			let reData = elapsedText(tag.textContent);
			tag.textContent = reData;
			
		})
		
		function elapsedText(strDate) {
			let date = new Date(strDate);
			
			// 초 (밀리초)
			const seconds = 1;
			// 분
			const minute = seconds * 60;
			// 시
			const hour = minute * 60;
			// 일
			const day = hour * 24;
			
			var today = new Date();
			var elapsedTime = Math.trunc((today.getTime() - date.getTime()) / 1000);
		
			var elapsedText = "";
			if (elapsedTime < minute) {
				elapsedText = "방금 전에 올라왔어요!";
			} else if (elapsedTime < hour) {
				elapsedText = Math.trunc(elapsedTime / minute) + "분 전에 올라왔어요!";
			} else if (elapsedTime < day) {
				elapsedText = Math.trunc(elapsedTime / hour) + "시간 전에 올라왔어요!";
			} else if (elapsedTime < (day * 15)) {
				elapsedText = Math.trunc(elapsedTime / day) + "일 전에 올라왔어요!";
			}
			
			return elapsedText;
		}
	</script>
</body>
</html>
