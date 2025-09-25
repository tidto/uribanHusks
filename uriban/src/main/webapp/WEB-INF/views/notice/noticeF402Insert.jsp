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
	#addBtn{
		float: right;
		margin: 20px;
	}
	#comeback{
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
<sec:authentication property="principal" var="p" />
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12 col-lg-12">

				<div class="card">
					<div class="card-header d-flex justify-content-between">
						<div class="header-title">
							<h4 class="card-title">알림장 -> 공지 게시판 등록</h4>
							<a href="../notice/templateList?memberId=${p.memberId }" class="ri-edit-box-line m-0"> 양식 가져오기</a>
						</div>
					</div>
					<div class="card-body">
						<p>학생분들과 학부모분들께 전달하고 싶은 알림장을 게시판에 작성하는 페이지 입니다.<br>
							(공지 등록 시 클래스 전원에게 자동으로 회람 톡이 전송됩니다.)</p>
						<form class="was-validated" name="insertForm" action="../notice/noticeF402Insert?${_csrf.parameterName}=${_csrf.token}" accept-charset="UTF-8" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<select class="custom-select" required name="noticeType">
									<option value="F402" selected="selected">알림장</option>
								</select>
								<div class="invalid-feedback">알림장 등록에선 알림장만 등록이 가능합니다.</div>
							</div>
								<!-- 클래스 ID 추가시 값 변경 -->
								<input type="hidden" id="classId" name="classId" value="${ourClassId }">
								<!-- 멤버아이디 임의로 받아옴 -->
								<input type="hidden" id="memberId" name="memberId" value="${p.memberId }"> <!-- ${p.memberId } -->
							
							<div class="mb-3">
								<label for="validationTextarea">공지사항 내용</label>
								<textarea rows="13" class="form-control is-invalid" name="noticeContent"
									id="validationTextarea" placeholder="공지사항 내용을 작성할 수 있어요."
									maxlength="1600" required></textarea>
								<div class="invalid-feedback">우리반 공지에 전달할 알림장 내용을 작성해 주세요.</div>
							</div>
							
							<div class="custom-control custom-checkbox mb-3">
								<input type="checkbox" class="custom-control-input templateAdd"
									id="customControlValidation1" name="templateAdd" value="Yes"> 
								<label class="custom-control-label" for="customControlValidation1">
									지금 작성된 공지사항을 개인 템플릿에 저장할 수 있습니다.</label>
								<br>
								<small>지금 작성되어 있는 공지 유형과 내용을 
									게시글을 작성때 저장된 양식으로 그대로 가져올 수 있어요!</small>
							</div>
							
							<div class="custom-file">
								<input type="file" class="custom-file-input" name="files" id="validatedCustomFile" multiple="multiple"> 
								<label class="custom-file-label" for="validatedCustomFile">업로드 하실 파일을 선택해주세요.(2개 이상의 파일 업로드 시 첫 번째 파일명만 나타납니다.)</label>
							</div>
							
							<div class="invalid-feedback"></div>
							<button type="submit" id="addBtn" class="btn btn-primary"> 알림장 공지사항 등록 </button>
							<button type="button" id="comeback" class="btn btn-primary">돌아가기</button>
						</form>
					</div>
					<div class="alert alert-info layer" id="cnf" role="alert">
				        <div class="iq-alert-text cnf align-self-center">
				            게시글 등록을 취소 하시겠습니까?	
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
						
							$('[name="insertForm"]').on('submit', function(e){	
								
								$('.done').text('우리반 공지에 알림장이 등록 되었습니다.');
								$('#done').show();
								setTimeout(function(){
									$('.layer1').hide();
								}, 10000)
								
								if($('.templateAdd').is(":checked") == true){
									$('.tem').text('교사님 개인 템플릿에 저장되었습니다.');
									$('#tem').show();
									setTimeout(function(){
										$('.layer2').hide();
									}, 10000)
								}
								
// 								alert("우리반 공지에 알림장이 등록 되었습니다.");
								
// 								if($('.templateAdd').is(":checked") == true){
// 									alert("교사님 개인 템플릿에 저장되었습니다.");
// 								}
								return true;
							})
							
							$('#comeback').on('click', function(){
								$('#cnf').show();	
					            $("#ok").click(function () {
					            	location.href='../notice/noticeF402List'
					            });
// 								if(confirm("게시글 등록을 취소 하시겠습니까?")){
// 									alert("공지게시판으로 돌아갑니다.")
// 									location.href='../notice/noticeF402List'
// 								}
							})
				
						</script>
				</div>
			</div>
		</div>
	</div>
</body>
</html>