<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	.AllDropbox{
		margin-left: 20px; 
	}
 	.dropbox{ 
 		margin-left: 35px; 
 	} 
/* 	#dropMail{ */
/* 		float: right; */
/* 		margin-right: 9px; */
/* 	} */
	.droptop{
		margin-left: 25px;
	}
	h1{
		text-align: center;
		margin: 230px 0 230px 0;
		color: #e0e0e0;
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
					<div class="card-body" style="min-height:85vh">
						<div class="card mb-3">
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12">
										<h4 class="mb-2">우리반 톡 -> <strong id="line">내게 쓴 톡 보기</strong></h4>
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
							<div role="toolbar" class="toolbar">
								<c:if test="${!empty mailToMeList }">
									<div class="btn-group">
										<div class="email-checkbox AllDropbox">
											<input type="checkbox" id="chk"
												name="dropCheckAll" value="selectAll" onclick="selectAllMail(this)"> 
											<label class="toggle" for="chk"></label>
										</div>
										
										<div class="droptop">
											<button aria-expanded="false" data-toggle="dropdown"
												class="btn btn-dark dropdown-toggle" type="button">
												더 보기 <span class="caret m-l-5"></span>
											</button>
											<div class="dropdown-menu">
												<span class="dropdown-header">옵션's</span> 
												<a href="javascript: void(0);" class="dropMail dropdown-item">선택 삭제</a>
												<a href="javascript: void(0);" class="readedMail dropdown-item">선택 보기 처리</a>
											</div>
										</div>
									</div>
								</c:if>
							</div>
							
							<c:if test="${empty mailToMeList }">
								<h1>내게 쓴 톡이 없습니다</h1>
							</c:if>
							
							<c:forEach items="${mailToMeList }" var="tm" varStatus="sat">
						
							<input type="hidden" id="mailReNo" 		name="mailReNo" 	value="${tm.mailReNo }">
							<input type="hidden" id="readCheck" 	name="readCheck" 	value="${tm.readCheck }">
							<input type="hidden" id="classId" 		name="classId" 		value="${ourClassId }">
							<input type="hidden" id="mailReceiver" 	name="mailReceiver" value="${tm.mailReceiver }">
							<input type="hidden" id="senderId" 		name="senderId" 	value="${p.memberId }">
							
							<div class="email-list m-t-15" data-receive_mail_no="${tm.mailReNo }">
								<div class="message">
									<a href="../mail/mailReceiveInfo?mailReNo=${tm.mailReNo }&readCheck=${tm.readCheck}">
										<div class="col-mail col-mail-1">
											<!-- 체크박스 -->
											<div class="email-checkbox">
												<input type="checkbox" id="chk${sat.count }"
													name="dropCheck" value="${tm.mailReNo }" onclick="failSelectAllMail()"> 
												<label class="toggle" for="chk${sat.count }"></label>
											</div>
											<c:if test="${tm.readCheck eq 'F202'}">
												<span class="star-toggle ti-star"></span>											
											</c:if>
										</div>
										<div class="col-mail col-mail-2">
											<c:choose>
												<c:when test="${tm.readCheck eq 'F201'}">
													<!-- 메일 제목 -->
													<div class="subject">
														<strong> &#91;${tm.mailTypeName }&#93; ${tm.receiveTitle}</strong>
													</div>
													<!-- 시간 MM:dd HH:mm -->							
													<div class="date">
														<strong>
															<fmt:formatDate value="${tm.receiveDate }" pattern="MM.dd HH:mm" />
														</strong>
													</div>
												</c:when>
											
												<c:otherwise>
													<!-- 메일 제목 -->
													<div class="subject">
														 &#91;${tm.mailTypeName }&#93; ${tm.receiveTitle}
													</div>
													<!-- 시간 MM:dd HH:mm -->							
													<div class="date">
														<fmt:formatDate value="${tm.receiveDate }" pattern="MM.dd HH:mm" />
													</div>
												</c:otherwise>
											</c:choose>
											

										</div>
									</a>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="alert alert-info layer layera" id="cnf1" role="alert">
        <div class="iq-alert-text cnf1 align-self-center">
            선택한 받은 톡을 삭제합니다.	
        </div>
        <div>
            <button type="button" id="oka" class="btn btn-info float-right">확인</button>
            <button type="button" class="btn btn-outline-info float-right close1">취소</button>
        </div>
    </div>
    <div class="alert alert-info layer layerb" id="cnf2" role="alert">
        <div class="iq-alert-text cnf2 align-self-center">
            선택한 받은 톡 모두 보기 처리합니다.	
        </div>
        <div>
            <button type="button" id="okb" class="btn btn-info float-right">확인</button>
            <button type="button" class="btn btn-outline-info float-right close1">취소</button>
        </div>
    </div>
	<div class="alert text-white bg-info layer layer1" id="dones" role="alert">
        <div class="iq-alert-text dones"></div>
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
		
		// th 체크박스 전체선택
		function selectAllMail(selectAll){
			const checkboxes = document.getElementsByName('dropCheck')
			
			checkboxes.forEach((checkbox) => {
				checkbox.checked = selectAll.checked;
			})
		}
		
		// 전체선택 중에 예외 발생 시 전체선택 취소
		function failSelectAllMail(){

			// 체크를 이벤트자체로 인식
			const andchecked = event.target.checked;
			// 전체선택 th 박스
			const allchecked = document.querySelector('input[name="dropCheckAll"]');
			
			// 체크 수가 같은때 true/false
			if(andchecked == false){
				allchecked.checked = false;
			}
		}
		
		$('.close1').on('click', function() {
	        $('.layer').hide();
	    }) 
		
		// 체크박스 선택 삭제
		$('.dropMail').on('click', function() {

		    const selectedCheckboxes = document.querySelectorAll('input[name="dropCheck"]:checked');

		    if (selectedCheckboxes.length == 0) {
		    	$('.dones').text('선택한 톡이 없으면 삭제가 불가합니다.');
				$('#dones').show();
				setTimeout(function(){
					$('.layer1').hide();
				}, 1600)
		        //alert("선택한 톡이 없으면 삭제가 불가합니다.");
		        return;
		    }
			$('#cnf1').show();	
		    $("#oka").click(function () {
		    	selectedCheckboxes.forEach((checkbox) => {
			        const mailReNo = checkbox.value;
	
			        $.ajax('mailReceiveDelete',{
			            type: 'post',
			            data: {mailReNo}
			        })
			        .done(result =>{
						if (result >= 0) {
		                    checkbox.closest(".message").remove();
		                    // foreach를 가지는 index 체크가 -1이면 끝으로 인식하고 alert가 하나만 뜸
	                    	$('.layera').hide();
	                    	$('.dones').text('선택하신 우리반 톡/내게 쓴 톡이 삭제되었습니다.');
							$('#dones').show();
							setTimeout(function(){
								$('.layer1').hide();
							}, 1600)
		                    if (index == selectedCheckboxes.length - 1) {
		                        //alert("선택하신 우리반 톡이 삭제되었습니다.");
		                    }
						} 
					})
			        .fail(reject => console.log(reject));
			    });
		    }); 
		});
		// 체크박스 선택 보기처리
		$('.readedMail').on('click', function() {

		    const selectedCheckboxes = document.querySelectorAll('input[name="dropCheck"]:checked');

		    if (selectedCheckboxes.length == 0) {
		    	$('.dones').text('선택한 톡이 없으면 보기 처리가 불가합니다.');
				$('#dones').show();
				setTimeout(function(){
					$('.layer1').hide();
				}, 1600)
// 		        alert("선택한 톡이 없으면 보기 처리가 불가합니다.");
		        return;
		    }
	    	$('#cnf2').show();	
		    $("#okb").click(function () {
			    selectedCheckboxes.forEach((checkbox) => {
			        const mailReNo = checkbox.value;
			        
			        $.ajax('mailReceiveReaded',{
			            type: 'post',
			            data: {mailReNo}
			        })
			        .done(result =>{
						if (result >= 0) {
							location.reload();
		                    // foreach를 가지는 index 체크가 -1이면 끝으로 인식하고 alert가 하나만 뜸
	                    	$('.layerb').hide();
	                    	$('.dones').text('선택하신 우리반 톡/받은 톡 모두 보기 처리 되었습니다.');
							$('#dones').show();
							setTimeout(function(){
								$('.layer1').hide();
							}, 1600)
		                    if (index == selectedCheckboxes.length - 1) {
		                    }
						} 
					})
			        .fail(reject => console.log(reject));
			    });
		    });
		});
		
	</script>
</body>
</html>
