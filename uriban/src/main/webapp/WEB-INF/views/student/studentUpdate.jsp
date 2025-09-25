<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
											<h5>우리 반 &#60;학생 정보 수정&#62;</h5>
										</div>
									</div>
								</div>
								<div class="card-body">
									<form name="studentUpdateForm"
										action="studentUpdate?${_csrf.parameterName}=${_csrf.token}"
										method="post" accept-charset="utf-8">
										<div class=" row align-items-center">
											<div class="form-group col-sm-12">
												<input type="hidden" class="form-control" id="classId"
													name="classId" value="${studentInfo.classId}">
											</div>
											<div class="form-group col-sm-12">
												<input type="hidden" class="form-control" id="studentNo"
													name="studentNo" value="${studentInfo.studentNo}">
											</div>
											<div class="form-group col-sm-12">
												<label for="studentClassNo">반번호</label> <input type="text"
													class="form-control" id="studentClassNo"
													name="studentClassNo" value="${studentInfo.studentClassNo}">
											</div>
											<div class="form-group col-sm-12">
												<label for="studentName">이름</label> <input type="text"
													class="form-control" id="studentName" name="studentName"
													readonly="readonly" value="${studentInfo.studentName}">
											</div>
											<div class="form-group col-sm-12">
												<label for="memberId">아이디</label> <input type="text"
													class="form-control" id="memberId" name="memberId"
													value="${studentInfo.memberId}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="studentEmail">메일</label> <input type="text"
													class="form-control" id="studentEmail" name="studentEmail"
													value="${studentInfo.studentEmail}">
											</div>
											<div class="form-group col-sm-12">
												<label for="birthday">생년월일</label> <input type="text"
													class="form-control" id="birthday" name="birthday"
													value="<fmt:formatDate value="${studentInfo.birthday}"
							pattern="yyyy-MM-dd" /> ">
											</div>
											<div class="form-group col-sm-12">
												<label for="studentSex">성별</label> <select
													class="form-control" id="studentSex" name="studentSex">
													<option value="남자"
														${studentInfo.studentSex == '남자' ? 'selected' : ''}>남자</option>
													<option value="여자"
														${studentInfo.studentSex == '여자' ? 'selected' : ''}>여자</option>
												</select>
											</div>
											<div class="form-group col-sm-12">
												<label for="remark">가정환경</label> <select
													class="form-control" id="remark" name="remark">
													<option value="G106"
														${studentInfo.remark == '해당없음' ? 'selected' : ''}>해당없음</option>
													<option value="G101"
														${studentInfo.remark == '다문화가정' ? 'selected' : ''}>다문화가정</option>
													<option value="G102"
														${studentInfo.remark == '한부모가정' ? 'selected' : ''}>한부모가정</option>
													<option value="G103"
														${studentInfo.remark == '조부모가정' ? 'selected' : ''}>조부모가정</option>
													<option value="G104"
														${studentInfo.remark == '기초생활수급자' ? 'selected' : ''}>기초생활수급자</option>
													<option value="G105"
														${studentInfo.remark == '차상위계층' ? 'selected' : ''}>차상위계층</option>
												</select>
											</div>

											<div class="form-group col-sm-12">
												<label class="mr-2">알레르기</label>
												<div>
													<input type="hidden" class="mr-2" id="allergy"
														name="allergy" value="">
													<c:forEach items="${G2}" var="info">
														<label>${info.subCdNm}</label>
														<input type="checkbox" class="mr-2 allergyList"
															value="${info.subCd}"
															${fn:contains(students.allergy, info.subCdNm) ? 'checked' : ''}>
													</c:forEach>
												</div>
											</div>
										</div>
										<button type="button" class="btn btn-primary mr-2">등록</button>
										<button type="reset" class="btn iq-bg-danger"
											onclick="location.href='../student/studentList'">취소</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="alert alert-info layer" id="cnf" role="alert">
			<div class="iq-alert-text cnf align-self-center">수정 되었습니다.</div>
			<div>
				<button type="button" id="ok"
					class="btn btn-info float-right close1">확인</button>
			</div>
		</div>
	</div>
	<script>
	$('form > :button').on('click', studentUpdate);

	function studentUpdate(event) {
	    // 보낼 데이터
	    let studentNo = $('[name="studentNo"]').val();
	    let objData = getStudentInfo();
	    let allergy = [];

	    // AJAX 요청 데이터
	    $('.allergyList:checked').each(function(i, checkbox) {
	        let val = $(checkbox).val();
	        allergy.push(val);
	    });

	    objData.allergy = allergy.join();
	    let requestData = JSON.stringify(objData);

	    $('#cnf').show();	

	    $("#ok").click(function () {
	        $.ajax('studentUpdate', {
	            type: 'post',
	            contentType: 'application/json',
	            data: requestData,
	        })
	        .done(result => {
	            let message = '결과 : ' + result['result'];
	            location.href = "../student/studentInfo?studentNo=" + studentNo;
	        })
	        .fail(reject => console.log(reject));
	    });  
	}


	
	function getStudentInfo() {
		
	    let formData = $('form').serializeArray();
	    let formObj = {};
	    
	    $.each(formData, function (idx, obj) {
	        if (formObj[obj.name]) {
	            if (!Array.isArray(formObj[obj.name])) {
	                formObj[obj.name] = [formObj[obj.name]];
	            }
	            formObj[obj.name].push(obj.value);
	        } else {
	            formObj[obj.name] = obj.value;
	        }
	    });
	    return formObj;
	}
	
	</script>
</body>
</html>