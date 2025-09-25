<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mar100 {
	width: 30%;
	margin: auto;
}

.id_ok {
	color: #008000;
	display: none;
}

.id_already {
	color: #6A82FB;
	display: none;
}

.backg {
	background-color: #5fcf80;
	width: 100%;
	padding: 5px;
}

.img-hei {
	height: 90px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row ">
			<div class="col-lg-12">
				<div class="iq-edit-list-data">
					<div class="tab-content">
						<div class="tab-pane fade active show" id="personal-information"
							role="tabpanel">
							<div class="mar100 blur-shadow shadow-showcase">
								<div class="backg">
									<div class="mt-2 mb-2 text-center">
										<a href="/" class="logo me-auto"><img
											src="${pageContext.request.contextPath }/homeview/img/logoWH.png"
											alt="" class="img-fluid img-hei"></a>
									</div>
								</div>
								<div class="mt-4 ml-4 mr-4">

									<form name="signUpFrm" action="signup?${_csrf.parameterName}=${_csrf.token}"
										method="post" enctype="multipart/form-data"
										accept-charset="utf-8">
										<div class="">
											<div class=" row align-items-center">
												<div class="form-group col-sm-12">
													<h4>회원가입</h4>
												</div>
												<div class="form-group col-sm-12">
													<label>가입유형</label><select class="form-control"
														id="authority" name="authority">
														<option value="">선택</option>
														<option value="A103">교사</option>
														<option value="A104">학생</option>
														<option value="A105">학부모</option>
													</select>
												</div>
												<div class="form-group col-sm-12">
													<label for="memberId">아이디</label><input type="text"
														class="form-control" id="memberId" name="memberId"
														placeholder="4~12자의 영문 대소문자와 숫자로만 입력" size="12"
														maxlength="12" required="required">

													<!-- id ajax 중복체크 -->
													<span class="idText"></span>
												</div>

												<div class="form-group col-sm-12">
													<label for="memberPw">비밀번호</label> <input type="password"
														class="form-control" id="memberPw" name="memberPw"
														placeholder="8~20자의 영문 대소문자와 숫자 특수문자(#?!@$%^&*-)만 입력"
														size="20" maxlength="20" required="required"> <span
														class="pwText"></span>
												</div>
												<div class="form-group col-sm-12">
													<label for="memberPwChk">비밀번호 확인</label> <input
														type="password" class="form-control" id="memberPwChk"
														name="memberPwChk"
														placeholder="8~20자의 영문 대소문자와 숫자 특수문자(#?!@$%^&*-)만 입력"
														size="20" maxlength="20" required="required"> <span
														class="chkText"></span>
												</div>


												<div class="form-group col-sm-12">
													<label for="memberName">이름</label> <input type="text"
														class="form-control" id="memberName" name="memberName"
														required="required" maxlength="15">
												</div>
												<div class="form-group col-sm-12">
													<label for="birth">생년월일</label> <input type="date"
														class="form-control" id="birth" name="birth"
														required="required">

												</div>
												<div class="form-group col-sm-12">
													<label for="phone">연락처</label>
													<div class="input-group">
														<input type="text" class="form-control" id="phone"
															name="phone" required="required">
													</div>
												</div>
												<div class="form-group col-sm-12">
													<label for="email">메일</label> <input type="text"
														class="form-control" id="email" name="email"
														required="required">
												</div>

												<div class="form-group col-sm-12">
													<label for="customFile">프로필 사진</label>
													<div class="custom-file">

														<input type="file" class="custom-file-input" id="file"
															name="file"> <label class="custom-file-label"
															for="file">파일선택</label>
													</div>
												</div>


												<div class="form-group col-sm-12 mt-3 pb-3">
													<button type="submit"
														class="btn btn-primary mr-2 col-sm-12 signBtn">가입</button>
												</div>
											</div>
										</div>
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
		let idOk = 0;
		let pwOk = 0;
		
		
		<!-- 아이디 유효성 검사 시작 -->
		$("#memberId").on("click", function(){
			$(".idText").text(" ");
		})
		
		$("#memberId").on("keyup", function(){
			idOk = 0;
			var memberId = $('#memberId').val();
			if (memberId.length > 0) {
				$(".idText").text("");
				
				if(onlyNumEng(memberId) && idLength(memberId)) {
					checkId(memberId);
				} else {
					$(".idText").css("color", "rgb(255, 120, 203)");
					$(".idText").text("4~12자 이내의 영문 또는 숫자만 사용가능합니다.");
				}
				
		    } else {
				$(".idText").text("");
		    }
		});
		function checkId(memberId) {
			$.ajax({
				url : 'signup/idCheck', //Controller에서 요청 받을 주소
				type : 'post', //POST 방식으로 전달
				data : {
					memberId : memberId
				},

				success : function(cnt) { 
					if (cnt == 0) { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
						$(".idText").css("color", "#34aadc");
						$(".idText").text("사용 가능한 아이디입니다.");
						idOk = 1;
					} else { // cnt가 1일 경우 -> 이미 존재하는 아이디
						$(".idText").css("color", "rgb(255, 120, 203)");
						$(".idText").text("중복된 아이디 입니다. 아이디를 다시입력하세요.");
						$('#memberId').focus();
					}
				},
				error : function() {
				}
			})
		}
		
		function idLength(value) {
			return value.length >= 4 && value.length <= 12
		}
		function onlyNumEng(str) {
			return /^[A-Za-z0-9][A-Za-z0-9]*$/.test(str);
		}
		
		<!-- 아이디 유효성 검사 끝 -->

		let chkPw;
		let pw;
		$("#memberPw").on("keyup", checkPw);
		pwOk = 0;
		function checkPw() {
			pw = $('#memberPw').val()
			
			var num = pw.search(/[0-9]/g);
 			var eng = pw.search(/[a-z]/ig);
 			var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			if(pw.length < 8 || pw.length > 20){
				$(".pwText").css("color", "rgb(255, 120, 203)");
				$(".pwText").text("8자리 ~ 20자리 이내로 입력해주세요.");
			 	return false;
			 }else if(pw.search(/\s/) != -1){
				$(".pwText").css("color", "rgb(255, 120, 203)");
				$(".pwText").text("비밀번호는 공백 없이 입력해주세요.");
			 	return false;
			 }else if(num < 0 || eng < 0 || spe < 0 ){
				 $(".pwText").css("color", "rgb(255, 120, 203)");
				 $(".pwText").text("영문, 숫자, 특수문자를 혼합하여 입력해주세요.");
			  return false;
			 }else {
				$(".pwText").css("color", "#34aadc");
				$(".pwText").text("사용 가능한 비밀번호입니다.");
			    return true;
			 }
		};
		$("#memberPwChk").on("keyup", checkPwChk);
		pwOk = 0;
		function checkPwChk() {
			pw = $('#memberPw').val();
			chkPw = $('#memberPwChk').val();
			if (pw == chkPw) {
				$(".chkText").css("color", "#34aadc");
				$(".chkText").text("비밀번호가 일치합니다.");
				pwOk = 1;
			} else {
				$(".chkText").css("color", "rgb(255, 120, 203)");
				$(".chkText").text("비밀번호를 확인해주세요.");
			}
			;
		};
		$('[name="signUpFrm"]').on('submit', function(e){
			e.preventDefault();
			if(!$('#authority').val() || idOk > 1 && pwOk > 1 || !$('#memberName').val() || !$('#birth').val() || !$('#phone').val() || !$('#email').val()){
				return false;
			}else{
				$('[name="signUpFrm"]').submit();
			}
		})
		
		// 4~12자 이내의 영문 또는 숫자만 사용
		let regId = /^[a-z0-9]{4,12}$/;
	    // 8~20자의 영문 대소문자와 숫자 특수문자(#?!@$%^&*-)
		let regPw = /[a-z0-9`~!@#$%^&*|₩₩₩'₩";:₩/?]{8,20}/gi;
	</script>
</body>
</html>
