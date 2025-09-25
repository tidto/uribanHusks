<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#tchname {
		text-decoration: underline;
	}
	h1{
		text-align: center;
		margin: 230px 0 230px 0;
		color: #e0e0e0;
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
						<div class="d-flex flex-wrap align-items-center justify-content-between breadcrumb-content">
							<h5><strong id="tchname">${p.memberName}</strong> 님의 공지 템플릿 리스트입니다.</h5>
							<div class="d-flex flex-wrap align-items-center">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-lg-12">
							<c:if test="${ empty templateList }">
								<h1>교사님, 저장한 템플릿이 없습니다</h1>
							</c:if>
							<c:forEach items="${templateList }" var="tl"  varStatus="status"> 
							<div class="templateitems">
								<div class="card card-widget task-card">
									<div class="card-body">
										<div class="d-flex flex-wrap align-items-center justify-content-between">
											<div class="d-flex align-items-center">
												<div>
													<h5 class="mb-2">${tl.noticeTypeName }_템플릿</h5>
													<h6 class="mb-2">${tl.noticeTitle }</h6>
												</div>
											</div>
											<div class="media align-items-center mt-md-0 mt-3">
											<a class="btn bg-secondary-check" data-toggle="collapse"
												href="#collapseEdit${status.count }" role="button" aria-expanded="false"
												aria-controls="collapseEdit${status.count }">
												<i class="ri-edit-box-line m-0"> 템플릿 내용 확인</i>
											</a>
											</div>
 										</div>
									</div>
								</div>
								<input type="hidden" value="${p.memberId}" id="memberId" name="memberId">
								<div class="collapse" id="collapseEdit${status.count }">
									<div class="card card-list task-card" data-template_no="${tl.templateNo }">
										<div
											class="card-header d-flex align-items-center justify-content-between px-0 mx-3">
											<div class="header-title">
												<h5 class="mb-2">(임시)제목: ${tl.noticeTitle }</h5>
											</div>
											
											<div>
												<a href="../notice/templateToNotice?templateNo=${tl.templateNo }&memberId=${tl.memberId}" 
													class="btn bg-secondary-light edit">템플릿 적용하기</a>
												<a class="btn bg-secondary-del templateDel">삭제</a>
											</div>
											
											
										</div>
										<div class="card-body">
											
											<div class="card mb-3">
												<div class="card-body">
													<div class="row">
														<div class="col-lg-6">
															<h5 class="mb-2">(임시)전달 내용</h5>
															<p class="mb-2" style="width: 890"><pre  class="mb-2"  style="white-space: pre-wrap; word-break: keep-all;">${tl.noticeContent }</pre></p>
														</div>
													</div>
												</div>
											</div>
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
            선택한 공지 템플릿을 삭제할까요?	
        </div>
        <div>
            <button type="button" id="ok" class="btn btn-info float-right">확인</button>
            <button type="button" class="btn btn-outline-info float-right close1">취소</button>
        </div>
    </div>
    
	<script type="text/javascript">
		$('.close1').on('click', function() {
	        $('.layer').hide();
	    }) 
	
		$('.templateDel').on('click', templateDrop);
		
		function templateDrop(e){
			let templateNo = e.target.closest(".task-card").dataset["template_no"]
			
			$('#cnf').show();
		    $("#ok").click(function () {
		    	$.ajax('templateDelete',{
					type : 'post',
					data : {templateNo}
				})
				.done(result => {
					if(result >= 0){
						e.target.closest(".templateitems").remove();
						$('.layer').hide();
					};
				})
				.fail(reject => console.log(reject));
		    });
			
// 			if(!confirm("선택한 공지 템플릿을 삭제할까요?")){
// 			    alert("취소 되었습니다.");
// 			}else{
			    
// 				$.ajax('templateDelete',{
// 					type : 'post',
// 					data : {templateNo}
// 				})
// 				.done(result => {
// 					if(result >= 0){
// 						e.target.closest(".templateitems").remove();
// 						alert("해당 템플릿이 삭제되었습니다.");
// 					}else{
// 						alert("오류로 인해 삭제가 취소되었습니다.");
// 					};
// 				})
// 				.fail(reject => console.log(reject));
// 			}
		}
	</script>
</body>
</html>
