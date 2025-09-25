<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                  <h4 class="card-title">앨범관리</h4>
               </div>
            </div>
            <div class="card-body">
               <form id="updateForm" name="updateForm" action="albumUpdate" method="post" accept-charset="UTF-8" enctype="multipart/form-data">
	                <div class="form-group">
	                   <label for="content">내용</label>
	                   <input type="text" class="form-control" id="content" name="content" value="${albumInfo.content }">
	                </div>
	                <div class="form-group">
	                   <label for="place">장소</label>
	                   <input type="text" class="form-control" id="place" name="place" value="${albumInfo.place }">
	                </div>
	                <div class="form-group">
	                   <label for="tags">해쉬태그</label>
	                   <input type="text" class="form-control" id="tags" name="tags" value="${tags }">
	                </div>
	                <div class="form-group">
	                   <label for="customFile">이미지</label>
	                   <div class="custom-file">
	                      <input type="file" class="custom-file-input" id="customFile" name="images" multiple>
	                      <label class="custom-file-label" for="customFile">Choose file</label>
	                   </div>
	                </div>
	                <br>
					<div class="d-flex justify-content-end">
		                <button type="submit" class="btn btn-primary">수정</button>&ensp;
		                <button type="button" class="btn btn-danger" onclick="location.href='albumDelete?albumNo=${albumInfo.albumNo }'">삭제</button>&ensp;
		                <button type="button" class="btn btn-light" onclick="location.href='albumList'">취소</button>
		            </div>
		            <input type="hidden" name="classNo" value="${albumInfo.classNo }" />
		            <input type="hidden" name="albumNo" id="albumNo" value="${albumInfo.albumNo }" />
             	</form>
            </div>
         </div>
       </div>
     </div>
</body>
</html>