<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
<div class="card">
	<div class="card-body">
		<div class="d-flex justify-content-start breadcrumb-content">
			<h5>앨범관리</h5>
		</div>
	</div>
</div>
	<div class="d-flex justify-content-center">
      <div class="col-sm-12 col-lg-9">
         <div class="card">
            <div class="card-body">
               <form id="updateForm" name="updateForm" action="../album/albumUpdate?${_csrf.parameterName}=${_csrf.token}" method="post" accept-charset="UTF-8" enctype="multipart/form-data">
	                <div class="form-group">
	                   <label for="content">내용</label>
	                   <input type="text" class="form-control" id="content" maxlength="100" name="content" value="${albumInfo.content }">
	                </div>
	                <div class="form-group">
	                   <label for="place">장소</label>
	                   <input type="text" class="form-control" id="place" maxlength="50" name="place" value="${albumInfo.place }">
	                </div>
	                <div class="form-group">
	                   <label for="tags">해쉬태그</label>
	                   <input type="text" class="form-control" id="tags" name="tags" value="${tags }">
	                </div>
	                <div class="form-group">
	                   <label for="customFile">이미지</label>
	                   <div class="custom-file">
	                      <input type="file" class="custom-file-input" id="customFile" name="images" multiple>
	                      <label class="custom-file-label" for="customFile">이미지 파일 선택</label>
	                   </div>
	                </div>
	                <br>
					<div class="d-flex justify-content-end">
		                <button type="button" id="save" class="btn btn-primary">수정</button>&ensp;
		                <button type="button" class="btn btn-danger" onclick="delAlbum(${albumInfo.albumNo })">삭제</button>&ensp;
		                <button type="button" class="btn btn-light" onclick="location.href='../album/albumList'">취소</button>
		            </div>
		            <input type="hidden" name="classId" value="${myClass.classId}" />
		            <input type="hidden" name="albumNo" id="albumNo" value="${albumInfo.albumNo }" />
             	</form>
            </div>
         </div>
       </div>
     </div>
<div class="alert text-white bg-info layer" id="done" role="alert">
	<div class="iq-alert-text done">
		A simple <b>info</b> alert—check it out!
	</div>
<button type="button" class="close close1">
	<i class="ri-close-line"></i>
</button>
</div>     
 
<div class="alert alert-info layer" id="cnf" role="alert">
	<div class="iq-alert-text cnf align-self-center">
		정말 삭제하시겠습니까?	
	</div>
	<div>
		<button type="button" id="ok" class="btn btn-info float-right">확인</button>
		<button type="button" class="btn btn-outline-info float-right close1">취소</button>
	</div>
</div> 
 
</body>
<script>
$('.close1').on('click', function() {
	$('.layer').hide();
})

$('#save').on('click', saveAlbum);

function saveAlbum(){
	let content = $('#content').val();
	let place = $('#place').val();

	if($('#content').val() == ''){
		alert('내용이 입력되지 않았습니다.');
		$('#content').focus();
		return;
	}

	if($('#place').val() == ''){
		alert('장소가 입력되지 않았습니다.');
		$('#place').focus();
		return;
	}
	
	$('.done').text('앨범이 수정되었습니다.');
	$('#done').show();
	
	updateForm.submit(); 
}

function delAlbum(albumNo){
	$('#cnf').show();	
	$("#ok").click(function () {
		location.href=`../album/albumDelete?albumNo=\${albumNo }`
	});
}
</script>
</html>
