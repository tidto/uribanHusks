<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12 col-lg-12">

				<div class="card">
					<div class="card-header d-flex justify-content-between">
						<div class="header-title">
							<h4 class="card-title">공지 사항 등록</h4>
							<a href="templateList" class="ri-edit-box-line m-0"> 양식 가져오기</a>
						</div>
					</div>
					<div class="card-body">
						<p>학생분들과 학부모분들께 전달하고 싶은 공지 게시판을 작성하는 페이지 입니다!</p>
						<form class="was-validated" name="insertForm" action="noticeInsert" method="post">
							<div class="form-group">
								<select class="custom-select" required name="noticeType">
									<option>---공지 유형 선택---</option>
									<option value="F401">가정통신문</option>
									<option value="F402">알림장</option>
								</select>
								<div class="invalid-feedback">공지게시판에 올라갈 유형을 선택해주세요!</div>
							</div>
								<input type="hidden" name="classId" value="bbeong">
							
							<div class="mb-3">
								<label for="validationTextarea">공지사항 제목</label>
								<textarea class="form-control is-invalid" name="noticeTitle"
									id="validationTextarea" placeholder="공지사항 내용을 작성해 주세요."
									required></textarea>
								<div class="invalid-feedback">알림장을 작성하시는 선생님은 제목은 작성하지 않으셔도 됩니다 :)</div>
							</div>
							
							
							<div class="mb-3">
								<label for="validationTextarea">공지사항 내용</label>
								<textarea class="form-control is-invalid" name="noticeContent"
									id="validationTextarea" placeholder="공지사항 내용 작성란"
									required></textarea>
								<div class="invalid-feedback">공지사항 게시판에 올려 전달할 내용을 작성해 주세요!</div>
							</div>
							
							<div class="custom-control custom-checkbox mb-3">
								<input type="checkbox" class="custom-control-input"
									id="customControlValidation1" required> 
								<label class="custom-control-label" for="customControlValidation1">
								지금 작성된 공지사항 양식을 저장하려해요!</label>
								<div class="invalid-feedback">지금 작성되어 있는 공지 유형과 제목, 내용을 
								다음에 공지사항 게시글을 올리실 때 저장된 양식으로 그대로 가져올 수 있어요!</div>
							</div>
							
							<div class="custom-control custom-radio">
								<input type="radio" class="custom-control-input"
									id="customControlValidation2" name="radio-stacked" required>
								<label class="custom-control-label"
									for="customControlValidation2">아니요, 사용하지 않아도 괜찮아요!</label>
							</div>
							
							<div class="custom-control custom-radio mb-3">
								<input type="radio" class="custom-control-input"
									id="customControlValidation3" name="radio-stacked" required>
								<label class="custom-control-label"
									for="customControlValidation3">네, 사용하려 해요!</label>
								<div class="invalid-feedback">회신 여부를 알고싶으신가요? (회신으로는 동의/비동의 간편한 응답만 받을 수 있습니다.)</div>
							</div>
							
<!-- 							<div class="custom-file"> -->
<!-- 								<input type="file" class="custom-file-input" -->
<!-- 									id="validatedCustomFile" required> <label -->
<!-- 									class="custom-file-label" for="validatedCustomFile">Choose -->
<!-- 									file...</label> -->
<!-- 							</div> -->
							<div class="invalid-feedback"></div>
							<button type="submit" id="addBtn" class="btn btn-primary"> 공지사항 등록 </button>
						</form>
					</div>
						<script>
							$('[name="insertForm"]').on('submit', function(e){
								e.preventDefault();
								
								let type = $('[name="noticeType"]');
								let content = $('[name="noticeContent"]');
								
								if(type.val() == ''){
									alert('게시할 공지의 유형을 선택해주세요!');
									type.focus();
									return;
								}
								
								if(content.val() == ''){
									alert('게시할 공지 내용을 작성해주세요!');
									content.focus();
									return;
								}
					
								alert("우리반 공지사항 게시판에 등록 되었어요!");
								insertForm.submit();
							})
						</script>
				</div>
			</div>
		</div>
	</div>
</body>
</html>