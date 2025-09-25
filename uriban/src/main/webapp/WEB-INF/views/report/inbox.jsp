<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
		
		
		
		
	<div class="container-fluid">
		<div class="row">
		
			<div class="col-xl-2 col-lg-4">
				<div class="card">
					<div class="card-header d-flex justify-content-between">
						<div class="header-title">
							<h4 class="card-title">우리반 톡</h4>
						</div>
					</div>
					<div class="card-body">
						<form>
							<div class="form-group">
								<div class="crm-profile-img-edit position-relative">
									<img class="crm-profile-pic rounded avatar-100"
										src="../assets/images/user/11.png" alt="profile-pic">
								</div>
							</div>
							<a href="mailInsert" class="btn btn-primary">톡 보내기</a>
							<a href="mailInsert" class="btn btn-primary">내게 쓰기</a>
							<hr>
							<a href="mailReceiveList" class="btn btn-primary">받은 톡 확인하기</a>
							<hr>
							<a href="mailSendList" class="btn btn-primary">보낸 톡 확인하기</a>
							
						</form>
					</div>
				</div>
			</div>
<div class="col-xl-10 col-lg-8">
	<div class="card">
		<div class="card-header d-flex justify-content-between">
			<div class="header-title">
				<h4 class="card-title">받은 톡 리스트</h4>
			</div>
		</div>
		<div class="card-body">
			<div class="new-user-info">
				<form>
					<div class="row">
						<a href="#" class="btn bg-secondary-light dropMail">삭제</a>
						
						
		                <table class="table mb-0 table-borderless tbl-server-info tble-min-width">
		                	<thead>
		                		<tr>
		                			<th>
		                				<div class="AllDropbox custom-task custom-checkbox custom-control-inline">
                                                  <input type="checkbox" class="custom-control-input" id="customCheck" 
                                                  	name="dropCheckAll" value="selectAll" onclick="selectAllMail(this)">
                                             <label class="custom-control-label" for="customCheck"></label>
                                        	</div>
             			</th>
             			<th align="center">읽음/안읽음</th>
             			<th align="center">보낸사람</th>
             			<th align="center">톡 유형</th>
             			<th align="center">톡 제목</th>
             			<th align="center">받은날</th>
             		</tr>
             	</thead>
             
		<c:forEach items="${mailReceiveList }" var="rl" varStatus="sat">
		
		<input type="hidden" id="mailReNo" name="mailReNo" value="${rl.mailReNo }">
		<input type="hidden" id="readCheck" name="readCheck" value="${rl.readCheck }">
		
                 <tbody>
                     <tr>
                     	<!-- 체크박스 -->
                 	<td class="col-xl-1">
                 		<div class="dropbox custom-task custom-checkbox custom-control-inline">
                                         <input type="checkbox" class="custom-control-input" id="customCheck${sat.count }" 
                                         	name="dropCheck" value="${rl.mailReNo }" onclick="failSelectAllMail()">
                                         <label class="custom-control-label" for="customCheck${sat.count }"></label>
                                    	</div>
                                    </td>
                                    
                         <td align="left">${rl.readCheckName }</td>
                         <!-- 보낸사람 -->
                         <td align="left">${rl.senderName }(${rl.senderId })</td>
                         <!-- 메일타입 -->
                         <td align="left">${rl.mailTypeName }</td>
                         <!-- 메일 제목 -->
                         <td align="left">
                         	<a href="mailReceiveInfo?mailReNo=${rl.mailReNo }&readCheck=${rl.readCheck}">${rl.receiveTitle}</a>
                         </td>
                         <!-- 시간 MM:dd HH:mm -->
                         <td>
                              <p class="mb-0">
                              	<i class="las la-calendar-check mr-2"></i>
                              	<fmt:formatDate value="${rl.receiveDate }" pattern="MM.dd HH:mm" />
				                                 </p>
				                            </td>
				                        </tr>
				                    </tbody>
				                	</c:forEach>
				                </table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


	
	




















	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="email-left-box">
							<a href="email-compose.html" class="btn btn-primary btn-block">Compose</a>
							<div class="mail-list mt-4">
								<a href="email-inbox.html"
									class="list-group-item border-0 text-primary p-r-0"><i
									class="fa fa-inbox font-18 align-middle mr-2"></i> <b>Inbox</b>
									<span class="badge badge-primary badge-sm float-right m-t-5">198</span>
								</a> <a href="#" class="list-group-item border-0 p-r-0"><i
									class="fa fa-paper-plane font-18 align-middle mr-2"></i>Sent</a> <a
									href="#" class="list-group-item border-0 p-r-0"><i
									class="fa fa-star-o font-18 align-middle mr-2"></i>Important <span
									class="badge badge-danger badge-sm float-right m-t-5">47</span>
								</a> <a href="#" class="list-group-item border-0 p-r-0"><i
									class="mdi mdi-file-document-box font-18 align-middle mr-2"></i>Draft</a><a
									href="#" class="list-group-item border-0 p-r-0"><i
									class="fa fa-trash font-18 align-middle mr-2"></i>Trash</a>
							</div>
							<h5 class="mt-5 m-b-10">Categories</h5>
							<div class="list-group mail-list">
								<a href="#" class="list-group-item border-0"><span
									class="fa fa-briefcase f-s-14 mr-2"></span>Work</a> <a href="#"
									class="list-group-item border-0"><span
									class="fa fa-sellsy f-s-14 mr-2"></span>Private</a> <a href="#"
									class="list-group-item border-0"><span
									class="fa fa-ticket f-s-14 mr-2"></span>Support</a> <a href="#"
									class="list-group-item border-0"><span
									class="fa fa-tags f-s-14 mr-2"></span>Social</a>
							</div>
						</div>
						<div class="email-right-box">
							<div role="toolbar" class="toolbar">
								<div class="btn-group">
									<button aria-expanded="false" data-toggle="dropdown"
										class="btn btn-dark dropdown-toggle" type="button">
										More <span class="caret m-l-5"></span>
									</button>
									<div class="dropdown-menu">
										<span class="dropdown-header">More Option :</span> <a
											href="javascript: void(0);" class="dropdown-item">Mark as
											Unread</a> <a href="javascript: void(0);" class="dropdown-item">Add
											to Tasks</a> <a href="javascript: void(0);" class="dropdown-item">Add
											Star</a> <a href="javascript: void(0);" class="dropdown-item">Mute</a>
									</div>
								</div>
							</div>
							<div class="email-list m-t-15">
								<div class="message">
									<a href="email-read.html">
										<div class="col-mail col-mail-1">
											<div class="email-checkbox">
												<input type="checkbox" id="chk2"> <label
													class="toggle" for="chk2"></label>
											</div>
											<span class="star-toggle ti-star"></span>
										</div>
										<div class="col-mail col-mail-2">
											<div class="subject">Ingredia Nutrisha, A collection of
												textile samples lay spread out on the table - Samsa was a
												travelling salesman - and above it there hung a picture</div>
											<div class="date">11:49 am</div>
										</div>
									</a>
								</div>
								<div class="message">
									<a href="email-read.html">
										<div class="col-mail col-mail-1">
											<div class="email-checkbox">
												<input type="checkbox" id="chk3"> <label
													class="toggle" for="chk3"></label>
											</div>
											<span class="star-toggle ti-star"></span>
										</div>
										<div class="col-mail col-mail-2">
											<div class="subject">Almost unorthographic life One day
												however a small line of blind text by the name of Lorem
												Ipsum decided to leave for the far World of Grammar.</div>
											<div class="date">11:49 am</div>
										</div>
									</a>
								</div>
								
								<div class="message unread">
									<a href="email-read.html">
										<div class="col-mail col-mail-1">
											<div class="email-checkbox">
												<input type="checkbox" id="chk20"> <label
													class="toggle" for="chk20"></label>
											</div>
											<span class="star-toggle ti-star"></span>
										</div>
										<div class="col-mail col-mail-2">
											<div class="subject">Pointing has no control about the
												blind texts it is an almost unorthographic life One day
												however a small line of blind text by the name of</div>
											<div class="date">11:49 am</div>
										</div>
									</a>
								</div>
								<div class="message">
									<a href="email-read.html">
										<div class="col-mail col-mail-1">
											<div class="email-checkbox">
												<input type="checkbox" id="chk21"> <label
													class="toggle" for="chk21"></label>
											</div>
											<span class="star-toggle ti-star"></span>
										</div>
										<div class="col-mail col-mail-2">
											<div class="subject">Even the all-powerful Pointing has
												no control about the blind texts it is an almost
												unorthographic life One day however a small line of blind
												text by the name of</div>
											<div class="date">11:49 am</div>
										</div>
									</a>
								</div>
							</div>
							<!-- panel -->
							<div class="row">
								<div class="col-7">
									<div class="text-left">1 - 20 of 568</div>
								</div>
								<div class="col-5">
									<div class="btn-group float-right">
										<button class="btn btn-gradient" type="button">
											<i class="fa fa-angle-left"></i>
										</button>
										<button class="btn btn-dark" type="button">
											<i class="fa fa-angle-right"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>