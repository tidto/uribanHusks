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
									<form name="scheduleInsertForm" action="scheduleInsert?${_csrf.parameterName}=${_csrf.token}" method="post" accept-charset="utf-8">
										<input type="hidden" name="scheduleNo" value="${scheduleNo}">
										<div class=" row align-items-center">
											<%--<div class="form-group col-sm-12">
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
											</div>--%>
											<%--<div class="form-group col-sm-12">
												<label for="email">등록자</label>
												<input type="text" class="form-control" name="scheduleWriter">
											</div>--%>
											<div class="form-group col-sm-12">
												<label for="auth">제목</label>
												<input type="text" class="form-control" name="scheduleTitle">
											</div>
											<div class="form-group col-sm-12">
												<label for="createDate">시작날짜</label>
												<input type="date" class="form-control" name="startDate">
											</div>
											<div class="form-group col-sm-12">
												<label for="createDate">종료날짜</label>
												<input type="date" class="form-control" name="endDate">
											</div>
											<div class="form-group col-sm-12">
												<label>행사항목</label>
												<select class="custom-select" name="scheduleCategory">
													<option value="D101">정기행사일정</option>
	                                    			<option value="D102">교내 행사</option>
	                                    			<option value="D103">학부모 참관일</option>
	                                    			<option value="D104">생일</option>
												</select>
											</div>
												<div class="form-group col-sm-12 input-group  mb-4">
													<label>공지사항</label>
d													<input type="hidden" class="form-control" name="noticeNo" id="noticeNo" value="${noticeVO.noticeNo}">
													<div class="input-group mb-4">
														<input type="text" class="form-control" placeholder="공지사항 제목을 입력해주세요." aria-label="Recipient's username" id="noticeSearch" value="${noticeVO.noticeTitle}">
														<div class="input-group-prepend show noticeBox">
														</div>
														<div class="input-group-append">
																<span class="input-group-text" id="inputGroup-sizing-default">
																	<button type="button" class="close" data-dismiss="alert" aria-label="Close" id="btn-clear">
																		<i class="ri-close-line"></i>
																	</button>
																</span>
														</div>
													</div>
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
	   	$('[name="scheduleInsertForm"]').on("submit", function(event){
			event.preventDefault();
			
			let title = $('[name="scheduleTitle"]');
			if (title.val() == ''){
				alert("제목이 입력되지 않았습니다.");
				title.focus();
				return;
			}
			//let a = document.getElementById('category').value;
			let category = $('select[name="scheduleCategory"]').val();
			
			alert('게시글이 등록되었습니다.');
			scheduleInsertForm.submit();
		});

		function fn_selectNotice(t){
			var noticeNo = $(t).attr("data-notice-no");
			var noticeTitle = $(t).html();
			$("#noticeSearch").val(noticeTitle);
			$("#noticeNo").val(noticeNo);
			$(".noticeBox").html("");

		}
		var noticeList = ${noticeList};
		function findMatches(wordToMatch) {
			return noticeList.filter(notice => {
				const regex = new RegExp(wordToMatch, 'gi');
				return notice.noticeTitle.match(regex)
			});
		}

		function displayInputValue(){
			var keyword = $("#noticeSearch").val();
			if(keyword === "") {
				$(".noticeBox").html("");
				return;
			}
			const resultArr = findMatches(keyword);
			var tb = $('<div class="dropdown-menu show noticeTitleBox" style="position: absolute;transform: translate3d(0px, 50px, 0px);top: 0px;left: 0px;will-change: transform;display: flex;flex-wrap: wrap;align-items: stretch;width: 100%;" x-placement="bottom-start"></div>');
			if(resultArr.length==0){
				var $li = $('<a href="javascript:fn_noticeSelect(this);" class="dropdown-item">'+'검색된 내용이 없습니다.'+'</a>')
				$(tb).append($li);
			}
			resultArr.forEach((el, idx) => {
				var noticeTitle = el.noticeTitle;
				var noticeNo = el.noticeNo;
				var $li = $('<a href="#" class="dropdown-item" onclick="fn_selectNotice(this);" data-notice-no="'+noticeNo+'" >'+noticeTitle+'</a>')
				$(tb).append($li);
			})
			$(".noticeBox").html(tb);
		}
		$(function (){
			$('[id="noticeSearch"]').on("focusout", function(event){
				event.preventDefault();
			});
			$('[id="noticeSearch"]').on("focusin click change keyup", function(event){
				event.preventDefault();
				displayInputValue();
			});
			$('[id="btn-clear"]').on("click", function(event){
				event.preventDefault();
				$("#noticeSearch").val("");
				$("#noticeNo").val("");
				displayInputValue();

			});
		})
	</script>
</body>
</html>

