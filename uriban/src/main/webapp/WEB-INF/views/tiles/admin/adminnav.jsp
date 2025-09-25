<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="iq-sidebar  sidebar-default ">
	<div class="iq-sidebar-logo d-flex align-items-center">
		<a href="${pageContext.request.contextPath }/" class="header-logo">
			<!--  <h3 class="logo-title light-logo">UriBanHaDa</h3> -->
		</a>
		<div class="iq-menu-bt-sidebar ml-0">
			<i class="las la-bars wrapper-menu"></i>
		</div>
	</div>
	<div class="data-scrollbar" data-scroll="1">
		<nav class="iq-sidebar-menu">
			<ul id="iq-sidebar-toggle" class="iq-menu">

				<li class="">
                          <a href="${pageContext.request.contextPath }/admin/adminHome" class="svg-icon">                        
                              <svg class="svg-icon" width="25" height="25" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                  <polyline points="9 22 9 12 15 12 15 22"></polyline>
                              </svg>
                              <span class="ml-4">관리자 홈</span>
                          </a>
                      </li>

				<li class=""><a
					href="${pageContext.request.contextPath}/admin/memberList"
					class="svg-icon"> <svg class="svg-icon" width="25" height="25"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
							fill="none" stroke="currentColor" stroke-width="2"
							stroke-linecap="round" stroke-linejoin="round">
								<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
							<circle cx="12" cy="7" r="4"></circle>
							</svg> <span class="ml-4">회원 관리</span>
				</a></li>


				<li class=""><a
					href="${pageContext.request.contextPath}/admin/rptList"
					class="svg-icon"><svg
							class="svg-icon" width="25" height="25"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
							fill="none" stroke="currentColor" stroke-width="2"
							stroke-linecap="round" stroke-linejoin="round">
                                  <path
								d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path>
                                  <rect x="8" y="2" width="8" height="4"
								rx="1" ry="1"></rect>
                              </svg> <span class="ml-4">신고 관리</span>
				</a></li>
				<li class=""><a
					href="${pageContext.request.contextPath }/admin/banList"
					class="svg-icon"> <svg class="svg-icon" width="25" height="25"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
							fill="none" stroke="currentColor" stroke-width="2"
							stroke-linecap="round" stroke-linejoin="round">
								<path
								d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path>
							</svg> <span class="ml-4">제한 관리</span>
				</a></li>
				<li class=""><a
					href="${pageContext.request.contextPath }/admin/applyList"
					class="svg-icon"> <svg class="svg-icon"  
							width="25" height="25" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                              <path
								d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
							<polyline points="14 2 14 8 20 8"></polyline>
							<line x1="16" y1="13" x2="8" y2="13"></line>
							<line x1="16" y1="17" x2="8" y2="17"></line>
							<polyline points="10 9 9 9 8 9"></polyline>
                                          </svg> <span class="ml-4">교사자격 관리</span>
				</a></li>
				<li class=""><a
					href="${pageContext.request.contextPath }/admin/downHistory"
					class="svg-icon"> <svg class="svg-icon" id="p-dash07"
							width="25" height="25" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                              <path
								d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
							<polyline points="14 2 14 8 20 8"></polyline>
							<line x1="16" y1="13" x2="8" y2="13"></line>
							<line x1="16" y1="17" x2="8" y2="17"></line>
							<polyline points="10 9 9 9 8 9"></polyline>
                                          </svg> <span class="ml-4">앨범다운이력관리
							</span>
				</a></li>	
			</ul>
		</nav>

	</div>
</div>
