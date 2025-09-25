<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항 수정</title>
<style type="text/css">
	.editBtnF401{
		float: right;
		margin: 20px;
	}
	.cancelF401{
		float: right;
		margin: 20px 0 20px 0;
	}
	.editBtnF402{
		float: right;
		margin: 20px;
	}
	.cancelF402{
		float: right;
		margin: 20px 0 20px 0;
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
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12 col-lg-12">

				<div class="card">
					<div class="card-header d-flex justify-content-between">
						<div class="header-title">
							<h4 class="card-title">공지 사항 수정</h4>
						</div>
					</div>
					<div class="card-body">
						<p>해당 &#60;${noticeList.noticeTypeName }&#62;을 수정하는 페이지 입니다!</p>
						<form class="was-validated" name="insertForm" action="noticeInsert?${_csrf.parameterName}=${_csrf.token}" method="post">
							<div class="card mb-3">
								<div class="card-body">
									<div class="row">
										<div class="col-lg-6">
											<h5 class="mb-2">${noticeList.noticeTypeName }</h5>
											<c:if test="${!empty noticeList.noticeTitle }">
												<h6 class="mb-2">: ${noticeList.noticeTitle }</h6>
											</c:if>
										</div>
									</div>
								</div>
							</div>
							<input type="hidden" id="noticeNo" name="noticeNo" value="${noticeList.noticeNo }">
							<input type="hidden" id="typeConf" name="typeConf" value="${noticeList.noticeType }">
<!-- 							<input type="hidden" name="classId"> -->
							<c:if test="${noticeList.noticeType eq 'F401' }">
								<div class="mb-3">
									<label for="validationTextarea">공지사항 제목</label>
									<textarea class="form-control is-invalid" name="noticeTitle"
										id="validationTextarea" placeholder="공지사항 내용을 작성해 주세요." maxlength="45"
										>${noticeList.noticeTitle }</textarea>
									<div class="invalid-feedback">해당 게시판의 제목을 수정합니다.</div>
								</div>
							</c:if>
							
							<div class="mb-3">
								<label for="validationTextarea">공지사항 내용</label>
								<textarea rows="13" class="form-control is-invalid" name="noticeContent"
									id="validationTextarea" placeholder="공지사항 내용 작성란" maxlength="1600"
									>${noticeList.noticeContent }</textarea>
								<div class="invalid-feedback">해당 게시판의 내용을 수정합니다.</div>
							</div>
								<!-- 업로드 파일 삭제 및 추가로 수정처리 -->
<!-- 							<div class="custom-file"> -->
<!-- 								<input type="file" class="custom-file-input" name="files" id="validatedCustomFile" multiple="multiple">  -->
<!-- 								<label class="custom-file-label" for="validatedCustomFile">업로드 하실 파일을 선택해주세요.</label> -->
<!-- 							</div> -->
							<c:choose>
								<c:when test="${noticeList.noticeType eq 'F401' }">
									<button type="button" class="btn btn-primary editBtnF401"> 가정통신문 수정 </button>
									<button type="button" class="btn btn-primary cancelF401"> 취소 </button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-primary editBtnF402"> 알림장 수정 </button>
									<button type="button" class="btn btn-primary cancelF402"> 취소 </button>
								</c:otherwise>
							</c:choose>
						</form>
					</div>
					<div class="alert alert-info layer" id="cnf" role="alert">
				        <div class="iq-alert-text cnf align-self-center">
				            해당 게시글 수정을 취소하고 공지 게시판으로 이동합니다.	
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
				    <div class="alert text-white bg-info layer layer2" id="tem" role="alert">
				        <div class="iq-alert-text tem"></div>
				        <button type="button" class="close close1">
				            <i class="ri-close-line"></i>
				        </button>
				    </div>
						<script>
							$('.close1').on('click', function() {
						        $('.layer').hide();
						    }) 
						
 							$('.editBtnF401').on('click', noticeUpdate);
 							$('.editBtnF402').on('click', noticeUpdate);
 							
 							function noticeUpdate(e){
 								let updateDate = getNoticeInfo();
 								var type = $('#typeConf').val();
 								
 								$.ajax('noticeUpdate',{
 									type : 'post',
 									contentType : 'application/json',
 									data : JSON.stringify(updateDate)
 								})
 								.done(result => {
 									if(result['result']){
 										$('.done').text('해당 ${noticeList.noticeTypeName} 수정이 정상적으로 처리되었습니다.');
 										$('#done').show();
 										setTimeout(function(){
 											$('.layer1').hide();
 										}, 10000)
 										
//  										alert("해당 ${noticeList.noticeTypeName} 수정이 정상적으로 처리되었습니다.")
 										
 										if(type == 'F401'){
 											location.href="../notice/noticeF401List";								
 										}else{
 											location.href="../notice/noticeF402List";	
 										}
 									}
 								})
 								.fail(reject => console.log(reject));
 							}
 							
 							function getNoticeInfo() {
 								let formData = $('form').serializeArray(); // 입력태그 배열
 								
 								let formObj = {};
 								$.each(formData, function(idx, obj){
 									// 각 입력태그 -> 하나의 필드로 변환
 									formObj[obj.name] = obj.value;
 								});
 								return formObj;
 							}
 							
 							$('.cancelF401').on('click', cencelBack);
 							$('.cancelF402').on('click', cencelBack);
 							
 							function cencelBack(){
 								
 								var type2 = $('#typeConf').val();
 								
 								$('#cnf').show();	
					            $("#ok").click(function () {
					            	if(type2 == 'F401'){
										location.href="../notice/noticeF401List";								
									}else{
										location.href="../notice/noticeF402List";	
									}
					            });
 								
//  								if(!confirm("해당 게시글 수정을 취소하고 공지 게시판으로 이동합니다.")){
//  								    alert("취소 되었습니다. 게시글 작성을 계속합니다.");
//  								}else{
//  									if(type2 == 'F401'){
// 										location.href="../notice/noticeF401List";								
// 									}else{
// 										location.href="../notice/noticeF402List";	
// 									}
//  								}
 							}
 							
 							
						</script>
				</div>
			</div>
		</div>
	</div>
</body>
</html>