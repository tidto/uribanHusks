<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
											<h5>우리 반 &#60;학부모 정보 수정&#62;</h5>
										</div>
									</div>
								</div>
								<div class="card-body">
									<form>
										<div class=" row align-items-center">
											<div class="form-group col-sm-12">
												<input type="hidden" class="form-control" id="parentsNo"
													name="parentsNo" value="${parentsInfo.parentsNo}"
													readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<input type="hidden" class="form-control" id="classId"
													name="classId" value="${parentsInfo.classId}"
													readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="memberId">아이디</label> <input type="text"
													class="form-control" id="memberId" name="memberId"
													readonly="readonly" value="${parentsInfo.memberId}">
											</div>
											<div class="form-group col-sm-12">
												<label for="parentsName">이름</label> <input type="text"
													class="form-control" id="parentsName" name="parentsName"
													readonly="readonly" value="${parentsInfo.parentsName}">
											</div>
											<div class="form-group col-sm-12">
												<label for="studentName">자녀</label> <input type="text"
													class="form-control" id="studentName"
													value="${parentsInfo.studentName}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="parentsRel">성별</label> <select
													class="form-control" id="parentsRel" name="parentsRel">
													<option value="모"
														${parentsInfo.parentsRel == '모' ? 'selected' : ''}>모</option>
													<option value="부"
														${parentsInfo.parentsRel == '부' ? 'selected' : ''}>부</option>
													<option value="조모"
														${parentsInfo.parentsRel == '조모' ? 'selected' : ''}>조모</option>
													<option value="조부"
														${parentsInfo.parentsRel == '조부' ? 'selected' : ''}>조부</option>
												</select>
											</div>
											<div class="form-group col-sm-12">
												<label for="parentsEmail">이메일</label> <input type="text"
													class="form-control" id="parentsEmail" name="parentsEmail"
													value="${parentsInfo.parentsEmail}">
											</div>
											<div class="form-group col-sm-12">
												<label for="parentsTel">연락처</label> <input type="text"
													class="form-control" id=parentsTel name="parentsTel"
													value="${parentsInfo.parentsTel}">
											</div>
										</div>
										<button type="reset" class="btn iq-bg-danger"
											onclick="location.href='../parents/parentsList'">취소</button>
										<button type="button" class="btn btn-primary mr-2">수정</button>
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
	$('form > :button').on('click', parentsUpdate);
		function parentsUpdate(event){
				// 보낼 데이터
				let parentsNo = $('[name="parentsNo"]').val();
				let objData = getParentsInfo();
				
				$('#cnf').show();
				
				 $("#ok").click(function () {
					 $.ajax('parentsUpdate',{
							type : 'post',
							contentType : 'application/json',
							data : JSON.stringify(objData)
						})
						.done(result =>{ 
							let message = '결과 : '+ result['result'];
							alert("수정완료");
					        location.href = "../parents/parentsInfo?parentsNo=" + parentsNo;
						})
						.fail(reject => console.log(reject)); 
				 });
		}
		function getParentsInfo(){
				let formData = $('form').serializeArray();
		
				let formObj = {};
				$.each(formData, function(idx, obj){
					formObj[obj.name] = obj.value;
				});
		
				return formObj;
		}
	</script>
</body>
</html>