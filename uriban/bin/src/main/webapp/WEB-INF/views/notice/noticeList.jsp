<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#noticeDel{
		margin-right: 9px;
	}
	h6{
	 color: #807e7e;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<!-- 	가정통신문 알림장 따로 (제목 유무) -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="d-flex flex-wrap align-items-center justify-content-between breadcrumb-content">
							<h5>우리 반 공지사항</h5>
							<div class="d-flex flex-wrap align-items-center">
								<div class="dropdown dropdown-project mr-3">
									<div class="dropdown-toggle" id="dropdownMenuButton03"
										data-toggle="dropdown">
										<div class="btn bg-body">
											<span class="h6">필터 :</span> 전체<i
												class="ri-arrow-down-s-line ml-2 mr-0"></i>
										</div>
									</div>
									<div class="dropdown-menu dropdown-menu-right"
										aria-labelledby="dropdownMenuButton03">
										<a class="dropdown-item" href="#">
											<i class="ri-mic-line mr-2"></i>전체 공지</a> 
										<a class="dropdown-item" href="#">
											<i class="ri-attachment-line mr-2"></i>가정통신문</a> 
										<a class="dropdown-item" href="#">
											<i class="ri-file-copy-line mr-2"></i>알림장</a>
									</div>
								</div>
								<a href="noticeInsert" class="btn btn-primary">새 공지사항 등록하기</a>
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
							<c:forEach items="${noticeList }" var="nl"  varStatus="stats"> 
								<div class="card card-widget task-card">
									<div class="card-body">
										<div class="d-flex flex-wrap align-items-center justify-content-between">
											<div class="d-flex align-items-center">
												<div>
													<h5 class="mb-2">${nl.noticeType }</h5>
														<h6 class="mb-2">${nl.noticeTitle }</h6>
													<div class="media align-items-center">
														<div class="btn bg-body mr-3">
															<i class="ri-align-justify mr-2"></i>
<%-- 															<a><fmt:formatDate value="${nl.noticeDate }" pattern="yy년 MM월 dd일 HH시 mm분"/></a> --%>
															<a class="nowtime"><fmt:formatDate value="${nl.noticeDate }" pattern="yyyy-MM-dd HH:mm:ss"/></a>
														</div>
														<div class="btn bg-body">
															<i class="ri-survey-line mr-2"></i>
														</div>
													</div>
												</div>
												
											</div>
											<div class="media align-items-center mt-md-0 mt-3">
											<a class="btn bg-secondary-check" data-toggle="collapse"
												href="#collapseEdit${stats.count }" role="button" aria-expanded="false"
												aria-controls="collapseEdit${stats.count }">
												<i class="ri-edit-box-line m-0"> 펼쳐서 확인하기</i>
											</a>
											</div>
 										</div>
									</div>
								</div>
								<input type="hidden" value="${nl.classNo}" id="classNo" name="classNo">
								<div class="collapse" id="collapseEdit${stats.count }">
									<div class="card card-list task-card">
										<div
											class="card-header d-flex align-items-center justify-content-between px-0 mx-3">
											<div class="header-title">
												<h5 class="mb-2">${nl.noticeType } ${nl.noticeTitle }</h5>
												<h6 class="mb-2">게시일자: <fmt:formatDate value="${nl.noticeDate }" pattern="yyyy년 MM월 dd일 HH시 mm분"/></h6>
												<h6 class="mb-2" id="nowtime"></h6>
											</div>
											
											<div>
												<a id="edit" href="noticeUpdate" class="btn bg-secondary-light">수정</a>
												<a id="noticeDel" class="btn bg-secondary-del">삭제</a>
											</div>
											
											
										</div>
										<div class="card-body">
											
											<div class="card mb-3">
												<div class="card-body">
													<div class="row">
														<div class="col-lg-6">
															<h5 class="mb-2">${nl.noticeContent }</h5>
															<p class="mb-0"></p>
														</div>
													</div>
												</div>
											</div>
											
											<div class="card mb-3">
												<div class="card-body">
													<div class="row">
														<div class="col-lg-6">
															<h5 class="mb-2"> 회신을 필요로하는 통신문 입니다!</h5>
															<p class="mb-0">--주의문--Amet minim mollit non deserunt
																ullamco est sit aliqua dolor do amet sint. Velit officia
																consequat duis enim velit mollit. Exercitation veniam
																consequat sunt nostrud amet.Amet minim mollit non deserunt
																ullamco est sit aliqua dolor do amet sint. Velit officia
																consequat duis enim velit mollit. Exercitation veniam
																consequat sunt nostrud amet.</p>
														</div>
														<div class="col-lg-6">
															<h5 class="mb-2">선생님께 보낼 답변을 골라주세요!</h5>
															<div></div>
															<div class="row">
															
																<div class="custom-control custom-radio mb-3">
																	<input type="radio" class="custom-control-input"
																		id="customControlValidation3" name="radio-stacked" required>
																	<label class="custom-control-label"
																		for="customControlValidation3">네, 잘 부탁드려요. </label>
																</div>
																
															</div>
															<div class="row">
															
																<div class="custom-control custom-radio">
																	<input type="radio" class="custom-control-input"
																		id="customControlValidation2" name="radio-stacked" required>
																	<label class="custom-control-label"
																		for="customControlValidation2">아니요, 괜찮습니다. </label>
																</div><br>
																
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="form-group mb-0">
												<label for="exampleInputText01" class="h5">Attachments</label>
												<div class="custom-file">
													<input type="file" class="custom-file-input"
														id="inputGroupFile001"> <label
														class="custom-file-label" for="inputGroupFile001">Upload
														media</label>
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
	
	<script>
		$('#noticeDel').on('click', noticeDrop);
		
		function noticeDrop(e){
			let drop = noticeDel();
			
			$.ajax('noticeDrop',{
				type : 'post',
				contentType : 'application/json',
				data : JSON.stringify(drop)
			})
			.done(result => {
				if(result == 1){
					alert("삭제되었습니다.");
					location.href="noticeList";
				}else{
					alert("오류로 인해 삭제가 취소되었습니다");
				};
			})
			.fail(reject => console.log(reject));
		}
	
	
		
		$('.nowtime').each(function(idx, tag){
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
			} else {
				elapsedText = SimpleDateTimeFormat(date, "yyyy.M.d");
			}
			
			return elapsedText;
		}
	</script>
</body>
</html>