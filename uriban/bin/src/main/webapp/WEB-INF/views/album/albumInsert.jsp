<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div class="d-flex justify-content-center">
      <div class="col-sm-12 col-lg-9">
         <div class="card">
            <div class="card-header d-flex justify-content-center">
               <div class="header-title">
                  <h4 class="card-title">앨범등록</h4>
               </div>
            </div>
            <div class="card-body">
               <form id="insertForm" name="insertForm" action="albumInsert" method="post" accept-charset="UTF-8" enctype="multipart/form-data">
                <div class="form-group">
                   <label for="content">내용</label>
                   <input type="text" class="form-control" id="content"
                      name="content" placeholder="내용을 입력해주세요">
                </div>
                <div class="form-group">
                   <label for="place">장소</label>
                   <input type="text" class="form-control" id="place"
                     name="place" placeholder="장소를 입력해주세요">
                </div>
                <div class="form-group">
                   <label for="exampleInputPlaceholder">해쉬태그</label>
                   <input type="text" class="form-control" id="hashTag"
                      name="tags" placeholder="#태그1#태그2#태그3">
                </div>
                <div class="form-group">
                   <label for="customFile">이미지</label>
                   <div class="custom-file">
                      <input type="file" class="custom-file-input" name="images" id="customFile" multiple>
                      <label class="custom-file-label" for="customFile">Choose file</label>
                   </div>
                </div>
                <br>
				<div class="d-flex justify-content-end">
	                <button type="button" id="save" class="btn btn-primary">등록</button>&ensp;
	                <button type="button" class="btn bg-danger" onclick="location.href='albumList'">취소</button>
	            </div>
	            <input type="hidden" name="classNo" value="1" />
	            <input type="hidden" name="albumNo" id="albumNo" value="${albumNo }" />
             </form>
            </div>
         </div>
       </div>
     </div>  
</body>
<script>

$('#save').on('click', saveAlbum);

function saveAlbum(){
	let content = $('#content').val();
	let place = $('#place').val();

	if($('#content').val() == ''){
		alert('내용이 입력되지 않았습니다.');
		content.focus();
		return;
	}

	if($('#place').val() == ''){
		alert('장소가 입력되지 않았습니다.');
		place.focus();
		return;
	}
	
	alert('앨범이 등록되었습니다.');
	insertForm.submit(); 
}
 
</script>

</html>