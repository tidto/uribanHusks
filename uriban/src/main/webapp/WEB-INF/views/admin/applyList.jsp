<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.11.338/pdf.min.js"></script>
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

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="p" />
	</sec:authorize>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<div class="card ">
					<div class="card-body">
						<h4>교원자격 신청관리</h4>
					</div>
				</div>
				<div class="card p-2">
					<div class="card-header d-flex justify-content-between">
						<div class="header-title">
							<h5>교원자격 신청내역</h5>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<ul class="nav nav-tabs" id="myTab-1" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="wait-tab" data-toggle="tab" href="#wait" role="tab"
									aria-controls="home" aria-selected="true">대기중</a></li>
								<li class="nav-item"><a class="nav-link" id="profile-tab"
									data-toggle="tab" href="#profile" role="tab"
									aria-controls="profile" aria-selected="false">승인</a></li>
								<li class="nav-item"><a class="nav-link" id="contact-tab"
									data-toggle="tab" href="#contact" role="tab"
									aria-controls="contact" aria-selected="false">반려</a></li>
							</ul>
							<div class="tab-content" id="myTabContent-2">
								<div class="tab-pane fade show active" id="wait" role="tabpanel"
									aria-labelledby="wait-tab">
									<table id="certList1" class="table data-table table-striped">
										<thead>
											<tr class="ligth">
												<th scope="col">신청번호</th>
												<th scope="col">아이디</th>
												<th scope="col">이름</th>
												<th scope="col">자격사본</th>
												<th scope="col">신청일자</th>
												<th scope="col">신청상태</th>
												<th scope="col">반려사유</th>
												<th scope="col">승인</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${applyList}" var="app" varStatus="status">
												<c:if test="${app.certStat eq '대기'}">
													<tr>
														<td>${app.certNo}</td>
														<td>${app.memberId}</td>
														<td>${app.memberName}</td>
														<td><a href="#" data-toggle="modal"
															data-target="#exampleModalLong${status.count}"
															data-pdf="${pageContext.request.contextPath}/cert/${app.savefileName}">${app.originalfileName}</a>
															<!-- Modal -->
															<div class="modal fade pdfmodal"
																id="exampleModalLong${status.count}" tabindex="-1"
																role="dialog" aria-labelledby="exampleModalLongTitle"
																aria-hidden="true">
																<div class="modal-dialog modal-lg" role="document">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title" id="exampleModalLongTitle">자격사본</h5>
																			<button type="button" class="close"
																				data-dismiss="modal" aria-label="Close">
																				<span aria-hidden="true">&times;</span>
																			</button>
																		</div>
																		<div class="modal-body">
																			<div id="pdfContainer${status.count}">
																				<!--pdf파일이 아니면 이미지로 표시 -->
																				<c:if
																					test="${not fn:endsWith(app.originalfileName, 'pdf')}">
																					<img alt=""
																						src="${pageContext.request.contextPath}/cert/${app.savefileName}"
																						style="width: 100%">
																				</c:if>
																			</div>
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary"
																				data-dismiss="modal">닫기</button>
																		</div>
																	</div>
																</div>
															</div></td>
														<td><fmt:formatDate value="${app.updateDate}"
																pattern="yyyy-MM-dd" /></td>
														<td>${app.certStat}</td>
														<td><input type="text" name="cmt"></td>
														<td><button type="button"
																class="btn btn-outline-primary"
																onclick="certUpdate('A703')">반려</button>
															<button type="button" class="btn btn-primary"
																onclick="certUpdate('A702')">승인</button></td>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="tab-pane fade" id="profile" role="tabpanel"
									aria-labelledby="profile-tab">
									<table id="certList2" class="table data-table table-striped">
										<thead>
											<tr class="ligth">
												<th scope="col">신청번호</th>
												<th scope="col">아이디</th>
												<th scope="col">이름</th>
												<th scope="col">자격사본</th>
												<th scope="col">승인일자</th>
												<th scope="col">신청상태</th>
											</tr>
										</thead>
										<tbody id="conf">
											<c:forEach items="${applyList}" var="app" varStatus="status">
												<c:if test="${app.certStat eq '승인'}">
													<tr>
														<td>${app.certNo}</td>
														<td>${app.memberId}</td>
														<td>${app.memberName}</td>
														<td><a href="#" data-toggle="modal"
															data-target="#exampleModalLong${status.count}"
															data-pdf="${pageContext.request.contextPath}/cert/${app.savefileName}">${app.originalfileName}</a>
															<!-- Modal -->
															<div class="modal fade pdfmodal"
																id="exampleModalLong${status.count}" tabindex="-1"
																role="dialog" aria-labelledby="exampleModalLongTitle"
																aria-hidden="true">
																<div class="modal-dialog modal-lg" role="document">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title" id="exampleModalLongTitle">자격사본</h5>
																			<button type="button" class="close"
																				data-dismiss="modal" aria-label="Close">
																				<span aria-hidden="true">&times;</span>
																			</button>
																		</div>
																		<div class="modal-body">
																			<div id="pdfContainer${status.count}">
																				<!--pdf파일이 아니면 이미지로 표시 -->
																				<c:if
																					test="${not fn:endsWith(app.originalfileName, 'png')}">
																					<img alt=""
																						src="${pageContext.request.contextPath}/cert/${app.savefileName}"
																						style="width: 100%">
																				</c:if>
																			</div>
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary"
																				data-dismiss="modal">닫기</button>
																		</div>
																	</div>
																</div>
															</div></td>
														<td><fmt:formatDate value="${app.updateDate}"
																pattern="yyyy-MM-dd" /></td>
														<td>${app.certStat}</td>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="tab-pane fade" id="contact" role="tabpanel"
									aria-labelledby="contact-tab">
									<table id="certList3" class="table data-table table-striped">
										<thead>
											<tr class="ligth">
												<th scope="col">신청번호</th>
												<th scope="col">아이디</th>
												<th scope="col">이름</th>
												<th scope="col">자격사본</th>
												<th scope="col">반려일자</th>
												<th scope="col">신청상태</th>
												<th scope="col">반려사유</th>
											</tr>
										</thead>
										<tbody id="rejt">
											<c:forEach items="${applyList}" var="app" varStatus="status">
												<c:if test="${app.certStat eq '반려'}">
													<tr>
														<td>${app.certNo}</td>
														<td>${app.memberId}</td>
														<td>${app.memberName}</td>
														<td><a href="#" data-toggle="modal"
															data-target="#exampleModalLong${status.count}"
															data-pdf="${pageContext.request.contextPath}/cert/${app.savefileName}">${app.originalfileName}</a>
															<!-- Modal -->
															<div class="modal fade pdfmodal"
																id="exampleModalLong${status.count}" tabindex="-1"
																role="dialog" aria-labelledby="exampleModalLongTitle"
																aria-hidden="true">
																<div class="modal-dialog modal-lg" role="document">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title" id="exampleModalLongTitle">자격사본</h5>
																			<button type="button" class="close"
																				data-dismiss="modal" aria-label="Close">
																				<span aria-hidden="true">&times;</span>
																			</button>
																		</div>
																		<div class="modal-body">
																			<div id="pdfContainer${status.count}">
																				<!--pdf파일이 아니면 이미지로 표시 -->
																				<c:if
																					test="${not fn:endsWith(app.originalfileName, 'pdf')}">
																					<img alt=""
																						src="${pageContext.request.contextPath}/cert/${app.savefileName}"
																						style="width: 100%">
																				</c:if>
																			</div>
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary"
																				data-dismiss="modal">닫기</button>
																		</div>
																	</div>
																</div>
															</div></td>
														<td><fmt:formatDate value="${app.updateDate}"
																pattern="yyyy-MM-dd" /></td>
														<td>${app.certStat}</td>
														<td>${app.cmt}</td>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="alert text-white bg-info layer" id="done" role="alert">
		<div class="iq-alert-text">
			<span class="done"></span>
			<button type="button" class="close close1">
				<i class="ri-close-line"></i>
			</button>
		</div>
	</div>
	<div class="alert text-white bg-danger layer " id="err" role="alert">
		<div class="iq-alert-text">
			<span class="err"></span>
		<button type="button" class="close close1">
			<i class="ri-close-line"></i>
		</button>
		</div>
	</div>
	<script type="text/javascript">
		$('.close1').on('click', function() {
			$('.layer').hide();
		})
		
		$(document).ready(function () {
		  $('#certList1').DataTable({
			    "order": [[ 4, "desc" ]],
			    ordering: true,
			    destroy : true
			  });
		  $('#certList2').DataTable({
			    "order": [[ 4, "desc" ]],
			    ordering: true,
			    destroy : true
			  }); 
		  $('#certList3').DataTable({
			    "order": [[ 4, "desc" ]],
			    ordering: true,
			    destroy : true
			  }); 
		});
		
		// 교원 자격 수정
		function certUpdate(state) {
		 	let tr=$(event.target).parent().parent();
		 	let memberId = tr.find('td:eq(1)').text();
		 	let certSt = tr.find('td:eq(5)');
		 	let cmtDiv = tr.find('input[type="text"]');
		 	let cmt = cmtDiv.val();
		 	
		 	
		 	if (state === 'A703' && (cmt === ''||cmt == null)) {
		 	    $('.err').text('반려사유를 입력하세요.');
		 	    $('#err').show();
		 	    return false;
		 	}
		 	
			var obj = {};
			
			obj["memberId"] = memberId;
			obj["cmt"] = cmt;
			obj["certStat"] = state;
			
			$.ajax({
				url:'certUpdate',
				type:'post', 
				contentType:'application/json',
				data: JSON.stringify(obj)
			})
			.done(data=>{
				let stat;
				let tbody;
				
				tr.find('td:eq(7)').remove();
				if(state=='A702'){
					stat='승인';
					tbody=$("#conf");
					tr.find('td:eq(6)').remove();
				}else{
					stat='반려';
					tbody=$("#rejt");
					cmtDiv.remove();
					tr.find('td:eq(6)').text(cmt);
				}
				tbody.find('.dataTables_empty').remove();
				$('.done').text('정상적으로 처리되었습니다.');
				certSt.text(stat);
				tbody.prepend(tr);
				$('#done').show();
			})
			.fail(err=>{
				$('.err').text('정상적으로 처리되지 않았습니다.');
				$('#err').show();		
			});
		}
		
		// pdf 파일 불러오기
		let pdfcon;
		$('.pdfmodal').on('show.bs.modal', function (event) {
			$('canvas').remove();
	        const link = $(event.relatedTarget);
	        const pdfUrl = link.data('pdf');
	        
	        pdfcon = $(event.relatedTarget).data('target');
	        // 파일 확장자 확인
	        if (link.text().slice(-4).toLowerCase() === '.pdf') {
	        	
	            loadPDF(pdfUrl);
	        }
	    });
		
	    function loadPDF(pdfUrl) {
	        // PDF.js 초기화
	        pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.11.338/pdf.worker.min.js';

	        const pdfContainer = $(pdfcon).find('div[id^="pdfContainer"]');

	        // PDF 파일 로드
	        pdfjsLib.getDocument(pdfUrl).promise.then(pdf => {
	            pdf.getPage(1).then(page => {
	                const scale = 1; // PDF 확대/축소 비율
	                const modalWidth = pdfContainer.width(); // 모달 창의 넓이
	                const viewport = page.getViewport({ scale, width: modalWidth }); // width를 추가하여 캔버스의 넓이 설정

	                // PDF를 표시할 캔버스 요소 생성
	                const canvas = $('<canvas>').css({
						display: 'block',
						margin: '0 auto',
					});
	                const context = canvas[0].getContext('2d');
	                canvas[0].height = viewport.height;
	                canvas[0].width = viewport.width;
	                pdfContainer.append(canvas);

	                // 렌더링 설정
	                const renderContext = {
	                    canvasContext: context,
	                    viewport: viewport,
	                };

	                // 페이지 렌더링
	                page.render(renderContext);
	            });
	        });
	    }
	</script>
</body>
</html>