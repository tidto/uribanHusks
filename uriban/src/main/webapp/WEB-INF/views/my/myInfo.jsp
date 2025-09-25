<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.hideFrm {
	display: none;
}

.he100px {
	height: 100px;
}

.newcalss-bg {
	background-color: #ededed;
	border-bottom-left-radius: 16px;
	border-bottom-right-radius: 16px;
}

.layer {
	display: none;
	position: fixed;
	width: 20%;
	left: 50%;
	margin-left: -10%; /* half of width */
	top: 50%;
	margin-top: -150px; /* half of height */
	overflow: auto;
	z-index: 10000;
}
</style>
</head>
<body>
	<sec:authentication property="principal" var="p" />

	<div class="">
		<form action="" id=updateFrm method="post"
			enctype="multipart/form-data">
			<div class="col-12">
				<div class="card">
					<div class="card-header">회원 정보 변경</div>

					<!-- 프로필 사진 변경 시작 -->
					<div class="row">
						<div class="col-4">
							<h6 class="p-3">프로필 사진</h6>
						</div>

						<div class="col-4">
							<div class="card-body pl-0">
								<div class="crm-profile-img-edit position-relative">
									<img class="crm-profile-pic rounded avatar-100"
										src="${pageContext.request.contextPath}/profile/${memberInfo.memberProfile}"
										alt="profile-pic">
									<div class="crm-p-image bg-primary">
										<i class="las la-pen upload-button"></i> <input
											class="file-upload" id="file" type="file" accept="image/*"
											name="file" onchange="setThumbnail(event);">

									</div>
								</div>
							</div>
						</div>

						<div class="col-4 pr-4" style="text-align: right;">
							<button type="button" class="btn btn-primary subm">확인</button>
						</div>
					</div>
					<!-- 프로필 사진 변경 끝 -->

					<!-- 아이디 시작 -->
					<div class="row">
						<div class="col-4">
							<h6 class="p-3">아이디</h6>
						</div>
						<div class="col-4">
							<span>${memberInfo.memberId}</span>
						</div>
						<div class="col-4" style="text-align: right;"></div>
					</div>
					<!-- 아이디 끝 -->

					<!-- 이름 시작 -->
					<div class="row">
						<div class="col-4">
							<h6 class="p-3">이름</h6>
						</div>
						<div class="col-4">
							<span>${memberInfo.memberName}</span>
							<c:choose>
								<c:when
									test="${memberInfo.authKor eq '교사' or memberInfo.authKor eq'교사(미인증)'}">
									<span class="badge bg-primary">${memberInfo.authKor}</span>
								</c:when>
								<c:when test="${memberInfo.authKor eq '학생'}">
									<span class="badge bg-info">${memberInfo.authKor}</span>
								</c:when>
								<c:when test="${memberInfo.authKor eq '학부모' }">
									<span class="badge bg-secondary">${memberInfo.authKor}</span>
								</c:when>
								<c:otherwise>
									<span class="badge bg-dark">${memberInfo.authKor}</span>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-4" style="text-align: right;"></div>
					</div>
					<!-- 이름 끝 -->

					<!-- 비밀번호 변경 시작 -->
					<div class="row" id="pwDiv">
						<div class="col-4">
							<h6 class="p-3">비밀번호 변경</h6>
						</div>
						<div class="col-4">
							<span>********</span>
						</div>
						<div class="col-4 pr-4" style="text-align: right;">
							<button type="button" class="btn btn-primary pwFrmBtn"
								id="pwFrmBtn">변경</button>
						</div>
					</div>
					<!-- 비밀번호 변경  끝 -->

					<!-- 비밀번호 변경 폼 시작 -->
					<div id="pwFrm" class="hideFrm">
						<input type="hidden" value="${memberInfo.memberId}"
							name="memberId">
						<div class="row">
							<div class="col-4">
								<h6 class="p-3">비밀번호 변경</h6>
							</div>
							<div class="col-4">
								<input type="password" class="form-control" id="memberPw"
									name="memberPw" placeholder="현재 비밀번호">
							</div>
							<div class="col-4 pr-4" style="text-align: right;">
								<button type="button" class="btn btn-outline-primary pwFrmBtn"
									id="pwCancle">변경 취소</button>
								<button type="button" class="btn btn-primary subm">확인</button>
							</div>
						</div>
						<div class="row pt-1 pb-1">
							<div class="col-4"></div>
							<div class="col-4">
								<input type="password" class="form-control" id="newPw"
									name="newPw" placeholder="신규 비밀번호"><span class="pwText"></span>
							</div>
							<div class="col-4 pr-4" style="text-align: right;"></div>
						</div>
						<div class="row pt-1 pb-1">
							<div class="col-4"></div>
							<div class="col-4">
								<input type="password" class="form-control " id="memberPwChk"
									name="memberPwChk" placeholder="비밀번호 확인"> <span
									class="chkText"></span>
							</div>
							<div class="col-4 pr-4" style="text-align: right;"></div>
						</div>

						<div class="row pt-1 pb-1">
							<div class="col-4"></div>
							<div class="col-4"></div>
							<div class="col-4 pr-4" style="text-align: right;"></div>
						</div>
					</div>
					<!-- 비밀번호 변경 폼 끝 -->

					<!-- 이메일 변경 시작 -->
					<div class="row" id="emailDiv">
						<div class="col-4">
							<h6 class="p-3">이메일 변경</h6>
						</div>
						<div class="col-4">
							<span>${memberInfo.email}</span>
						</div>
						<div class="col-4 pr-4" style="text-align: right;">
							<button type="button" class="btn btn-primary emailFrmBtn">변경</button>
						</div>
					</div>
					<!-- 이메일 변경  끝 -->

					<!-- 이메일 변경 폼 시작 -->
					<div id="emailFrm" class="hideFrm">
						<div class="row">
							<div class="col-4">
								<h6 class="p-3">이메일 변경</h6>
							</div>
							<div class="col-4">
								<input type="email" class="form-control" id="email" name="email"
									placeholder="신규 이메일">
							</div>
							<div class="col-4 pr-4" style="text-align: right;">
								<button type="button"
									class="btn btn-outline-primary emailFrmBtn">변경 취소</button>
								<button type="button" class="btn btn-primary subm">확인</button>
							</div>
						</div>


						<div class="row pt-1 pb-1">
							<div class="col-4"></div>
							<div class="col-4"></div>
							<div class="col-4 pr-4" style="text-align: right;"></div>
						</div>
					</div>
					<!-- 이메일 변경 폼 끝 -->


					<!-- 전화번호 변경 시작 -->
					<div>
						<div class="row" id="phoneDiv">
							<div class="col-4">
								<h6 class="p-3">전화번호 변경</h6>
							</div>
							<div class="col-4">
								<span>${memberInfo.phone}</span>
							</div>
							<div class="col-4 pr-4" style="text-align: right;">
								<button type="button" class="btn btn-primary phoneFrmBtn">변경</button>
							</div>
						</div>


						<!-- 전화번호 변경  끝 -->

						<!-- 전화번호 변경 폼 시작 -->
						<div id="phoneFrm" class="hideFrm">
							<div class="row">
								<div class="col-4">
									<h6 class="p-3">전화번호 변경</h6>
								</div>
								<div class="col-4">
									<input type="phone" class="form-control" id="phone"
										name="phone" placeholder="신규 전화번호">
								</div>
								<div class="col-4 pr-4" style="text-align: right;">
									<button type="button"
										class="btn btn-outline-primary phoneFrmBtn">변경 취소</button>
									<button type="button" class="btn btn-primary subm">확인</button>
								</div>
							</div>


							<!-- <div class="row pt-1 pb-1">
								<div class="col-4"></div>
								<div class="col-4">
									<div class="input-group">
										<input type="text" class="form-control" id="code" name="code"
											placeholder="인증번호 입력">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">확인</button>
										</div>
									</div>
								</div>
								<div class="col-4 pr-4" style="text-align: right;"></div>
							</div> -->
						</div>

						<!-- 교원자격 시작 -->
						<c:if
							test="${memberInfo.authority eq 'A102' or memberInfo.authority eq 'A103'}">
							<div class="row" id="certDiv">
								<div class="col-4">
									<h6 class="p-3">교원자격</h6>
								</div>
								<div class="col-4">
									<c:choose>
										<c:when
											test="${memberInfo.authority eq 'A103' and memberInfo.certVO.certStat eq '반려'}">
											<span>반려사유: ${memberInfo.certVO.cmt}</span>
										</c:when>
										<c:when
											test="${memberInfo.authority eq 'A103' and memberInfo.certVO.certStat eq '대기'}">
											<span>승인 대기중</span>
										</c:when>
										<c:when test="${memberInfo.authority eq 'A102'}">
											<span>승인완료</span>
										</c:when>
										<c:otherwise>
											<span>교원자격 인증신청을 해주세요.</span>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-4 pr-4" style="text-align: right;">
									<c:if test="${memberInfo.authority eq 'A102'}">
										<button type="button" class="btn btn-primary certFrmBtn"
											disabled>인증완료</button>
									</c:if>
									<c:if
										test="${memberInfo.authority eq 'A103' and memberInfo.certVO.certStat ne '대기'}">
										<button type="button" class="btn btn-primary certFrmBtn">인증</button>
									</c:if>
									<c:if
										test="${memberInfo.authority eq 'A103' and memberInfo.certVO.certStat eq '대기'}">
										<button type="button" class="btn btn-primary certFrmBtn"
											disabled="disabled">인증</button>
									</c:if>
								</div>
							</div>
						</c:if>
						<!-- 교원자격  끝 -->

						<!-- 교원자격 인증 폼 시작 -->
						<c:if test="${memberInfo.authority eq 'A103'}">
							<div id="certFrm" class="hideFrm">
								<div class="row">
									<div class="col-4">
										<h6 class="p-3">교원자격</h6>
									</div>
									<div class="col-4">
										<div class="custom-file">
											<input type="file" class="custom-file-input" id="certFile"
												name="certFile"> <label class="custom-file-label"
												for="certFile">이미지 또는 PDF형식</label>
										</div>
									</div>
									<div class="col-4 pr-4" style="text-align: right;">
										<button type="button"
											class="btn btn-outline-primary certFrmBtn">인증 취소</button>
										<button type="button" class="btn btn-primary apply">확인</button>
									</div>
								</div>


								<div class="row pt-1 pb-1">
									<div class="col-4"></div>
									<div class="col-4"></div>
									<div class="col-4 pr-4" style="text-align: right;"></div>
								</div>
							</div>
						</c:if>
						<!-- 교원자격 인증 폼 끝 -->

						<div class="row no-gutters he100px newcalss-bg">
							<div class="col-12" style="text-align: center;">
								<a href="${pageContext.request.contextPath}/member/memberDelete"
									class="" style="color: #999;">회원 탈퇴</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- alert창 시작 -->
	<div class="alert text-white bg-info layer" id="done" role="alert">
		<div class="iq-alert-text">
			<span class="done"></span>
			<button type="button" class="close close1">
				<i class="ri-close-line"></i>
			</button>
		</div>
	</div>
	<div class="alert text-white bg-danger layer " id="err" role="alert">
		<div class="iq-alert-text">
			<span class="err"></span>
		<button type="button" class="close close1">
			<i class="ri-close-line"></i>
		</button>
		</div>
	</div>
	<!-- alert창 끝 -->
	<script type="text/javascript">
	
		/*  폼 on off 시작 */
		$('.pwFrmBtn').on('click', goPwFrm);
		$('.emailFrmBtn').on('click', goEmailFrm);
		$('.phoneFrmBtn').on('click', goPhoneFrm);
		$('.certFrmBtn').on('click', goCertFrm);

		function goPwFrm() {
			if ($('#pwDiv').css('display') == 'none') {
				$('#pwDiv').show();
				$('#pwFrm').hide();
			} else {
				$('#pwDiv').hide();
				$('#pwFrm').show();
			}
		}

		function goEmailFrm() {
			if ($('#emailDiv').css('display') == 'none') {
				$('#emailDiv').show();
				$('#emailFrm').hide();
			} else {
				$('#emailDiv').hide();
				$('#emailFrm').show();
			}
		}

		function goPhoneFrm() {
			if ($('#phoneDiv').css('display') == 'none') {
				$('#phoneDiv').show();
				$('#phoneFrm').hide();
			} else {
				$('#phoneDiv').hide();
				$('#phoneFrm').show();
			}
		}
		function goCertFrm() {
			if ($('#certDiv').css('display') == 'none') {
				$('#certDiv').show();
				$('#certFrm').hide();
			} else {
				$('#certDiv').hide();
				$('#certFrm').show();
			}
		}
		/*  폼 on off 끝 */
		
		<!-- 정보 변경 시작 -->
		
		$('.subm').on('click', memberUpdate);
		function memberUpdate(event){
				// 보낼 데이터
				var form = $('#updateFrm');
				var data = new FormData(form[0]);  
				//let objData = getMemberInfo();

				// ajax
				$.ajax('${pageContext.request.contextPath}/member/memberUpdate',{
					type : 'post',
					contentType : 'multipart/form-data',
					data : data,
					dataType:'json',
					processData:false,
				    contentType:false,
				    cache:false,
				})
				.done(result =>{ 
					let message = '결과 : '+ result['result'];
					// 변경 성공시 헤더 프로필 사진 변경
					var headImg = $('img.rounded-circle');
					headImg.attr('src', $('.crm-profile-pic').attr('src'));
					
					// 폼 초기화
					$.each([...data.keys()], function(index, key) {
					    if(key=='email'&& (data.get(key) !==''&&data.get(key) !== null)){
							goEmailFrm();							
							$('#emailDiv').find('span').text(data.get(key));
						}else if(key=='phone'&&(data.get(key) !==''&& data.get(key) !== null)){
							goPhoneFrm()
							$('#phoneDiv').find('span').text(data.get(key));
						}else if(key=='memberPw'&&(data.get(key) !==''&& data.get(key) !== null)){
							goPwFrm();
						}
					});
						$('#memberPw').val('');
						$('#phone').val('');
						$('#email').val('');
						$('#file').val('');
						$('.done').text('정상적으로 변경되었습니다.');
						$('#done').show();
				})
				.fail(reject => {
					console.log(reject); // error
					$('.crm-profile-pic').attr('src', currentImg);
					$('.err').text('정상적으로 변경되지 않았습니다.');
					$('#err').show();	
				})
							
		}
		<!-- 정보 변경 끝 -->
		
		<!-- 교원 자격 인증 시작 -->
		$('.apply').on('click', certUpdate);
		function certUpdate(event){
			// 보낼 데이터
			var form = $('#updateFrm');
			var data = new FormData(form[0]); 
			// ajax
			$.ajax('${pageContext.request.contextPath}/member/memberUpdate',{
				type : 'post',
				contentType : 'multipart/form-data',
				data : data,
				dataType:'json',
				processData:false,
			    contentType:false,
			    cache:false,
			})
			.done(result =>{ 
				// 폼 초기화
				$.each([...data.keys()], function(index, key) {
					if(key=='certFile'&&(data.get(key) !==''&& data.get(key) !== null)){
						goCertFrm();
						$(".certFrmBtn:contains('인증'):not(:contains('취소'))").attr('disabled', 'disabled');
						$('#certDiv').find('span').text('승인 대기중');
					}
				});
					$('#certFile').val('');
					$('.done').text('정상적으로 신청되었습니다.');
					$('#done').show();
			})
			.fail(reject => {
				console.log(reject); // error
				$('.err').text('정상적으로 신청되지 않았습니다.');
				$('#err').show();	
			})
		}
		
				
		<!-- 업로드 이미지 미리보기 시작 -->
		var currentImg = $('.crm-profile-pic').attr('src');
		
		function setThumbnail(event) {
			var reader = new FileReader();

			reader.onload = function(event) {
				var img = $('.crm-profile-pic');
				var newImg = event.target.result;
				img.attr('src', newImg);
			};

			reader.readAsDataURL(event.target.files[0]);
		} 
		<!-- 업로드 이미지 미리보기 끝 -->
		
		<!-- alert 끄기 시작 -->
		$('.close').on('click', function() {
			$('.layer').hide();
		});
		<!-- alert 끄기 시작 -->
		
	</script>
</body>
</html>
