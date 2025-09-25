<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
								<div class="card-header d-flex justify-content-between">
									<div class="iq-header-title">
										<h4 class="card-title">Personal Information</h4>
									</div>
								</div>
								<div class="card-body">
									<form>
										<div class="form-group row align-items-center">
											<div class="col-md-12">
												<div class="profile-img-edit">
													<div class="crm-profile-img-edit">
														<img class="crm-profile-pic rounded-circle avatar-100"
															src="${memberInfo.memberProfile}" alt="profile-pic">

													</div>
												</div>
											</div>
										</div>
										<div class=" row align-items-center">
											<div class="form-group col-sm-12">
												<label for="memberId">아이디</label> <input type="text"
													class="form-control" id="memberId" name="memberId"
													value="${memberInfo.memberId}" readonly="readonly">
											</div>
											
																						
											<div class="form-group col-sm-12">
												<label for="memberName">이름</label> <input type="text"
													class="form-control" id="memberName" name="memberName"
													value="${memberInfo.memberName}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="phone">연락처</label> <input type="text"
													class="form-control" id="phone" name="phone" value="${memberInfo.phone}">
											</div>
											<div class="form-group col-sm-12">
												<label for="email">메일</label> <input type="text"
													class="form-control" id="email" name="email" value="${memberInfo.email}">
											</div>
											<div class="form-group col-sm-12">
												<label for="birth">생년월일</label> <input type="text"
													class="form-control" id="birth" name="birth"
													value="<fmt:formatDate value="${memberInfo.birth}"
							pattern="yyyy-MM-dd" />"
													readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="auth">권한</label> <input type="text"
													class="form-control" id="auth" name="auth"
													value="${memberInfo.authority}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="createDate">가입일</label> <input type="text"
													class="form-control" id="createDate" name=reportCount
													value="<fmt:formatDate value="${memberInfo.createDate}"
							pattern="yyyy-MM-dd" />"
													readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="reportCount">신고횟수</label> <input type="text"
													class="form-control" id=reportCount name=reportCount
													value="${memberInfo.reportCount}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label>상태</label> <select class="form-control"
													id="memberState" name="memberState">
													<option value="A501">정상</option>
													<option value="A502">댓글제한</option>
													<option value="A503">메일제한</option>
													<option value="A504">댓글,메일제한</option>
												</select>
											</div>
										</div>
										<button type="reset" class="btn iq-bg-danger"
											onclick="location.href='memberList'">취소</button>
										<button type="button" class="btn btn-primary mr-2">수정</button>
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
	$('form > :button').on('click', memberUpdate);
		function memberUpdate(event){
				
				
				// 보낼 데이터
				let objData = getMemberInfo();
				for(let field in objData){
					// for in(객체 내부 순환) 사용 시 []대괄호 사용 
					// 1) 변수에 필드명을 담아서 사용하는 경우
					// 2) 필드병을 문자열로 접근해야하는 경우 : 특수문자사용(-),영문을 제외한 한글
					console.log(objData[field]); 
					console.log(objData.memberId, objData['memberId']);
				}	
				// ajax
				$.ajax('memberUpdate',{
					type : 'post',
					contentType : 'application/json',
					data : JSON.stringify(objData)
				})
				.done(result =>{ // success, done은 연속적으로 사용가능(done종료 후 다른 done), javascript의 then과 동일
					let message = '결과 : '+ result['result'];
				})
				.fail(reject => console.log(reject)); // error
							
		}
		function getMemberInfo(){
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