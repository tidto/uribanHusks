<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항 수정</title>
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
							<h4 class="card-title">공지 사항 수정</h4>
						</div>
					</div>
					<div class="card-body">
						<p>해당 ${noticeList.noticeType } 게시판을 수정하는 페이지 입니다!</p>
						<form class="was-validated" name="insertForm" action="noticeInsert" method="post">
							<div class="card mb-3">
								<div class="card-body">
									<div class="row">
										<div class="col-lg-6">
											<h5 class="mb-2">${noticeInfo.noticeType }</h5>
										</div>
									</div>
								</div>
							</div>
							
<!-- 							<input type="hidden" name="noticeNo"> -->
<!-- 							<input type="hidden" name="classId"> -->
							
							<div class="mb-3">
								<label for="validationTextarea">공지사항 제목</label>
								<textarea class="form-control is-invalid" name="noticeTitle"
									id="validationTextarea" placeholder="공지사항 내용을 작성해 주세요."
									required></textarea>
								<div class="invalid-feedback">해당 게시판의 제목을 수정합니다 :)</div>
							</div>
							
							<div class="mb-3">
								<label for="validationTextarea">공지사항 내용</label>
								<textarea class="form-control is-invalid" name="noticeContent"
									id="validationTextarea" placeholder="공지사항 내용 작성란"
									required></textarea>
								<div class="invalid-feedback">해당 게시판의 내용을 수정합니다 :)</div>
							</div>
							
<!-- 							<div class="custom-control custom-checkbox mb-3"> -->
<!-- 								<input type="checkbox" class="custom-control-input" -->
<!-- 									id="customControlValidation1" required> <label -->
<!-- 									class="custom-control-label" for="customControlValidation1">지금 작성된 공지사항 양식을 저장하려해요!</label> -->
<!-- 								<div class="invalid-feedback">지금 작성되어 있는 공지 유형과 제목, 내용을  -->
<!-- 								다음에 공지사항 게시글을 올리실 때 저장된 양식으로 그대로 가져올 수 있어요!</div> -->
<!-- 							</div> -->
							
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
<!-- 								<div class="invalid-feedback">회신 여부를 알고싶으신가요? (회신으로는 동의/비동의 간편한 응답만 받을 수 있습니다.)</div> -->
<!-- 							</div> -->
							
<!-- 							<div class="custom-file"> -->
<!-- 								<input type="file" class="custom-file-input" -->
<!-- 									id="validatedCustomFile" required> <label -->
<!-- 									class="custom-file-label" for="validatedCustomFile">Choose -->
<!-- 									file...</label> -->
<!-- 							</div> -->
							<div class="invalid-feedback"></div>
						</form>
						<button type="submit" id="addBtn" class="btn btn-primary"> 공지사항 등록 </button>
					</div>
						<script>
							$('[name="insertForm"]').on('submit', function(e){
								console.log("sss");
					// 			e.preventDefault();
								
					// 			let content = $('[name="noticeContent"]');
								
					// 			if(content.val() == ''){
					// 				alert('게시할 공지 내용을 작성해주세요!');
					// 				content.focus();
					// 				return;
					// 			}
					
					// 			alert("우리반 공지사항 게시판에 등록 되었어요!");
					// 			insertForm.submit();
							})
						</script>
				</div>
			</div>
		</div>
	</div>
</body>
</html>