<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과제등록</title>
<style>
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
	<div class="alert alert-info layer" id="done" role="alert">
		<div class="iq-alert-text cnf align-self-center">과제가 등록됐습니다</div>
		<div>
			<button type="button" id="ok1" class="btn btn-info float-right">확인</button>
		</div>
	</div>
	
<!-- 	<div class="alert text-white bg-info layer" id="done" role="alert"> -->
<!-- 		<div class="iq-alert-text done"></div> -->
<!-- 		<button type="button" id="ok1" class="btn btn-info float-left">확인</button> -->
<!-- 	</div> -->

	<div class="alert text-white bg-danger layer " id="err" role="alert">
		<div class="iq-alert-text err"></div>
		<button type="button" class="close close1">
			<i class="ri-close-line"></i>
		</button>
	</div>
	<div class="card">
		<div class="card-body">
			<div class="d-flex justify-content-start breadcrumb-content">
				<h5>
					<span>${myClass.schoolName}</span> <span>${myClass.grade}학년</span>
					<span>${myClass.classes}반</span> 과제출제
				</h5>
			</div>
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			<form name="insertForm"
				action="homeworkInsert?${_csrf.parameterName}=${_csrf.token}"
				method="post">
				<div class="input-group mb-4">
					<div class="input-group-prepend">
						<label class="input-group-text" for="inputGroupSelect01">과목선택</label>
					</div>
					<select class="custom-select" id="testSubject" name="testSubject">
						<option value="0" selected>과목을 선택하세요</option>
						<option value="C201">국어</option>
						<option value="C202">수학</option>
						<option value="C203">영어</option>
					</select>
				</div>
		
				<!-- <input type="hidden" id="classId" name="classId"> -->
		
				<div class="input-group mb-4">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">과제명</span>
					</div>
					<input type="text" class="form-control" aria-label="Default"
						aria-describedby="inputGroup-sizing-default" id="homeworkTitle"
						name="homeworkTitle">
				</div>
		
				<div class="input-group mb-4">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">마감일</span>
					</div>
					<input type="date" class="form-control" id="exampleInputdate"
						name="homeworkDdate">
				</div>
		
				<!-- 과제 삽입 구분선 -->
				<ul class="nav nav-tabs justify-content-end" id="myTab-4"
					role="tablist"></ul>
				<div class="form-row float-right" id="delBtn">
					<button type="button" class="btn btn-warning mt-2">
						<i class="ri-delete-bin-2-fill pr-0">삭제</i>
					</button>
				</div>
				<!-- 과제 삽입 및 보기 -->
				<div class="container-fluid d-block">
					<div class="row" id="testList">
		
						<!-- 추가된 문제 삽입 되는 곳 -->
		
						<!-- 문제추가 -->
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="card card-block card-stretch card-height">
								<div class="card-body" id="newTest">
									<div class="subscriber-detail text-center">
										<button type="button" class="mt-2 btn btn-link" name="addTest">
											<i class="ri-bill-fill">문제를 추가하세요</i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 문제번호 -->
				<ul class="nav nav-tabs justify-content-center" id="myTab-2"
					role="tablist">
					<li class="nav-item">
						<button type="submit" class="btn btn-info mt-2" id="publish">출제</button>&nbsp;&nbsp;&nbsp;
					</li>
					<li class="nav-item">
						<button type="button" class="btn btn-light mt-2"
							onclick="location.href='homeworkList'">취소</button>
					</li>
				</ul>
		
				<!-- Modal: choose_test_type -->
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">출제방식</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<span id="start-one"> <i class="fa fa-download"
									aria-hidden="true"></i>
									<button type="button" name="direct_test" id="file-upload-btn"
										class="btn btn-primary">직접출제</button>
								</span>
							</div>
							<div class="modal-body">
								<span id="start-one"> <i class="fa fa-download"
									aria-hidden="true"></i>
									<button type="button" name="test_select" id="file-upload-btn"
										class="btn btn-primary">문제선택</button>
								</span>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- Modal : input test contents -->
	<form name="insertTestForm" id="insertTestForm"
		action="testBankInsert?${_csrf.parameterName}=${_csrf.token}"
		method="post" enctype="multipart/form-data" accept-charset="UTF-8">
		<div class="modal fade" id="testModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable" role="document">
				<div class="modal-content">


					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalScrollableTitle">문제작성</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="hidden" id="memberId" name="memberId"> <input
							type="hidden" id="subjectNo" name="subjectNo">

						<ul class="nav nav-pills mb-2" id="pills-tab" role="tablist">
							<li class="nav-item">
								<div class="input-group">
									<select class="custom-select" id="testSubject2"
										name="testSubject2">
										<option value="0" selected>과목</option>
										<option value="C201">국어</option>
										<option value="C202">수학</option>
										<option value="C203">영어</option>
									</select>
								</div>
							</li>

							<li class="nav-item">
								<div class="input-group">
									<select class="custom-select" id="testScore" name="testScore">
										<option value="0" selected>배점</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</div>
							</li>
						</ul>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text text-area">문제내용</span>
							</div>
							<textarea class="form-control" aria-label="With textarea"
								name="testDetail" id="testDetail"></textarea>
						</div>
						<br>
						<div class="input-group mb-2">
							<div class="form-group">
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="testImage"
										name="testImage"> <label class="custom-file-label"
										for="customFile">파일을 선택하세요</label>
								</div>
							</div>
						</div>

						<div id="testType">
							<div class="radio d-inline-block mr-2">
								<input type="radio" name="testType" id="radio1" value="C502">
								<label for="radio1">객관식</label>
							</div>
							<div class="radio d-inline-block mr-2">
								<input type="radio" name="testType" id="radio2" value="C501">
								<label for="radio2">단답식</label>
							</div>
						</div>
						<!-- 객관식 보기 및 정답 -->
						<div id="answer">
							<div id="multipleAnswer">
								<div class="input-group mb-1">
									<div class="input-group-prepend">
										<span class="input-group-text">보기</span>
									</div>
									<input type="text" class="form-control" placeholder="보기"
										aria-label="보기" aria-describedby="basic-addon1" name="answers">
									<input type="checkbox" class="checkbox-input" name="checkbox1">
								</div>
							</div>

							<div>
								<button type="button" class="btn btn-warning mt-2 mb-2"
									id="addBogi" onclick="addAnswer()">보기추가</button>
								<button type="button" class="btn btn-secondary mt-2 mb-2"
									id="del">보기제거</button>
							</div>
						</div>

						<!-- 					주관식 정답 -->
						<div class="input-group mb-4" name="writeAnswer">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">정답</span>
							</div>
							<input type="text" class="form-control" name="testCorrect"
								id="testCorrect" placeholder="단답식 답 입력" aria-label="단답식 답 입력"
								aria-describedby="basic-addon1">
						</div>

						<div class="input-group mb-2" id="explainAnswer">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">문제해설</span>
							</div>
							<input type="text" class="form-control" name="testCommentary"
								id="testCommentary" placeholder="해설" aria-label="해설"
								aria-describedby="basic-addon1">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="publishTest">문제추가</button>
						<button type="button" name="closeTestModal"
							class="btn btn-secondary" data-dismiss="modal">취소</button>
					</div>

				</div>
			</div>
		</div>
	</form>

	<script>
    // alert 창
    $('.close1').on('click', function() {
			$('.layer').hide();
		})
    
	//날짜
    $('#exampleInputdate').val(new Date().toISOString().substring(0,10));
    
    // 문제(Test) 삭제버튼 보이기/숨기기
    $('#delBtn').hide();
    $('#testList').on('click','[name="checkbox1"]', function(){
    	if($(event.target).prop('checked') == true){
        	$('#delBtn').show();
        } else if($('[name="checkbox1"]:checked').length == 0){
        	$('#delBtn').hide();
        }
    })
    
    // 문제(Test) 삭제
    $('#delBtn').on('click', function(){
    	$('#delBtn').hide();
    	$('.checkbox-input').each(function(i, selected){
	    	if($(selected).prop('checked')==true){
	    		$(selected).parent().parent().parent().remove();
	    	}
	    })
    })
    
    // 문제 추가 전 기본값 입력 체크
    $('[name="addTest"]').on('click', function(){
    	let subject = $('[name="testSubject"]');
		let home_nm = $('[name="homeworkTitle"]');
		let home_end = $('[name="homeworkDdate"]');
		let gwamok = $('#testSubject option:selected').val();
		
    	if(subject.val() == 0){
    		$('.err').text('과목을 선택하세요');
    		$('#err').show();
// 			alert('과목을 선택하세요')
			return;
		}
		
		if(home_nm.val() == ''){
			$('.err').text('제목을 입력하세요');
			$('#err').show();
// 			alert('제목을 입력하세요')
			return;
		}
		
		if(home_end.val() == ''){
			$('.err').text('종료일을 입력하세요');
			$('#err').show();
// 			alert('종료일을 입력하세요')
			return;
		}
		
		$('#exampleModal').modal('show')
	});
    
	// 문제출제(출제유형) 모달
    $('[name="direct_test"]').on('click', function(){
		let gwamok = $('#testSubject option:selected').val();
		
    	$('#testModal').modal('show');
		$('#exampleModal').modal('hide');
		
		$('#testSubject2').val(gwamok);
    	
    	$('#subjectNo').val(gwamok);
    	
    });
    
 	// 문제출제(선택유형) 모달
    $('[name="test_select"]').on('click', function(){
    	$('#exampleModal').modal('hide');
    	let subNm = $('#testSubject option:selected').val();
        let url ='${pageContext.request.contextPath}/test/addSelectedTest?subjectNo='+subNm    
        let name = 'testSelect'
		let option = 'width = 800 height = 1000'
        window.open(url, name, option)
    })
    
	// 보기 추가 버튼
	var num = 1;
	function addAnswer() {
		let outline = $('<div>');
		let multiAns = $('<div>').attr('class', 'input-group mb-1');
		let addNoText = $('<div>').attr('class', 'input-group-prepend');
		let addNo = $('<span>').attr('class', 'input-group-text').text('보기');
		let input = $('<input>').attr('class', 'form-control').attr('placeholder', '보기').attr('aria-label', '보기').attr('aria-describedby', 'basic-addon1').attr('name', 'answers');
		let inputChk = $('<input>').attr('type', 'checkbox').attr('class', 'checkbox-input').attr('name', 'checkbox1');

		addNoText.append(addNo);
		multiAns.append(addNoText);
		multiAns.append(input);
		multiAns.append(inputChk);
		
		$('#multipleAnswer').append(multiAns);
		
	};

	// 보기 삭제 버튼
	$('#del').on('click', delAnswer);

	function delAnswer() {
		
		let chkBogi = $('[name="checkbox1"]:checked');
		
		chkBogi.each(function(idx, tag){
			chkBogi.parent().remove();
		})
		
	};
	
	// 주관식, 객관식 선택
	let write = $('[name="writeAnswer"]');
	let multi = $('#answer');
	let explain = $('#explainAnswer')
	
	write.hide();
	multi.hide();
	explain.hide();

	$(function() {
		$('[name="testType"]').on('click', function() {

			let chkValue = $('[name="testType"]:checked').val();
			
			if (chkValue == 'C501') {
				multi.hide();
				$('#save').hide();
				$('#del').hide();
				write.show();
				explain.show();
			} else {
				multi.show();
				$('#save').show();
				$('#del').show();
				write.hide();
				explain.show();
			}
		})
	})
	
	// ajax : 문제 생성
	$('#publishTest').on('click', makeTest);
    
    function makeTest(event){
    	if($('#radio1').prop('checked')==true){
		    $('[name="answers"]').each(function(i, item){
		    	$(item).attr('name', 'answers[' + i + ']')
		    })
		    
		    $('.checkbox-input').each(function(i, chkNum){
		    	if($(chkNum).prop('checked')==true){
		    		
		    		//$(chkNum).attr('name', 'testCorrect');
		    		$('[name="testCorrect"]').val($(chkNum).prev().val())
		    	}
		    })
    	}
	    // 보내는 데이터(multipart)
	    var form = $('[name="insertTestForm"]');
		var data = new FormData(form[0]); 
	    
	    
		// 문제(test) 등록
		$.ajax('../testBank/testBankInsert',{
			type : 'POST',
			contentType : 'multipart/form-data',
			data : data,
			processData : false,
		    contentType : false,
		    cache : false
		})
		.done(result=>{
			let img = "";
			if(result.testImg == '' || result.testImg == null){
				img = '<img src="../assets/images/page-img/07.jpg" class="card-img-top">';
			} else{
				img = `<img src="../testBank/img/\${result.testImg}" class="card-img-top">`;
			}

			let bankDiv =`<div class="col-md-6 col-lg-4 col-sm-6 testDiv">
			             	<div class="card">
				            	<input type="hidden" id="testNo" name="testNo" value="\${result.testNo}">
								<div class="checkbox d-inline-block mr-3">
							  		<input type="checkbox" class="checkbox-input" name="checkbox1">
								</div>
								\${img}
								<div class="card-body">
									<div class="input-group mb-2">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1">배점</span>
										</div>
											<input type="text" class="form-control" aria-label="Username"
											aria-describedby="basic-addon1" value="\${result.testScore}" readonly>
										</div>
									<div class="input-group mb-2">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1">문제</span>
										</div>
										<input type="text" class="form-control" aria-label="Username"
										aria-describedby="basic-addon1" value="\${result.testDetail}" readonly>
									</div>
									
									<div class="input-group mb-2">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1">정답</span>
										</div>
										<input type="text" class="form-control" aria-label="Username"
										aria-describedby="basic-addon1" value="\${result.testCorrect}" readonly>
									</div>
								</div>
			             	</div>
			          	</div>`
	  		
	        $('#testList').prepend(bankDiv);
			          	
			$('#testModal').on('hidden.bs.modal', function () {
				$('#testImage').val('');
				$('[for="customFile"]').text('파일을 선택하세요')
				$('#insertTestForm')[0].reset();
				
				let write = $('[name="writeAnswer"]');
				let multi = $('#answer');
				let explain = $('#explainAnswer');
				
				write.hide();
				multi.hide();
				explain.hide();
		 	})
		 	
			$('#testModal').modal('hide');
          	
		})
		.fail(reject=>{
			let chkValue = $('[name="testType"]:checked').val();
			let subject = $('[name="testSubject"]');
			let score = $('[name="testScore"]');
			let content = $('[name="testDetail"]');
			let correct = $('[name="testCorrect"]');
			let type = $('[name="testType"]');
			
			let chkBogi = $('[name="checkbox1"]:checked').prev().val();
			
			if(score.val() == 0){
				$('.err').text('배점을 선택하세요');
				$('#err').show();
// 				alert('배점을 선택하세요')
				return;
			}
			
			if(content.val() == ''){
				$('.err').text('내용을 입력하세요');
				$('#err').show();
// 				alert('내용을 입력하세요')
				return;
			}
			
			if(type.val() == ''){
				$('.err').text('문제형식을 선택하세요');
				$('#err').show();
// 				alert('내용을 입력하세요')
				return;
			}
			
			if(correct.val() == 0 && chkValue == 'C502'){
				$('.err').text('정답을 선택하세요');
				$('#err').show();
// 				alert('정답을 선택하세요')
				return;
			}
			
			if(correct.val() == 0 && chkValue == 'C501'){
				$('.err').text('정답을 작성하세요');
				$('#err').show();
// 				alert('정답을 작성하세요')
				return;
			}
		});
	};
	
	// 문제 추가 form submit
	 $('[name="insertTestForm"]').on('submit', function(e){
	    	e.preventDefault();
	    	$('.done').text('문제 출제 완료');
	    	$('#done').show();
// 	    	alert('문제 출제 완료')

    	    $('#ok1').on('click', function() {
			$('.layer').hide();
			insertTestForm.submit()
		})
	});
	
    
    $('[name="closeTestModal"]').on('click', function(){
   		$('#testModal').modal('hide')
    });
    
    // 과제 등록
    $('[name="insertForm"]').on('submit', function(e){
    	e.preventDefault();
    	
    	
    	let subject = $('[name="testSubject"]');
		let home_nm = $('[name="homeworkTitle"]');
		let home_end = $('[name="homeworkDdate"]');
		
		if(subject.val() == 0){
			$('.err').text('과목을 선택하세요');
			$('#err').show();
// 			alert('과목을 선택하세요')
			return;
		}
		
		if(home_nm.val() == ''){
			$('.err').text('제목을 입력하세요');
			$('#err').show();
// 			alert('제목을 입력하세요')
			return;
		}
		
		if(home_end.val() == ''){
			$('.err').text('종료일을 입력하세요');
			$('#err').show();
// 			alert('종료일을 입력하세요')
			return;
		}
		
		if($('.testDiv').length == 0){
			$('.err').text('문제를 추가하세요');
			$('#err').show();
// 			alert('문제를 추가하세요')
			return;
		}
		$('.done').text('게시글이 등록되었습니다');
		$('#done').show();
// 		alert('게시글이 등록되었습니다')
    	$('#ok1').on('click', function() {
			$('.layer').hide();
			insertForm.submit();	
		})
    });
    
    </script>
</body>
</html>