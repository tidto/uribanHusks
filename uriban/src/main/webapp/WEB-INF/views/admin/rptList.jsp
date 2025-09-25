<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

.cttNo {
	display: none;
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
				<div class="card">
					<div class="card-body">
						<h4>신고 관리</h4>
					</div>
				</div>
				<div class="card p-2">
					<div class="card-header d-flex justify-content-between">
						<div class="header-title">
							<h5>신고 내역</h5>
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
									<table id="rptList1" class="table data-table">
										<thead>
											<tr class="ligth">
												<th scope="col">신고번호</th>
												<th scope="col">게시글항목</th>
												<th scope="col">내용</th>
												<th scope="col">작성자</th>
												<th scope="col">신고사유</th>
												<th scope="col">신고자</th>
												<th scope="col">신고일자</th>
												<th scope="col">신고상태</th>
												<th scope="col">제한일자</th>
												<th scope="col">제한</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${rptList}" var="rpt">
												<c:if test="${rpt.reportState eq '대기'}">
													<tr>
														<td>${rpt.reportNo}</td>
														<td>${rpt.contentsType}<span class="cttNo">${rpt.contentsNo}</span></td>
														<td>${rpt.content}</td>
														<td>${rpt.memberId}</td>
														<td>${rpt.reportType}</td>
														<td>${rpt.reporterId}</td>
														<td><fmt:formatDate value="${rpt.reportDate}"
																pattern="yyyy-MM-dd" /></td>
														<td>${rpt.reportState}</td>
														<td><div class="form-group mb-0">
																<select class="form-control-sm" name="banDay">
																	<option value="" selected="selected">제한 일자</option>
																	<option value="7">7일 제한</option>
																	<option value="14">14일 제한</option>
																	<option value="30">30일 제한</option>
																	<option value="9999">영구 제한</option>
																</select>
															</div></td>
														<td><button type="button"
																class="btn btn-outline-primary"
																onclick="rptUpdate('A603')">반려</button>
															<button type="button" class="btn btn-primary"
																onclick="rptUpdate('A602')">승인</button></td>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="tab-pane fade" id="profile" role="tabpanel"
									aria-labelledby="profile-tab">
									<table id="rptList2" class="table data-table table-striped">
										<thead>
											<tr class="ligth">
												<th scope="col">신고번호</th>
												<th scope="col">게시글항목</th>
												<th scope="col">내용</th>
												<th scope="col">작성자</th>
												<th scope="col">신고사유</th>
												<th scope="col">신고자</th>
												<th scope="col">신고일자</th>
												<th scope="col">신고상태</th>
											</tr>
										</thead>
										<tbody id="conf">
											<c:forEach items="${rptList}" var="rpt">
												<c:if test="${rpt.reportState eq '승인'}">
													<tr>
														<td>${rpt.reportNo}</td>
														<td>${rpt.contentsType}<span class="cttNo">${rpt.contentsNo}</span></td>
														<td>${rpt.content}</td>
														<td>${rpt.memberId}</td>
														<td>${rpt.reportType}</td>
														<td>${rpt.reporterId}</td>
														<td><fmt:formatDate value="${rpt.reportDate}"
																pattern="yyyy-MM-dd" /></td>
														<td>${rpt.reportState}</td>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="tab-pane fade" id="contact" role="tabpanel"
									aria-labelledby="contact-tab">
									<table id="rptList3" class="table data-table table-striped">
										<thead>
											<tr class="ligth">
												<th scope="col">신고번호</th>
												<th scope="col">게시글항목</th>
												<th scope="col">내용</th>
												<th scope="col">작성자</th>
												<th scope="col">신고사유</th>
												<th scope="col">신고자</th>
												<th scope="col">신고일자</th>
												<th scope="col">신고상태</th>
											</tr>
										</thead>
										<tbody id="rejt">
											<c:forEach items="${rptList}" var="rpt">
												<c:if test="${rpt.reportState eq '반려'}">
													<tr>
														<td>${rpt.reportNo}</td>
														<td>${rpt.contentsType}<span class="cttNo">${rpt.contentsNo}</span></td>
														<td>${rpt.content}</td>
														<td>${rpt.memberId}</td>
														<td>${rpt.reportType}</td>
														<td>${rpt.reporterId}</td>
														<td><fmt:formatDate value="${rpt.reportDate}"
																pattern="yyyy-MM-dd" /></td>
														<td>${rpt.reportState}</td>
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
		  $('#rptList1').DataTable({
			    "order": [[ 0, "desc" ]],
			    ordering: true,
			    destroy : true
			  });
		  $('#rptList2').DataTable({
			    "order": [[ 0, "desc" ]],
			    ordering: true,
			    destroy : true
			  }); 
		  $('#rptList3').DataTable({
			    "order": [[ 0, "desc" ]],
			    ordering: true,
			    destroy : true
			  }); 
		});
		
		// 
		function rptUpdate(state) {
		 	let tr=$(event.target).parent().parent();
			let reportNo = tr.find('td:eq(0)').text();
		 	let rptStat = tr.find('td:eq(7)');
		 	var banDay = tr.find('td:eq(8)').find('option:selected').val();
		 	let memberId = tr.find('td:eq(3)').text();
		 	let cttType = tr.find('td:eq(1)').text();
		 	let cttNo = tr.find('.cttNo').text();
		 	let banType;
		 	
			if(state=='A602'&& banDay == ''){
				$('.err').text('제한기간을 선택하세요.');
				$('#err').show();
				return false;
			}
		 	
			if(cttType.startsWith('댓')){
				cttType='A301';
				banType='A401';
			}else{
				banType='A402';
				cttType='A302';
			}
		 	
			var obj = {};
			
			obj["reportNo"] = Number(reportNo);
			obj["reportState"] = state;
			obj["banDay"] = banDay;
			obj["memberId"] = memberId;
			obj["banType"] = banType;
			obj["contentsType"] = cttType;
			obj["contentsNo"] = Number(cttNo);
			
			$.ajax({
				url:'${pageContext.request.contextPath }/report/reportUpdate',
				type:'post', 
				contentType:'application/json',
				data: JSON.stringify(obj)
			})
			.done(data=>{
				let stat;
				let tbody;
				if(state=='A602'){
					stat='승인';
					tbody=$("#conf");
				}else{
					stat='반려';
					tbody=$("#rejt");
				}
				if(data=='success'){
					$('.done').text('정상적으로 처리되었습니다.');
					tbody.find('.dataTables_empty').remove();
					rptStat.text(stat);
					tr.find('td:eq(8)').remove();
					tr.find('td:eq(8)').remove();
					tbody.prepend(tr);
					$('#done').show();
				}else{
					$('.err').text('정상적으로 처리되지 않았습니다.');
					$('#err').show();	
				}
			})
			.fail(err=>{
				$('.err').text('정상적으로 처리되지 않았습니다.');
				$('#err').show();
			});
		}
	</script>

</body>
</html>