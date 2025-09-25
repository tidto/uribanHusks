<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과제수정</title>
</head>
<body>
	<form name="updateForm" action="homeworkUpdate" method="post">
	<div class="input-group mb-4">
    	<div class="input-group-prepend">
    		<label class="input-group-text" for="inputGroupSelect01">과목선택</label>
    	</div>
    	
    	<input type="hidden" id="homeworkNo" name="homeworkNo" value="${homeworkInfo.homeworkNo}">
    	
    	<select class="custom-select" id="inputGroupSelect01" name="testSubject">
       		<option value="0" selected>과목을 선택하세요</option>
       			<option value="C201" <c:if test="${homeworkInfo.testSubject eq 'C201'}"> selected </c:if>>국어</option>
       		<option value="C202" <c:if test="${homeworkInfo.testSubject eq 'C202'}"> selected </c:if>>수학</option>
       		<option value="C203" <c:if test="${homeworkInfo.testSubject eq 'C203'}"> selected </c:if>>영어</option>
    	</select>
    </div>

    <div class="input-group mb-4">
		<div class="input-group-prepend">
			<span class="input-group-text" id="inputGroup-sizing-default">과제명</span>
		</div>
		<input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" id="homeworkTitle" name="homeworkTitle" value="${homeworkInfo.homeworkTitle}">
    </div>
    
    <div class="input-group mb-4">
		<div class="input-group-prepend">
			<span class="input-group-text" id="inputGroup-sizing-default">마감일</span>
		</div>
		<input type="date" class="form-control" id="exampleInputdate" name="homeworkDdate" value="<fmt:formatDate value='${homeworkInfo.homeworkDdate}' pattern='yyyy-MM-dd'/>">
    </div>
    
    <ul class="nav nav-tabs justify-content-end" id="myTab-4" role="tablist">
       <li class="nav-item">
          <label id="file-drag">
			<span id="start-one">
				<i class="fa fa-download" aria-hidden="true"></i>
				<span id="file-upload-btn" class="btn btn-primary">과제추가</span>
       		</span>
    	</label>
       </li>
    </ul>
    
    <!-- 과제 삽입 및 보기 -->
	<div class="container-fluid">
        <div class="row">
           <!-- 입력과제 -->
           <div class="col-sm-6 col-md-6 col-lg-3">
              <div class="card card-block card-stretch card-height">
                 <div class="card-body">
                 	<div class="checkbox d-inline-block mr-3">
	                <input type="checkbox" class="checkbox-input" id="checkbox1">
				</div>
                    <div class="subscriber-detail text-center">
                       <div class="image mb-2 position-relative d-inline-block">
                          <img src="../assets/images/user/04.jpg" alt="profile" class="img-fluid rounded-circle avatar-100 text-center">
                          <button type="button" class="btn btn-icon rounded-circle title-whatsapp iq-card-btn"> <i class="ri-edit-2-fill m-0"></i>
                          </button>
                       </div>
                       <h5>Ira Membrit</h5>
                       <p class="mb-2">Developer</p>
                       <div class="d-flex align-items-center justify-content-center">
                          <button class="btn btn-success rounded-small"><i class="ri-mail-line m-0"></i>
                          </button>
                          <div class="title bg-success-light rounded rounded-small ml-1">Enterprise</div>
                       </div>
                    </div>
                 </div>
              </div>
           </div>
        </div>
     </div>
     <ul class="nav nav-tabs justify-content-center" id="myTab-2" role="tablist">
        <li class="nav-item">
           <button type="submit" class="btn btn-info mt-2" id="updateBtn">수정</button>&nbsp;&nbsp;&nbsp;
        </li>
        <li class="nav-item">
           <button type="button" class="btn btn-light mt-2" onclick="location.href='homeworkList'">취소</button>
        </li>
     </ul>
     </form>
     <script>
	     $('[name="updateForm"]').on('submit', function(e){
	     	e.preventDefault();
	     	
	     	let subject = $('[name="testSubject"]');
	 		let home_nm = $('[name="homeworkTitle"]');
	 		let home_end = $('[name="homeworkDdate"]');
	 		
	 		if(subject.val() == 0){
	 			alert('과목을 선택하세요')
	 			return;
	 		}
	 		
	 		if(home_nm.val() == ''){
	 			alert('제목을 입력하세요')
	 			return;
	 		}
	 		
	 		if(home_end.val() == ''){
	 			alert('제목을 입력하세요')
	 			return;
	 		}
	 		
	 		alert('게시글이 수정되었습니다')
	 		updateForm.submit();
	     })
     </script>
</body>
</html>