<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제입력</title>
</head>
<body>

	<form name="insertTestForm" action="testBankInsert?${_csrf.parameterName}=${_csrf.token}" method="post">

		<input type="hidden" id="memberId" name="memberId">
		<input type="hidden" id="subjectNo" name="subjectNo">
		<input type="hidden" id="testNo" name="testNo">
		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
			<li class="nav-item">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">문제번호</span>
					<input type="text" class="form-control" placeholder="1번" aria-label="1번" aria-describedby="basic-addon1" readonly>
				</div>
			</li>
			<li class="nav-item">
				<div class="input-group mb-4">
					<select class="custom-select" id="inputGroupSelect01" name="testSubject">
						<option value="0" selected>과목</option>
						<option value="C201">국어</option>
						<option value="C202">수학</option>
						<option value="C203">영어</option>
					</select>
				</div>
			</li>
			<li class="nav-item">
				<div class="input-group mb-4">
					<select class="custom-select" id="inputGroupSelect01" name="testScore">
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
			<textarea class="form-control" aria-label="With textarea" name="testDetail"></textarea>
		</div>
		<br>
		<div class="input-group mb-4">
			<input type="text" class="form-control" placeholder="이미지 찾기" aria-label="이미지 찾기" readonly>
			<div class="input-group-append">
				<button class="btn btn-primary" type="button">이미지 첨부</button>
			</div>
		</div>
		<div id="testType">
			<div class="radio d-inline-block mr-2">
				<input type="radio" name="testType" id="radio1" value="C502" checked>
				<label for="radio1">객관식</label>
			</div>
			<div class="radio d-inline-block mr-2">
				<input type="radio" name="testType" id="radio2" value="C501">
				<label for="radio2">주관식</label>
			</div>
		</div>
		<!-- 객관식 보기 및 정답 -->
		
		<div id="answer" name="multipleAnswer">
			<div class="input-group mb-4">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1" name="answerNo">1</span>
				</div>
				<input type="text" class="form-control" placeholder="보기" aria-label="보기" aria-describedby="basic-addon1"> &nbsp;&nbsp;
				<input type="checkbox" class="checkbox-input" id="checkbox1" name="checkbox">
			</div>
		</div>
		
		<button type="button" class="btn btn-warning mt-2" id="save">보기추가</button>
		<button type="button" class="btn btn-secondary mt-2" id="del">보기제거</button>
		
	
	
		<!-- 주관식 정답 -->
		<div class="input-group mb-4" name="writeAnswer">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon1">정답</span>
			</div>
			<input type="text" class="form-control" name="testCorrect" placeholder="주관식 답 입력" aria-label="주관식 답 입력" aria-describedby="basic-addon1">
		</div>
	
		<div class="input-group mb-4" name="explainAnswer">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon1">문제해설</span>
			</div>
			<input type="text" class="form-control" name="testCommentary" placeholder="해설" aria-label="해설" aria-describedby="basic-addon1">
		</div>
	
		<ul class="nav nav-tabs justify-content-center" id="myTab-2"
			role="tablist">
			<li class="nav-item">
				<button type="submit" class="btn btn-info mt-2" id="publish">문제출제</button>&nbsp;&nbsp;&nbsp;
			</li>
			<li class="nav-item">
				<button type="button" class="btn btn-light mt-2" data-dismiss="modal">취소</button>
			</li>
		</ul>
	</form>
	<script>
		
		$('#save').on('click', addAnswer);

		let num = 1;

		function addAnswer() {

			let outline = $('<div/>').attr('name', 'multipleAnswer');
			let multiAns = $('<div/>').attr('class', 'input-group mb-4');
			let addNoText = $('<div/>').attr('class', 'input-group-prepend');
			let addNo = $('<span/>').attr('class', 'input-group-text').attr('name', 'answerNo').text(++num);
			let input = $('<input/>').attr('class', 'form-control').attr('placeholder', '보기').attr('aria-label', '보기').attr('aria-describedby', 'basic-addon1');
			let inputChk = $('<input/>').attr('type', 'checkbox').attr('class',	'checkbox-input').attr('name', 'checkbox');

			addNoText.append(addNo);
			multiAns.append(addNoText);
			multiAns.append(input);
			multiAns.append(inputChk);
			outline.append(multiAns);

			$('#answer').append(multiAns)
		};

		$('#del').on('click', delAnswer);

		function delAnswer() {
			let chkBogi = $('input:checkbox[class="checkbox-input"]:checked');
			let chkNoList = [];
			chkBogi.each(function(idx, tag){
				//chkNoList.push(tag.closest('div').firstElementChild.innerText);
				chkBogi.parent().remove();
			})
			//console.log(chkNoList);
		};
		
		let write = $('[name="writeAnswer"]');
		let multi = $('[name="multipleAnswer"]');
		write.hide();

		$(function() {
			$('[name="testType"]').on('click', function() {

				let chkValue = $('[name="testType"]:checked').val();
				console.log(chkValue);
				
				if (chkValue == 'C501') {
					multi.hide();
					$('#save').hide();
					$('#del').hide();
					write.show();
				} else {
					multi.show();
					$('#save').show();
					$('#del').show();
					write.hide();
				}
			})
		})
		
		$('#publish').on('click', makeTest);
		
		function makeTest(event){
			$.ajax('', function(){
				type : 'post',
				contentType : 'application/json',
				data : JSON.stringify(?)
			})
			.done(result=>{
				
			})
			.fail(reject=>console.log(reject));
			
		};
		
		
		 $('[name="insertTestForm"]').on('submit', function(e){
		    	e.preventDefault();
		    	
		    	let subject = $('[name="testSubject"]');
				let score = $('[name="testScore"]');
				let content = $('[name="testDetail"]');
				let correct = $('[name="testCorrect"]');
				
				let chkBogi = $('[name="checkbox"]:checked').prev().val();
				console.log(chkBogi);
				
				if(subject.val() == 0){
					alert('과목을 선택하세요')
					return;
				}
				
				if(score.val() == 0){
					alert('배점을 선택하세요')
					return;
				}
				
				if(content.val() == ''){
					alert('내용을 입력하세요')
					return;
				}
				
				let selectType = $('[name="testType"]:checked')
				
				if(selectType.val() == "C502"){
					if(chkBogi != null){
						let correctBogi = $('[name="checkbox"]:checked').prev()
						correctBogi.attr('name', 'testCorrect');
					} else{
						alert("정답을 선택하세요")
						return;
					}
				} else if(selectType.val() == "C501"){
					if(correct.val() == ''){
						alert('정답을 입력하세요')
						return;
					}
				}
				alert('문제 출제 완료')
				insertTestForm.submit();
		    
		});
	</script>
</body>
</html>