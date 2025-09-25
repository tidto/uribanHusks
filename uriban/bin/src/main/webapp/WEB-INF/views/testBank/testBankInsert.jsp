<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제입력</title>
</head>
<body>
	<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
		<li class="nav-item">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon1">문제번호</span> <input
					type="text" class="form-control" placeholder="1번" aria-label="1번"
					aria-describedby="basic-addon1" readonly>
			</div>
		</li>
		<li class="nav-item">
			<div class="input-group mb-4">
				<select class="custom-select" id="inputGroupSelect01">
					<option selected>과목</option>
					<option value="C201">국어</option>
					<option value="C202">수학</option>
					<option value="C203">영어</option>
				</select>
			</div>
		</li>
		<li class="nav-item">
			<div class="input-group mb-4">
				<select class="custom-select" id="inputGroupSelect01">
					<option selected>배점</option>
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
		<textarea class="form-control" aria-label="With textarea"></textarea>
	</div>
	<br>
	<div class="input-group mb-4">
		<input type="text" class="form-control" placeholder="이미지 찾기"
			aria-label="이미지 찾기" readonly>
		<div class="input-group-append">
			<button class="btn btn-primary" type="button">이미지 첨부</button>
		</div>
	</div>
	<div class="radio d-inline-block mr-2">
		<input type="radio" name="bsradio" id="radio1" value="1" checked>
		<label for="radio1">객관식</label>
	</div>
	<div class="radio d-inline-block mr-2">
		<input type="radio" name="bsradio" id="radio2" value="2"> <label
			for="radio2">주관식</label>
	</div>

	<!-- 객관식 보기 및 정답 -->
	<div id="answer">
		<div class="input-group mb-4" name="multipleAnswer">
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
		<input type="text" class="form-control" placeholder="주관식 답 입력" aria-label="주관식 답 입력" aria-describedby="basic-addon1">
	</div>

	<div class="input-group mb-4" name="explainAnswer">
		<div class="input-group-prepend">
			<span class="input-group-text" id="basic-addon1">문제해설</span>
		</div>
		<input type="text" class="form-control" placeholder="해설"
			aria-label="해설" aria-describedby="basic-addon1">
	</div>

	<ul class="nav nav-tabs justify-content-center" id="myTab-2"
		role="tablist">
		<li class="nav-item">
			<button type="submit" class="btn btn-info mt-2" id="publish">출제</button>&nbsp;&nbsp;&nbsp;
		</li>
		<li class="nav-item">
			<button type="button" class="btn btn-light mt-2"
				onclick="window.close()">취소</button>
		</li>
	</ul>
	<script>
		$('div[name="writeAnswer"]').hide();

		$(function() {
			$('input[type=radio][name="bsradio"]').on(
					'click',
					function() {

						var chkValue = $(
								'input[type=radio][name="bsradio"]:checked')
								.val();
						if (chkValue == '2') {
							$('div[name="multipleAnswer"]').hide();
							$('#save').hide();
							$('#del').hide();
							$('div[name="writeAnswer"]').show();
						} else {
							$('div[name="multipleAnswer"]').show();
							$('#save').show();
							$('#del').show();
							$('div[name="writeAnswer"]').hide();
						}
					})
		})
		$('#save').on('click', addAnswer);

		let num = 1;

		function addAnswer() {

			let multiAns = $('<div/>').attr('class', 'input-group mb-4').attr('name', 'multipleAnswer');
			let addNoText = $('<div/>').attr('class', 'input-group-prepend');
			let addNo = $('<span/>').attr('class', 'input-group-text').attr('name', 'answerNo').text(++num);
			let input = $('<input/>').attr('class', 'form-control').attr('placeholder', '보기').attr('aria-label', '보기').attr('aria-describedby', 'basic-addon1');
			let inputChk = $('<input/>').attr('type', 'checkbox').attr('class',	'checkbox-input').attr('name', 'checkbox');

			addNoText.append(addNo);
			multiAns.append(addNoText);
			multiAns.append(input);
			multiAns.append(inputChk);

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
	</script>
</body>
</html>