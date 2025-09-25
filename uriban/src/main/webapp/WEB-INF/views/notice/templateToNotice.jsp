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
	.addBtn{
		float: right;
		margin: 20px;
	}
	.comeback{
		float: right;
		margin: 20px 0 20px 0;
	}
	h6{
		color: #a19f9f;
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
			<div class="col-sm-12 col-lg-12">

				<div class="card">
					<div class="card-header d-flex justify-content-between">
						<div class="header-title">
							<h4 class="card-title">템플릿 적용 -> 공지 사항 등록</h4>
						</div>
					</div>
					<div class="card-body">
						<p>학생분들과 학부모분들께 전달하고 싶은 공지 게시판을 작성하는 페이지 입니다 ${templateInfo.noticeType }</p>
						<c:choose>
							<c:when test="${templateInfo.noticeType eq 'F401' }">
								<form class="was-validated" name="insertForm1" action="../notice/templateToF401Notice?${_csrf.parameterName}=${_csrf.token}" accept-charset="UTF-8" method="post" enctype="multipart/form-data">
							</c:when>
							<c:otherwise>
								<form class="was-validated" name="insertForm2" action="../notice/templateToF402Notice?${_csrf.parameterName}=${_csrf.token}" accept-charset="UTF-8" method="post" enctype="multipart/form-data">
							</c:otherwise>
						</c:choose>
						
							
							<div class="card mb-3">
								<div class="card-body">
									<div class="row">
										<div class="col-lg-6">
											<input type="hidden" name="noticeType" value="${templateInfo.noticeType }">
											<h5 class="mb-2">${templateInfo.noticeTypeName }</h5>
											<h6 class="mb-3">※공지템플렛 적용 시 공지유형 변경이 불가합니다.</h6>
										</div>
									</div>
								</div>
							</div>
							<!-- 수정을 위한 templateNO -->
							<input type="hidden" id="templateNo" name="templateNo" value="${templateInfo.templateNo }">
							<!-- 클래스 ID 추가시 값 변경 -->
							<input type="hidden" id="classId" name="classId" value="${myClass.classId }">
							<!-- 멤버아이디 임의로 받아옴 -->
							<input type="hidden" id="memberId" name="memberId" value="${templateInfo.memberId }">
							<!-- 게시글 변경 -->
							<input type="hidden" id="typeConf" name="typeConf" value="${templateInfo.noticeType }">
							
							<c:if test="${templateInfo.noticeType eq 'F401'}">
								<div class="mb-3">
									<label for="validationTextarea">공지사항 제목</label>
									<textarea class="form-control is-invalid" name="noticeTitle"
										id="validationTextarea" placeholder="공지사항 제목을 작성할 수 있어요."
										maxlength="45">${templateInfo.noticeTitle }</textarea>
								</div>
							</c:if>
							
							<div class="mb-3">
								<label for="validationTextarea">공지사항 내용</label>
								<textarea rows="13" class="form-control is-invalid" name="noticeContent"
									id="validationTextarea" placeholder="공지사항 내용을 작성할 수 있어요."
									maxlength="1600" required>${templateInfo.noticeContent }</textarea>
								<div class="invalid-feedback">공지사항 게시판에 올려 전달할 내용을 작성해 주세요!</div>
							</div>
							
							<div class="custom-control custom-checkbox mb-3">
								<input type="checkbox" class="custom-control-input templateEdit"
									id="customControlValidation1" name="templateEdit" value="Yes"> 
								<label class="custom-control-label" for="customControlValidation1">
									지금 작성된 공지사항 양식을 다시 저장할 수 있어요!</label>
								<br>
								<small>※ 기존 템플릿이 현재 작성된 것으로 덮어 씌우고 저장됩니다.</small>
							</div>
							
<!-- 							<div class="custom-control custom-radio"> -->
<!-- 								<input type="radio" class="custom-control-input" -->
<!-- 									id="customControlValidation2" name="radio-stacked" required> -->
<!-- 								<label class="custom-control-label" -->
<!-- 									for="customControlValidation2">아니요, 사용하지 않아도 괜찮아요!</label> -->
<!-- 							</div> -->
							
<!-- 							<div class="custom-control custom-radio mb-3"> -->
<!-- 								<input type="radio" class="custom-control-input" -->
<!-- 									id="customControlValidation3" name="radio-stacked" required> -->
<!-- 								<label class="custom-control-label" -->
<!-- 									for="customControlValidation3">네, 사용하려 해요!</label> -->
<!-- 								<div class="invalid-feedback">회신 여부를 알고 싶으신가요? (회신으로는 동의/비동의 간편한 응답만 받을 수 있습니다.)</div> -->
<!-- 							</div> -->
							
							<div class="custom-file">
								<input type="file" class="custom-file-input" name="files" id="validatedCustomFile" multiple="multiple"> 
								<label class="custom-file-label" for="validatedCustomFile">업로드 하실 파일을 선택해주세요.(2개 이상의 파일 업로드 시 첫 번째 파일명만 나타납니다.)</label>
							</div>
							
							<div class="invalid-feedback"></div>
							<c:choose>
								<c:when test="${templateInfo.noticeType eq 'F401' }">
									<button type="submit" class="addBtn btn btn-primary"> 가정통신문 등록 </button>
									<button type="button" class="comeback btn btn-primary"> 돌아가기 </button>
								</c:when>
								<c:otherwise>
									<button type="submit" class="addBtn btn btn-primary"> 알림장 등록 </button>
									<button type="button" class="comeback btn btn-primary"> 돌아가기 </button>
								</c:otherwise>
							</c:choose>
						</form>
					</div>
					<div class="alert alert-info layer" id="cnf" role="alert">
				        <div class="iq-alert-text cnf align-self-center">
				            게시글 등록을 취소 하시겠습니까?(불러온 템플릿은 지워지지 않습니다.)	
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
							
							$('[name="insertForm1"]').on('submit', function(e){
								
								$('.done').text('우리반 공지사항 게시판에 등록 되었어요!');
								$('#done').show();
								setTimeout(function(){
									$('.layer1').hide();
								}, 10000)
								
// 								alert("우리반 공지사항 게시판에 등록 되었어요!");
								
								if($('.templateEdit').is(":checked") == true){
									$('.tem').text('가져온 템플릿에 덮어씌어, 저장 되었습니다.');
									$('#tem').show();
									setTimeout(function(){
										$('.layer2').hide();
									}, 10000)
									
// 									alert("가져온 템플릿에 덮어씌어 저장 되었습니다.");
								}
								return true;
							})
							$('[name="insertForm2"]').on('submit', function(e){
								
								$('.done').text('우리반 공지사항 게시판에 등록 되었어요!');
								$('#done').show();
								setTimeout(function(){
									$('.layer1').hide();
								}, 10000)
								
// 								alert("우리반 공지사항 게시판에 등록 되었어요!");
								
								if($('.templateEdit').is(":checked") == true){
									$('.tem').text('가져온 템플릿에 덮어씌어, 저장 되었습니다.');
									$('#tem').show();
									setTimeout(function(){
										$('.layer2').hide();
									}, 10000)
									
// 									alert("가져온 템플릿에 덮어씌어 저장 되었습니다.");
								}
								return true;
							})
							
							$('.comeback').on('click', function(){
								var type = $('#typeConf').val();
								
								$('#cnf').show();	
					            $("#ok").click(function () {
					            	if(type == 'F401'){
										location.href='../notice/noticeF401List'
									}else{
										location.href='../notice/noticeF402List'
									}
               });
								
// 								if(!confirm("게시글 등록을 취소 하시겠습니까?(불러온 템플릿은 지워지지 않습니다.)")){
// 								    alert("취소 되었습니다.");
// 								}else{
// 									alert("공지게시판으로 돌아갑니다.");
// 									if(type == 'F401'){
// 										location.href='../notice/noticeF401List'
// 									}else{
// 										location.href='../notice/noticeF402List'
// 									}
// 								}
							})
				
						</script>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
