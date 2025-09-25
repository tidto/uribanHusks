<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	  <div class="container-fluid">
		  <div class="">
			<div class="">
				<div class="">
					<div class="card-body">
                        <div class="d-flex align-items-center justify-content-between breadcrumb-content">
                            <h5>학사일정</h5>
							<c:if test="${auth eq 'A102'}">
							<div>
								<button type="button" class="btn btn-primary" onclick="location.href='scheduleInsert'">새 학사일정 등록</button>
							</div>
							</c:if>
						</div>
                    </div>
                </div>
            </div>
            <div class="">
                <div class=" " id="calCard">
                    <div class="card-header d-flex justify-content-between">
                        <div class="d-flex align-items-center">
                            <div class="mr-3" id="nowDate"><h5></h5></div>
                            <div class="mt-1">
                                <a href="#" id="cal-prev" class="text-dark mr-2 font-size-18"><i class="las la-chevron-circle-left m-0"></i></a>
                                <a href="#" id="cal-next" class="text-dark font-size-18"><i class="las la-chevron-circle-right m-0"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
						<div id="calendar" style="height: 640px;"></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-4" style="display: none;">
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
	  <div class="modal fade" id="scheduleUpdateModal" tabindex="-1" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
		  <div class="modal-dialog" role="document">
			  <div class="modal-content">
				  <div class="modal-header">
					  <h5 class="modal-title" id="exampleModalLabel">학사일정 수정</h5>
					  <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnScheduleUpdateModalClose">
						  <span aria-hidden="true">×</span>
					  </button>
				  </div>
				  <div class="modal-body" id="scheduleUpdateModalBody">
				  </div>
				  <div class="modal-footer">
					  <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					  <button type="button" class="btn btn-primary" onclick="scheduleUpdate();">저장</button>
				  </div>
			  </div>
		  </div>
	  </div>
	  <%--<form name="scheduleInsertForm" action="scheduleInsert" method="post">
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
                                      <input type="text" class="form-control" id="exampleInputText03" name="scheduleNo" value="${scheduleInfo.scheduleNo }">
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
          <table border="1">
          <thead>
              <tr>
                  <th>학사일정 번호</th>
                  <th>반ID</th>
                  <th>공지 번호</th>
                  <th>등록자</th>
                  <th>행사항목</th>
                  <th>제목</th>
                  <th>시작일자</th>
                  <th>종료일자</th>
              </tr>
          </thead>
          <tbody>
              <c:forEach items="${scheduleList }" var="list">
                  <tr>
                      <td>${list.scheduleNo }</td>
                      <td>${list.classId }</td>
                      <td>${list.noticeNo }</td>
                      <td>${list.scheduleWriter }</td>
                      <td>${list.scheduleCategory }</td>
                      <td>${list.scheduleTitle }</td>
                      <td><fmt:formatDate value="${list.startDate }" pattern="yyyy년MM월dd일"/></td>
                      <td><fmt:formatDate value="${list.endDate }" pattern="yyyy년MM월dd일"/></td>
                  </tr>
              </c:forEach>
          </tbody>
      </table>
      <button type="button" onclick="location.href='scheduleInsert'">등록</button>--%>
	<script type="text/javascript">
	$('tbody > tr').on('click', function(e){
		if(e.target.tagName != 'TD') return;
					
		let schId = $(e.currentTarget).find('td:nth-of-type(1)').text(); // = td:eq(1) 
		location.href = 'scheduleInfo?scheduleNo=' + schId;
	});
	document.getElementById("nowDate").innerHTML = new Date().getFullYear() + "-" + (new Date().getMonth() + 1);

	function scheduleUpdate() {

		$.ajax({
			url: '/scheduelUpdate',
			type: 'post',
			data: $("#scheduleVO").serialize()
		})
				.done(data => {
					window.cal.updateEvent(data.id, clickCalendarEventCalendarId, data);
					$("#btnScheduleUpdateModalClose").click();
					alert("정상적으로 처리되었습니다.");
					$(".toastui-calendar-event-detail-popup-slot").html("");

				})
				.fail(err => {
				});
	}
	$(function (){
		window.cal.on('clickEvent', ({ event }) => {
			clickCalendarEventCalendarId = event.calendarId;
			selectedEvent = event;
		});
	})
	</script>
   	<script>
   			
   	</script>
	<!-- calendar -->
	<script src="${pageContext.request.contextPath }/assets/vendor/tui-calendar/tui-code-snippet/dist/tui-code-snippet.js"></script>
	
	<script src="${pageContext.request.contextPath }/assets/vendor/tui-calendar/tui-time-picker/dist/tui-time-picker.min.js"></script>
	
	<script src="${pageContext.request.contextPath }/assets/vendor/tui-calendar/tui-date-picker/dist/tui-date-picker.min.js"></script>
	<link rel="stylesheet" href="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.css" />
	<script src="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.js"></script>
<%-- 	<script src="${pageContext.request.contextPath }/assets/vendor/tui-calendar/tui-calendar/dist/tui-calendar.min.js"></script> --%>
	
	<script src="${pageContext.request.contextPath }/assets/js/calendar.js"></script>
</body>
</html>