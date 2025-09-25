<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="iq-sidebar  sidebar-default ">
          <div class="iq-sidebar-logo d-flex align-items-center">
              <a href="${pageContext.request.contextPath }/" class="header-logo">
                  <h3 class="logo-title light-logo">UriBanHaDa</h3>
              </a>
              <div class="iq-menu-bt-sidebar ml-0">
                  <i class="las la-bars wrapper-menu"></i>
              </div>
          </div>
          <div class="data-scrollbar" data-scroll="1">
              <nav class="iq-sidebar-menu">
                  <ul id="iq-sidebar-toggle" class="iq-menu">
   
					<li class="">
                      	<a href="#otherpage" class="collapsed" data-toggle="collapse" aria-expanded="false"> 
                      		<svg class="svg-icon" width="25" height="25" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
								fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
								<path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path>
							</svg> 
							<span class="ml-4">공지게시판</span> 
							<i class="las la-angle-right iq-arrow-right arrow-active"></i> 
							<i class="las la-angle-down iq-arrow-right arrow-hover"></i>
						</a>

						<ul id="otherpage" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
							<li class="">
								<a href="${pageContext.request.contextPath}/noticeList"> 
								<i class="las la-minus"></i><span>우리반게시판</span></a></li>
							<li class="">
								<a href="${pageContext.request.contextPath}/"> 
								<i class="las la-minus"></i><span>학사일정</span></a></li>
							<li class="">
								<a href="${pageContext.request.contextPath}/"> 
								<i class="las la-minus"></i><span>설문조사</span></a></li>
						</ul>
					</li>
                      
                      
                      <li class="">                  
                          <a href="${pageContext.request.contextPath }/scheduleInsert" class="svg-icon">                        

                              <svg class="svg-icon" width="25" height="25" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <polyline points="6 9 6 2 18 2 18 9"></polyline>
                                  <path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"></path>
                                  <rect x="6" y="14" width="12" height="8"></rect>
                              </svg>
                              <span class="ml-4">학사일정</span>
                          </a>
                      </li>
                      <li class="">

                          <a href="${pageContext.request.contextPath }/albumList" class="svg-icon">                        

                              <svg class="svg-icon" width="25" height="25" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path>
                                  <rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect>
                              </svg>
                              <span class="ml-4">학급앨범</span>
                          </a>
                      </li>
                      <li class="">

                          <a href="${pageContext.request.contextPath }/homeworkList" class="svg-icon">                        

                              <svg class="svg-icon" width="25" height="25" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle>
                              </svg>
                              <span class="ml-4">과제</span>
                          </a>
                      </li>
                      <li class="">
                          <a href="${pageContext.request.contextPath}/" class="svg-icon">                        
                              <svg class="svg-icon" width="25" height="25" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path>
                                  <polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline><line x1="12" y1="22.08" x2="12" y2="12"></line>
                              </svg>
                              <span class="ml-4">우리반톡</span>
                          </a>
                      </li>
                      <li class="">
                          <a href="${pageContext.request.contextPath}/" class="svg-icon">                        
                              <svg class="svg-icon" width="25" height="25" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line>
                              </svg>
                              <span class="ml-4">학생관리</span>
                          </a>
                      </li>



				
			</ul>
   
              </nav>
              
          </div>
      </div> 