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
</head>
<body>
	<form name="insertForm" action="homeworkInsert" method="post">
	    <div class="input-group mb-4">
	    	<div class="input-group-prepend">
	    		<label class="input-group-text" for="inputGroupSelect01">과목선택</label>
	    	</div>
	    	<select class="custom-select" id="inputGroupSelect01" name="testSubject">
	       		<option value="0" selected>과목을 선택하세요</option>
	       		<option value="C201">국어</option>
	       		<option value="C202">수학</option>
	       		<option value="C203">영어</option>
	    	</select>
	    </div>
	    
		<input type="hidden" id="classId" name="classId" value="1">
		
	    <div class="input-group mb-4">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">과제명</span>
			</div>
			<input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" id="homeworkTitle" name="homeworkTitle">
	    </div>
	    
	    <div class="input-group mb-4">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">마감일</span>
			</div>
			<input type="date" class="form-control" id="exampleInputdate" name="homeworkDdate">
	    </div>
	    
	    <ul class="nav nav-tabs justify-content-end" id="myTab-4" role="tablist">
	      <li class="nav-item">
	         <label id="file-drag">
	<!-- 			<span id="start-one"> -->
	<!-- 				<i class="fa fa-download" aria-hidden="true"></i> -->
	<!-- 				<button id="file-upload-btn" class="btn btn-primary">과제추가</button> -->
	<!--        		</span> -->
	            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
	             과제추가
	        </button>
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
	           <button type="submit" class="btn btn-info mt-2" id="publish">출제</button>&nbsp;&nbsp;&nbsp;
	        </li>
	        <li class="nav-item">
	           <button type="button" class="btn btn-warning mt-2" id="save">임시저장</button>&nbsp;&nbsp;&nbsp;
	        </li>
	        <li class="nav-item">
	           <button type="button" class="btn btn-light mt-2" onclick="location.href='homeworkList'">취소</button>
	        </li>
	     </ul>
	     <!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	      <div class="modal-dialog" role="document">
	        <div class="modal-content">
	          <div class="modal-header">
	            <h5 class="modal-title" id="exampleModalLabel">출제방식</h5>
	            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	              <span aria-hidden="true">&times;</span>
	            </button>
	          </div>
	          <div class="modal-body">
	          <span id="start-one">
	             <i class="fa fa-download" aria-hidden="true"></i>
	             <button id="file-upload-btn" class="btn btn-primary">직접출제</button>
	          </span>
	          </div>
	          <div class="modal-body">
	          <span id="start-one">
	             <i class="fa fa-download" aria-hidden="true"></i>
	             <button id="file-upload-btn" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath }/testBankList'">문제선택</button>
	          </span>
	          </div>
	          <div class="modal-footer">
	            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	          </div>
	        </div>
	      </div>
	    </div>
    </form>
    <script>
    document.getElementById('exampleInputdate').valueAsDate = new Date();
    
    let popupBtn = document.querySelector('#file-upload-btn');

    popupBtn.onclick = function(){
      let popOption = "width = 650px, height = 850px, top = 300px, left = 300px, scrollbars=yes";
      let openUrl = "${pageContext.request.contextPath}/testBankInsert";
      window.open(openUrl, 'pop', popOption)
    }
    
    $('[name="insertForm"]').on('submit', function(e){
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
		
		alert('게시글이 등록되었습니다')
		insertForm.submit();
    })
    </script>
</body>
</html>