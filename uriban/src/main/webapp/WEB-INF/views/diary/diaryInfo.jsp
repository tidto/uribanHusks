<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.layer {
	display: none;
	position: fixed;
	width: 20%;
	left: 50%;
	margin-left: -10%; /* half of width */
	top: 40%;
	margin-top: -150px; /* half of height */
	overflow: auto;
	z-index: 10000;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="iq-edit-list-data">
					<div class="tab-content">
						<div class="tab-pane fade active show" id="personal-information"
							role="tabpanel">
							<div class="card">
								<div class="card-body">
									<div class="card-body">
										<div
											class="d-flex flex-wrap align-items-center justify-content-between breadcrumb-content">
											<h5>우리 반 &#60;학생 일지&#62;</h5>
										</div>
									</div>
								</div>

								<div class="card-body">
									<div class=" row align-items-center">
										<div class="form-group col-sm-12">
											<input type="hidden" class="form-control" id="studentNo"
												value="${studentInfo.studentNo}" readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<label for="studentNo">반 번호</label> <input type="text"
												class="form-control" id="studentNo"
												value="${studentInfo.studentClassNo}" readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<label for="studentName">이름</label> <input type="text"
												class="form-control" id="studentName"
												value="${studentInfo.studentName}" readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<label for="memberId">아이디</label> <input type="text"
												class="form-control" id="memberId"
												value="${studentInfo.memberId}" readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<label for="birthday">생년월일</label> <input type="text"
												class="form-control" id="birthday"
												value="<fmt:formatDate value="${studentInfo.birthday}"
							pattern="yyyy-MM-dd" />"
												readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<label for="studentSex">성별</label> <input type="text"
												class="form-control" id="studentSex"
												value="${studentInfo.studentSex}" readonly="readonly">
										</div>
									</div>
									<button type="button"
										class="form-group col-sm-12 border border-0"
										onclick="location.href='../diary/diaryStudentList'">학생
										목록</button>


									<!-- 학생일지 insert -->
									<h4>학생일지</h4>
									<form name="diaryForm">
										<div class="card-body border rounded my-2" id="diaryMid">
											<div style="display: flex;">
												<input type="hidden" class="" id="studentNo"
													name="studentNo" value="${studentInfo.studentNo}"
													readonly="readonly">
												<div>
													<label for="diaryName">날짜</label><input type="Date"
														class="border" name="diaryName" id="diaryName"
														value="<fmt:formatDate value="${diaryName}"
							pattern="yyyy-MM-dd" />">
												</div>
												<div>
													<select class="border border-0" name="diaryType"
														id="diaryType">
														<option value="G301">학교생활</option>
														<option value="G302">또래관계</option>
														<option value="G303">가족생활</option>
													</select>
												</div>
											</div>
											<div>
												<label for="diaryContent">내용</label> <input type="text"
													class="form-control" id="diaryContent" name="diaryContent">
											</div>
										</div>
										<div>
											<button type="button" id="addBtn" class="btn btn-primary">
												학생일지 등록</button>
											<button type="button" class="btn btn-secondary">취소</button>
										</div>
									</form>
									<!-- 학생 일지 내용 -->
									<div class="input-group d-flex flex-wrap justify-content-end">
										<select class="custom-select col-lg-3 col-md-3 col-lg-3"
											id="selectMonthDiv" name="month"
											onchange="showMonth(this.value)">
											<option selected value="">전체보기</option>
											<option value="1">1월</option>
											<option value="2">2월</option>
											<option value="3">3월</option>
											<option value="4">4월</option>
											<option value="5">5월</option>
											<option value="6">6월</option>
											<option value="7">7월</option>
											<option value="8">8월</option>
											<option value="9">9월</option>
											<option value="10">10월</option>
											<option value="11">11월</option>
											<option value="12">12월</option>
										</select>
									</div>
									<div class="diarytable">
										<c:forEach items="${diaryInfo}" var="info">
											<div class="diaryitems">
												<div class="card-body border rounded my-2 targetCard "
													data-diaryno="${info.diaryNo}">
													<div style="display: flex;">
														<div>
															<input type="hidden" class="border border-0" id="diaryNo"
																value="${info.diaryNo}" readonly="readonly">
														</div>
														<div class="">
															<label for="diaryName2">작성시간</label> <input type="text"
																class="border border-0" id="diaryName2"
																value="<fmt:formatDate value="${info.diaryName}"
							pattern="yyyy-MM-dd" />">
														</div>
														<div>
															<input type="text" class="border border-0" id="diaryType"
																value="${info.diaryType}" readonly="readonly">
														</div>
														<div class="float-end">
															<button class="btn btn-sm bg-primary diaryDel"
																data-toggle="tooltip" data-placement="top"
																title="" data-original-title="일지삭제">
																<i class="ri-delete-bin-line mr-0"></i>
															</button>
														</div>
													</div>
													<div>
														<label for="diaryContent">내용</label> <input type="text"
															class="form-control" id="diaryContent"
															value="${info.diaryContent}" readonly="readonly">
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
		</div>
		<div class="alert alert-info layer" id="cnf" role="alert">
			<div class="iq-alert-text cnf align-self-center">학생일지가 등록
				되었습니다.</div>
			<div>
				<button type="button" id="ok"
					class="btn btn-info float-right close2">확인</button>
			</div>
		</div>
		<div class="alert alert-info layer" id="cnf1" role="alert">
			<div class="iq-alert-text cnf align-self-center">일지 구분을 선택하세요.</div>
			<div>
				<button type="button" id="ok1"
					class="btn btn-info float-right close1">확인</button>
			</div>
		</div>

		<div class="alert alert-info layer" id="cnf2" role="alert">
			<div class="iq-alert-text cnf align-self-center">날짜를 선택하세요.</div>
			<div>
				<button type="button" id="ok2"
					class="btn btn-info float-right close1">확인</button>
			</div>
		</div>
		<div class="alert alert-info layer" id="cnf3" role="alert">
			<div class="iq-alert-text cnf align-self-center">내용을 입력하세요.</div>
			<div>
				<button type="button" id="ok3"
					class="btn btn-info float-right close1">확인</button>
			</div>
		</div>

				<div class="alert alert-info layer" id="cnf4" role="alert">
			<div class="iq-alert-text cnf align-self-center">선택한 일지를 삭제할까요?</div>
			<div>
				<button type="button"
					class="btn btn-outline-info float-right close1">취소</button>
				<button type="button" id="ok4" class="btn btn-info float-right">확인</button>
			</div>
		</div>
		<div class="alert alert-info layer" id="cnf5" role="alert">
			<div class="iq-alert-text cnf align-self-center">취소 되었습니다.</div>
			<div>
				<button type="button" id="ok1"
					class="btn btn-info float-right close1">확인</button>
			</div>
		</div>
		<div class="alert alert-info layer" id="cnf6" role="alert">
			<div class="iq-alert-text cnf align-self-center">삭제 되었습니다.</div>
			<div>
				<button type="button" id="ok7"
					class="btn btn-info float-right close3">확인</button>
			</div>
		</div>
	</div>
	<script>
	$('.close1').on('click', function() {
		$('.layer').hide();
	})
	
	$('.close2').on('click', function() {
		$('.layer').hide();
		location.reload(true);
	})
	
	$('.close3').on('click', function() {
		$('.layer').hide();
		location.reload(true);
	})
	
	$('[name=month]').val('${diaryVO.month}')

    $('#diaryMid')[0].scrollIntoView();
 
	$('#addBtn').on('click', function(e) {
		   
	    let studentNo = $('[name="studentNo"]').val();
	    let diaryType = $('[name="diaryType"]').val();
	    let diaryName = $('[name="diaryName"]').val();
	    let diaryContent = $('[name="diaryContent"]').val();

	    let obj = {studentNo, diaryType, diaryName, diaryContent}
	    
	    if (diaryType === '') {
	    	$('#cnf1').show();
	        return;
	    }

	    if (diaryName === '') {
	    	$('#cnf2').show();
	        return;
	    }

	    if (diaryContent === '') {
	    	$('#cnf3').show();
	        return;
	    }
	    
	    
		$.ajax({
			type : "post",
			url : "../diary/diaryInsert",
			contentType : "application/json",
			data : JSON.stringify(obj),
			success : function(info) {
				
				
				
				let setting =`
				
				<div class="diaryitems">
				
					<div class="card-body border rounded my-2 targetCard " data-diaryno="\${info.diaryNo}">
					<div style="display: flex;">
						<div>
							<input type="hidden" class="border border-0" id="diaryNo"
								value="${info.diaryNo}" readonly="readonly">
						</div>
						<div class="">
							<label for="diaryName2">작성시간</label> <input type="text"
								class="border border-0" id="diaryName2"
								value="\${info.diaryName}">
						</div>
						<div>
							<input type="text" class="border border-0" id="diaryType"
								value="\${info.diaryType}" readonly="readonly">
						</div>
						<div class="float-end">
							<button class="btn btn-sm bg-primary"
								data-toggle="tooltip" name="diaryDel"
								data-placement="top" title="" data-original-title="일지삭제">
								<i class="ri-delete-bin-line mr-0"></i>
							</button>
						</div>
					</div>
					<div>
						<label for="diaryContent">내용</label> <input type="text"
							class="form-control" id="diaryContent"
							value="\${info.diaryContent}" readonly="readonly">
					</div>
				</div>
			</div>`
				
			$(".diarytable").append(setting)
				
			},
				error : function(error) {				
					console.log(error)
					
			}
		})
		$('#cnf').show();
	});
	
	function showMonth(value){
		let studentNo = $('[name="studentNo"]').val();
		
		location.href='../diary/diaryInfo?studentNo='+studentNo+'&month='+value;
	}
    
	$('.diaryDel').click(function(e) {
	    e = e || window.event;
	    let diaryNo = $(e.target).closest(".targetCard").data("diaryno");
	    let diaryItem = $(e.target).closest(".diaryitems");

	    $('#cnf4').show();
	    $('#ok4').off('click').click(function () {
	        $('#cnf5').show();
	        $.ajax({
	            url: 'diaryDelete',
	            type: "POST",
	            data: { diaryNo },
	        })
	        .done(result => {
	            if (result >= 0) {
	                $('#cnf6').show();
	                diaryItem.remove();
	            }
	        })
	        .fail(reject => console.log(reject));
	    });
	});





		
	/* if (!confirm("선택한 일지를 삭제할까요?")) {
		
			} else {
			
			}
		} */
	</script>
</body>
</html>