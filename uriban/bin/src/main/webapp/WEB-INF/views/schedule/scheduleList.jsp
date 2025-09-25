<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<!-- 	<table border="1"> -->
<!-- 		<thead> -->
<!-- 			<tr> -->
<!-- 				<th>학사일정 번호</th>bno -->
<!-- 				<th>반ID</th>title -->
<!-- 				<th>공지 번호</th>writer -->
<!-- 				<th>등록자</th>yyyy년MM월dd일 -->
<!-- 				<th>행사항목</th>bno -->
<!-- 				<th>제목</th>title -->
<!-- 				<th>시작일자</th>bno -->
<!-- 				<th>종료일자</th>title -->
<!-- 			</tr> -->
<!-- 		</thead> -->
<!-- 		<tbody> -->
<%-- 			<c:forEach items="${scheduleList }" var="list"> --%>
<!-- 				<tr> -->
<%-- 					<td>${list.scheduleNo }</td> --%>
<%-- 					<td>${list.classId }</td> --%>
<%-- 					<td>${list.noticeNo }</td> --%>
<%-- 					<td>${list.scheduleWriter }</td> --%>
<%-- 					<td>${list.scheduleCategory }</td> --%>
<%-- 					<td>${list.scheduleTitle }</td> --%>
<%-- 					<td><fmt:formatDate value="${list.startDate }" pattern="yyyy년MM월dd일"/></td> --%>
<%-- 					<td><fmt:formatDate value="${list.endDate }" pattern="yyyy년MM월dd일"/></td> --%>
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<!-- 		</tbody> -->
<!-- 	</table> -->
<!-- 	<button type="button" onclick="location.href='scheduleInsert'">등록</button> -->
	  <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between breadcrumb-content">
                            <h5>Calender</h5>
                            <div>
                                <button type="button" class="btn btn-primary" onclick="location.href='scheduleInsert'">새 학사일정 등록</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-8">
                <div class="card card-block card-stretch card-height">
                    <div class="card-header d-flex justify-content-between">
                        <div class="d-flex align-items-center">
                            <h5 class="mr-3">20 Nov, Friday</h5>
                            <div class="mt-1">
                                <a href="#" id="cal-prev" class="text-dark mr-2 font-size-18"><i class="las la-chevron-circle-left m-0"></i></a>
                                <a href="#" id="cal-next" class="text-dark font-size-18"><i class="las la-chevron-circle-right m-0"></i></a>
                            </div>
                        </div>
                        <div class="d-flex align-items-center">
                            <select name="cal_type" class="selectpicker calender-select" id="cal-type">
                                <option value="month">Month</option>
                            </select>
                            <a href="#" class="btn btn-primary btn-new"><i class="ri-add-line"></i>New</a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="calendar" style="height: 640px;"></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-4">
                <div class="card card-block card-stretch card-height">
                    <div class="card-body">
                        <div class="card border-bottom">
                            <div class="card-body text-center inln-date flet-datepickr">
                                <input type="text" id="inline-date" class="date-input basicFlatpickr d-none" readonly="readonly">
                            </div>
                        </div>
			            <div class="card card-list">
						    <div class="card-body">
						        <div class="d-flex align-items-center">
						            <svg class="svg-icon text-secondary mr-3" width="24" height="24" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
						                <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
						            </svg>
						            <div class="pl-3 border-left">
						                <h5>Direct Development</h5>
						                <p class="mb-0">Unveling the design system</p>
						            </div>
						        </div>
						    </div>
						</div>
						<div class="card card-list">
						    <div class="card-body">
						        <div class="d-flex align-items-center">
						            <svg class="svg-icon text-primary mr-3" width="24" height="24" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
						                <polyline points="22 12 16 12 14 15 10 15 8 12 2 12"></polyline>
						                <path d="M5.45 5.11L2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11z"></path>
						            </svg>
						            <div class="pl-3 border-left">
						                <h5>action point assigned</h5>
						                <p class="mb-0">Unveling the design system</p>
						            </div>
						        </div>
						    </div>
						</div>
						<div class="card card-list mb-0">
						    <div class="card-body">
						        <div class="d-flex align-items-center">
						            <svg class="svg-icon text-warning mr-3" width="24" height="24" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
						            	<path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline>
						            </svg>
						            <div class="pl-3 border-left">
						                <h5>Private Notes</h5>
						                <p class="mb-0">Unveling the design system</p>
						            </div>
						        </div>
						    </div>
						</div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page end  -->
    </div>
    <form name="scheduleInsertForm" action="scheduleInsert" method="post">
	    <div class="modal fade bd-example-modal-lg" role="dialog" aria-modal="true" id="new-create-modal">
	        <div class="modal-dialog  modal-dialog-centered modal-lg" role="document">
	            <div class="modal-content">
	                <div class="modal-header d-block text-center pb-3 border-bttom">
	                    <h3 class="modal-title" id="exampleModalCenterTitle03">학사일정 등록</h3>
	                </div>
	                <div class="modal-body">
	                    <div class="row">
	                    	 <div class="col-lg-12">
	                            <div class="form-group mb-3">
	                                <label for="exampleInputText03" class="h5">아이디</label>
	                                <input type="text" class="form-control" id="exampleInputText03" name="scheduleNo" value="${scheduleNo }">
	                                <a href="#" class="task-edit text-body"><i class="ri-edit-box-line"></i></a>
	                            </div>
	                        </div>
	                        <div class="col-lg-12">
	                            <div class="form-group mb-3">
	                                <label for="exampleInputText03" class="h5">제목</label>
	                                <input type="text" class="form-control" id="exampleInputText03" name="scheduleTitle" placeholder="Enter task Name">
	                                <a href="#" class="task-edit text-body"><i class="ri-edit-box-line"></i></a>
	                            </div>
	                        </div>
	                        <div class="col-lg-12">
	                            <div class="form-group mb-3">
	                                <label for="exampleInputText2" class="h5">행사항목</label>
	                                <select name="scheduleCategory" class="selectpicker form-control" data-style="py-0">
	                                    <option value="D101">정기행사일정</option>
	                                    <option value="D102">교내 행사</option>
	                                    <option value="D103">학부모 참관일</option>
	                                    <option value="D104">생일</option>
	                                </select>
	                            </div>
	                        </div>
	                        <div class="col-lg-6">
	                            <div class="form-group mb-3">
	                                <label for="exampleInputText03" class="h5">시작날짜</label>
	                                <input type="text" class="form-control" id="exampleInputText03" name="startDate" placeholder="Enter task Name">
	                                <a href="#" class="task-edit text-body"><i class="ri-edit-box-line"></i></a>
	                            </div>
	                        </div>
	                        <div class="col-lg-6">
	                            <div class="form-group mb-3">
	                                <label for="exampleInputText03" class="h5">종료날짜</label>
	                                <input type="text" class="form-control" id="exampleInputText03" name="endDate" placeholder="Enter task Name">
	                                <a href="#" class="task-edit text-body"><i class="ri-edit-box-line"></i></a>
	                            </div>
	                        </div>
	                        <div class="col-lg-12">
	                            <div class="d-flex flex-wrap align-items-ceter justify-content-center mt-4">
	                                <div class="btn btn-primary mr-3" data-dismiss="modal"><button type="submit">등록</button></div><!-- div에서 submit되게 jquery -->
	                                <div class="btn btn-primary" data-dismiss="modal"><button type="button" onclick="location.href='scheduleList'">취소</button></div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
    </form>
   	<script>
	   	$('[name="scheduleInsertForm"]').submit(function(event){
			event.preventDefault();
			console.log("asdsad")
			let title = $('[name="scheduleTitle"]');
			if (title.val() == ''){
				alert("제목이 입력되지 않았습니다.");
				title.focus();
				return;
			}
			//let a = document.getElementById('category').value;
			let category = $('select[name="scheduleCategory"]').val();
			
			alert('게시글이 등록되었습니다.');
			scheduleInsertForm.submit();
		});
	</script>
</body>
</html>