<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#line{
		text-decoration: underline;
	}
	.receiver{
		float: left;
		padding: 0;
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
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="card mb-3">
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12">
										<h4 class="mb-2">우리반 톡 -> <strong id="line">내게 쓰기</strong></h4>
									</div>
								</div>
							</div>
						</div>
						<div class="email-left-box">
							<a href="../mail/mailInsert" class="btn btn-primary btn-block">
								<i class="mdi mdi-file-document-box font-18 align-middle mr-2"></i>
								톡 보내기</a>
							<a href="../mail/mailToMeInsert" class="btn btn-primary btn-block">
								<i class="fa fa-star-o font-18 align-middle mr-2"></i>
								내게 톡 쓰기</a>
							<div class="mail-list mt-4">
								<a href="../mail/mailReceiveList?mailReceiver=${p.memberId }" class="list-group-item border-0 p-r-0">
									<i class="fa fa-inbox font-18 align-middle mr-2"></i>받은 톡 보기
								</a> 
								<a href="../mail/mailSendList?senderId=${p.memberId }" class="list-group-item border-0 p-r-0">
									<i class="fa fa-paper-plane font-18 align-middle mr-2"></i>보낸 톡 보기
								</a> 
								<a href="../mail/mailToMeList?mailReceiver=${p.memberId }" class="list-group-item border-0 text-primary p-r-0">
									<i class="fa fa-star-o font-18 align-middle mr-2"></i><b>내게 쓴 톡 보기</b>
								</a> 
							</div>
						</div>
						<div class="email-right-box">
							<div class="toolbar" role="toolbar">
								<div class="btn-group m-b-20">
									<button type="button" class="btn btn-light">
										<i class="fa fa-archive"></i>
									</button>
									<button type="button" class="btn btn-light">
										<i class="fa fa-exclamation-circle"></i>
									</button>
									<button type="button" class="btn btn-light">
										<i class="fa fa-trash"></i>
									</button>
								</div>
								<div class="btn-group m-b-20">
									<button type="button" class="btn btn-light dropdown-toggle"
										data-toggle="dropdown">
										<i class="fa fa-folder"></i> <b class="caret m-l-5"></b>
									</button>
									<div class="dropdown-menu">
										<span class="dropdown-header">Move to</span> 
										<a class="dropdown-item" href="javascript: void(0);">Social</a>
										<a class="dropdown-item" href="javascript: void(0);">Promotions</a>
										<a class="dropdown-item" href="javascript: void(0);">Updates</a>
										<a class="dropdown-item" href="javascript: void(0);">Forums</a>
									</div>
								</div>
								<div class="btn-group m-b-20">
									<button type="button" class="btn btn-light dropdown-toggle"
										data-toggle="dropdown">
										<i class="fa fa-tag"></i> <b class="caret m-l-5"></b>
									</button>
									<div class="dropdown-menu">
										<span class="dropdown-header">Label as:</span> <a
											class="dropdown-item" href="javascript: void(0);">Updates</a>
										<a class="dropdown-item" href="javascript: void(0);">Social</a>
										<a class="dropdown-item" href="javascript: void(0);">Promotions</a>
										<a class="dropdown-item" href="javascript: void(0);">Forums</a>
									</div>
								</div>
								<div class="btn-group m-b-20">
									<button type="button" class="btn btn-light dropdown-toggle"
										data-toggle="dropdown">
										More <span class="caret m-l-5"></span>
									</button>
									<div class="dropdown-menu">
										<span class="dropdown-header">More Option :</span> <a
											class="dropdown-item" href="javascript: void(0);">Mark as
											Unread</a> <a class="dropdown-item" href="javascript: void(0);">Add
											to Tasks</a> <a class="dropdown-item" href="javascript: void(0);">Add
											Star</a> <a class="dropdown-item" href="javascript: void(0);">Mute</a>
									</div>
								</div>
							</div>
							<div class="compose-content mt-5">
								<form name ="composeMailForm" action="mailInsert?${_csrf.parameterName}=${_csrf.token}" accept-charset="UTF-8" method="post">
									
									<!-- CLASS ID -->
									<input type="hidden" id="classId" name="classId" value="${ourClassId }">
									<!-- SENDER ID -->
									<input type="hidden" id="senderId" name="senderId" value="${p.memberId }">
									
									<!-- 클래스 원 동일 / 본인 고정 input.value -->
									<div class="classer receiver form-group col-xl-12">
										<input type="text" class="classerId form-control bg-transparent"
											name="mailReceiver" placeholder=" Comepose Only To Me" value="${p.memberId }" readonly="readonly">
									</div>
	
									
									<!-- 유형 -->
									<div class="form-group">
										<select name="mailType" class="form-control bg-transparent selectpicker" data-style="py-0">
											<option value="F305" selected>나에게 보내기</option>
										</select>
									</div>
									<!-- 메일 제목 -->
									<div class="form-group">
										<input type="text" class="form-control bg-transparent"
											name="mailTitle" placeholder=" 톡 제목"  maxlength="45">
									</div>
									<!-- 메일 내용 -->
									<div class="form-group">
										<textarea class="textarea_editor form-control bg-light"
											name="mailContents" rows="15" placeholder=" 내게 보낼 톡 내용을 작성해주세요 ..."  maxlength="1600"></textarea>
									</div>
									<hr>
									
									<h5 class="mb-3">확인해주세요.</h5>
										<p class="mb-0">이 톡은 단지 본인에게만 발송, 확인 가능한 기능이므로, 타인은 확인이 불가하니 안심하고 사용해 주세요.<br>
											 (클래스원에게 톡을 희망 할 경우에는 &#91;톡 보내기&#93;를 이용해주세요.) </p>
									<div class="checkbox">
										<label><input class="mr-2 promise" type="checkbox" name="promiseChecked">
											네, 확인했습니다.
										</label>
									</div>
									<div class="text-left m-t-15">
										<button type="submit" class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10">
											<i class="fa fa-paper-plane m-r-5"></i> 내게 톡 보내기
										</button>
										<button type="button" id="backMailList" class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20" >
											<i class="ti-close m-r-5 f-s-12"></i> 취소
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="alert alert-info layer" id="cnf" role="alert">
        <div class="iq-alert-text cnf align-self-center">
            내게 톡 보내기를 중단하시겠습니까?	
        </div>
        <div>
            <button type="button" id="ok" class="btn btn-info float-right">확인</button>
            <button type="button" class="btn btn-outline-info float-right close1">취소</button>
        </div>
    </div>
	<div class="alert text-white bg-info layer layer1" id="done" role="alert">
        <div class="iq-alert-text done"></div>
        <button type="button" class="close close1">
            <i class="ri-close-line"></i>
        </button>
    </div>
    <div class="alert text-white bg-info layer layer2" id="tem" role="alert">
        <div class="iq-alert-text tem"></div>
        <button type="button" class="close close1">
            <i class="ri-close-line"></i>
        </button>
    </div>
	<script type="text/javascript">
		
		// 받는사람 select text 인풋란에 @합쳐 띄우기 multiple 이용해  ctrl , shift 로 selected 다중적용
		function classerMail(e){
			const mailId = [];
			  
			// options(multiple)에서 selected 된 element 찾기
			for(let i=0; i < e.options.length; i++) {
				const option = e.options[i];
				if(option.selected) {
					mailId.push(option.value);
				}
			}
				
			// 선택된 데이터 input에 @text로 출력
			//const mailIdCheck =  `@` + mailId;
			if(mailId != 'none'){
				document.getElementsByClassName('classerId')[0].value = mailId;
			}

			console.log(mailId);

		}
		
		// to.교사 고정/ select text 인풋란 띄우기
		function teacherMail(e){
			const mailId = e.value;
			  
			// 선택된 데이터 input에 @text로 출력
			document.getElementsByClassName('teacherId')[0].value = mailId;				

			console.log(mailId);

		}
		
		$('.close1').on('click', function() {
		    $('.layer').hide();
		}) 
		
		// 메일 보내기 (다중전송 적용)
		$('[name="composeMailForm"]').on('submit', function(e){
			
			// 값 입력 경고 메세지
			let title = 	$('[name=mailTitle]');
			let contents = 	$('[name=mailContents]');
			
			if(	title.val()	 	== '' ||
				contents.val() 	== '' ){
				$('.done').text('보내실 톡의 작성란을 모두 기입해주십시오.');
				$('#done').show();
				setTimeout(function(){
					$('.layer1').hide();
				}, 1500)
// 				alert("보내실 톡의 작성란을 모두 기입해주십시오.");
				return false;
			}else if($('.promise').is(":checked") ==  false){
				$('.done').text('[확인해주세요]를 확인하시고 확인버튼에 동의해 주세요.');
				$('#done').show();
				setTimeout(function(){
					$('.layer1').hide();
				}, 1500)
// 				alert("[확인해주세요]를 확인하시고 확인버튼에 동의해 주세요.");
				return false;
			}
			return true;
		})
		
	
		// 취소
		$('#backMailList').on('click', function(){
			
			$('#cnf').show();	
            $("#ok").click(function () {
            	location.href='../mail/mailReceiveList?mailReceiver=${p.memberId }';
            });
            
// 			if(confirm("톡 보내기를 중단하시겠습니까?")){
// 				alert("톡 리스트로 돌아갑니다.");
// 				location.href='../mail/mailReceiveList?mailReceiver=${p.memberId }';
// 			}
		})
			
		
	</script>
	
</body>
</html>
