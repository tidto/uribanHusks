<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal" var="p" />

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
                          <a href="${pageContext.request.contextPath }/myClass/myClassHome?classId=${myClass.classId}" class="svg-icon">                        
                              <svg class="svg-icon" width="25" height="25" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                  <polyline points="9 22 9 12 15 12 15 22"></polyline>
                              </svg>
                              <span class="ml-4">우리반 홈</span>
                          </a>
                      </li>
				<li class=""><a href="#otherpage" class="collapsed"
					data-toggle="collapse" aria-expanded="false"> <svg
							class="svg-icon" width="25" height="25"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
							fill="none" stroke="currentColor" stroke-width="2"
							stroke-linecap="round" stroke-linejoin="round">
                                  <path
								d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path>
                                  <rect x="8" y="2" width="8" height="4"
								rx="1" ry="1"></rect>
                              </svg> <span class="ml-4">우리반 공지</span> <i
						class="las la-angle-right iq-arrow-right arrow-active"></i> <i
						class="las la-angle-down iq-arrow-right arrow-hover"></i>
				</a>

					<ul id="otherpage" class="iq-submenu collapse"
						data-parent="#iq-sidebar-toggle">
						<li class="">
							<a href="${pageContext.request.contextPath}/notice/noticeF402List"> 
							<i class="las la-minus"></i><span>알림장</span></a></li>
						<li class="">
							<a href="${pageContext.request.contextPath}/notice/noticeF401List">
							<i class="las la-minus"></i><span>가정통신문</span></a></li>
						<c:if test="${p.authority eq 'ROLE_A102'}">
							<li class="">
								<a href="${pageContext.request.contextPath}/notice/templateList?memberId=${p.memberId }"> 
								<i class="las la-minus"></i><span>나의 템플릿</span></a></li>
						</c:if>
						
						
					</ul></li>


				<li class=""><a
					href="${pageContext.request.contextPath }/album/albumList"
					class="svg-icon"> <svg class="svg-icon" width="25" height="25"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
							fill="none" stroke="currentColor" stroke-width="2"
							stroke-linecap="round" stroke-linejoin="round">
								<path
								d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path>
							</svg> <span class="ml-4">학급앨범</span>
				</a></li>
				<li class=""><a href="#testPage" class="collapsed"
					data-toggle="collapse" aria-expanded="false"> <svg
							class="svg-icon" id="p-dash07" width="25" height="25"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
							fill="none" stroke="currentColor" stroke-width="2"
							stroke-linecap="round" stroke-linejoin="round">
                                              <path
								d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
							<polyline points="14 2 14 8 20 8"></polyline>
							<line x1="16" y1="13" x2="8" y2="13"></line>
							<line x1="16" y1="17" x2="8" y2="17"></line>
							<polyline points="10 9 9 9 8 9"></polyline>
                                          </svg> <span class="ml-4">과제</span>
						<i class="las la-angle-right iq-arrow-right arrow-active"></i> <i
						class="las la-angle-down iq-arrow-right arrow-hover"></i>
				</a>

					<ul id="testPage" class="iq-submenu collapse"
						data-parent="#iq-sidebar-toggle">
						<c:choose>
							<c:when test="${p.authority eq 'ROLE_A102'}">
								<li class=""><a
									href="${pageContext.request.contextPath}/homework/homeworkList">
										<i class="las la-minus"></i><span>과제목록</span>
								</a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/testBank/testBankList">
										<i class="las la-minus"></i><span>문제은행</span>
								</a></li>
							</c:when>
							<c:when test="${p.authority eq 'ROLE_A104'}">
								<li class=""><a
									href="${pageContext.request.contextPath}/test/testList"> <i
										class="las la-minus"></i><span>과제목록</span></a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/test/testList?td=td">
										<i class="las la-minus"></i><span>오늘의과제</span>
								</a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/test/wrongnote"> <i
										class="las la-minus"></i><span>오답노트</span></a></li>
							</c:when>
							<c:when test="${p.authority eq 'ROLE_A101'}">
								<li class=""><a
									href="${pageContext.request.contextPath}/homework/homeworkList">
										<i class="las la-minus"></i><span>과제목록(교사)</span>
								</a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/testBank/testBankList">
										<i class="las la-minus"></i><span>문제은행(교사)</span>
								</a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/test/testList"> <i
										class="las la-minus"></i><span>과제목록(학생)</span></a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/test/testList?td=td">
										<i class="las la-minus"></i><span>오늘의과제(학생)</span>
								</a></li>
								<li class=""><a
									href="${pageContext.request.contextPath}/test/wrongnote"> <i
										class="las la-minus"></i><span>오답노트(학생)</span></a></li>
							</c:when>
							<c:otherwise>
								
							</c:otherwise>
						</c:choose>
					</ul></li>
				<li class=""><a
					href="${pageContext.request.contextPath}/mail/mailReceiveList?mailReceiver=${p.memberId }"
					class="svg-icon"> <svg xmlns="http://www.w3.org/2000/svg"
							width="25" height="25" viewBox="0 0 24 24" fill="none"
							stroke="currentColor" stroke-width="2" stroke-linecap="round"
							stroke-linejoin="round"> 
                                          <path
								d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z">
                                          </path>
                                          <polyline
								points="22,6 12,13 2,6"></polyline>
                                      </svg> <span class="ml-4">우리반톡</span>
				</a></li>


				<c:if test="${p.authority eq 'ROLE_A102' || p.authority eq 'ROLE_A103' }">
					<li class=""><a href="#memberpage" class="collapsed"
						data-toggle="collapse" aria-expanded="false"> <svg
								class="svg-icon" width="25" height="25"
								xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
								fill="none" stroke="currentColor" stroke-width="2"
								stroke-linecap="round" stroke-linejoin="round">
									<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
								<circle cx="12" cy="7" r="4"></circle>
								</svg> <span class="ml-4">학급관리</span> <i
							class="las la-angle-right iq-arrow-right arrow-active"></i> <i
							class="las la-angle-down iq-arrow-right arrow-hover"></i>
					</a>
	
						<ul id="memberpage" class="iq-submenu collapse"
							data-parent="#iq-sidebar-toggle">
							<li class=""><a
								href="${pageContext.request.contextPath}/student/studentList?classId=${myClass.classId}">
									<i class="las la-minus"></i><span>학생관리</span>
							</a></li>
							<li class=""><a
								href="${pageContext.request.contextPath}/diary/diaryStudentList"> <i
									class="las la-minus"></i><span>학생 일지 관리</span></a></li>
							<li class=""><a
								href="${pageContext.request.contextPath}/parents/parentsList"> <i
									class="las la-minus"></i><span>학부모관리</span>
							</a></li>
						</ul></li>
				</c:if>
				<!-- commit -->

				<li class=""><a
					href="${pageContext.request.contextPath}/survey/surveyList"
					class="svg-icon"> <svg xmlns="http://www.w3.org/2000/svg"
							width="25" height="25" viewBox="0 0 24 24" fill="none"
							stroke="currentColor" stroke-width="2" stroke-linecap="round"
							stroke-linejoin="round"> 
                    <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z">
                     </path>
                   	<polyline
					points="22,6 12,13 2,6"></polyline>
                                 </svg> <span class="ml-4">설문조사</span>
				</a></li>
					
			</ul>
		</nav>

	</div>
</div>
