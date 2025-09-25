<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="iq-edit-list-data">
					<div class="tab-content">
						<div class="tab-pane fade active show" id="personal-information" role="tabpanel">
							<div class="card">
								<div class="card-header d-flex justify-content-between">
									<div class="iq-header-title">
										<h4 class="card-title">학사일정 등록</h4>
									</div>
								</div>
								<div class="card-body">
									<form name="scheduleInsertForm" action="scheduleInsert" method="post">
										<div class=" row align-items-center">
											<div class="form-group col-sm-12">
												<label for="memberId">학사일정 번호</label>
												<input type="text" class="form-control" name="scheduleNo" value="${scheduleNo}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="memberName">반ID</label>
												<input type="text" class="form-control" name="classId">
											</div>
											<div class="form-group col-sm-12">
												<label for="phone">공지번호</label>
												<input type="text" class="form-control" name="noticeNo">
											</div>
											<div class="form-group col-sm-12">
												<label for="email">등록자</label>
												<input type="text" class="form-control" name="scheduleWriter">
											</div>
											<div class="form-group col-sm-12">
												<label for="auth">제목</label>
												<input type="text" class="form-control" name="scheduleTitle">
											</div>
											<div class="form-group col-sm-12">
												<label for="createDate">시작날짜</label>
												<input type="text" class="form-control" name="startDate">
											</div>
											<div class="form-group col-sm-12">
												<label for="createDate">종료날짜</label>
												<input type="text" class="form-control" name="endDate">
											</div>
											<div class="form-group col-sm-12">
												<label>행사항목</label>
												<select class="form-control" name="scheduleCategory">
													<option value="D101">정기행사일정</option>
	                                    			<option value="D102">교내 행사</option>
	                                    			<option value="D103">학부모 참관일</option>
	                                    			<option value="D104">생일</option>
												</select>
											</div>
										</div>
										<button type="submit" class="btn btn-primary mr-2">등록</button>
										<button type="button" class="btn iq-bg-danger" onclick="location.href='scheduleList'">취소</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
			$('[name="scheduleInsertForm"]').on('click'', function(event){
				event.preventDefault();
				
				let title = $('[name="scheduleTitle"]');
				if (title.val() == ''){
					alert("도서명이 입력되지 않았습니다.");
					title.focus();
					return;
				}
				let a = document.getElementById('category').options[document.getElementById('category').selectedIndex].text;
				
				alert('게시글이 등록되었습니다.');
				scheduleInsertForm.submit();
				
			});
		
		
	</script>
</body>
</html>