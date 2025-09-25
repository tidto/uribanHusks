<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<style>
.swiper {
  width: 100%;
  height: 400px;
}
:root {
    --swiper-theme-color: #5fcf80 !important;
}
</style>
</head>
<body>
<sec:authentication property="principal" var="p" />

	<div class="container-fluid">
		<div class="row">  
		<div class="col-xl-12">
			<div class="card">
				<div class="card-body">
					<h4><span>${myClass.schoolName}</span> <span>${myClass.grade}학년</span> <span>${myClass.classes}반</span></h4>
					<h5 class="mt-2">우리반 급훈</h5>
				</div>
			</div>
			<!-- Album -->
			<c:if test="${not empty images}">
			<div class="card p-2">
				<div class="card-header d-flex justify-content-between">
					<div class="header-title">
						<h5>학급앨범</h5>
					</div>
                    <div>
                       <button class="btn btn-link mt-2" onclick="location.href='${pageContext.request.contextPath }/album/albumList'">
		                 <svg class="svg-icon" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
		                     <path d="M5 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm14 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-7 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"></path>
		                 </svg>
	                 </button>
                    </div>
                 </div>
				<div class="card-body">	
					<!-- Slider main container -->
					<div class="swiper">
					  <!-- Additional required wrapper -->
					  <div class="swiper-wrapper">
					    <!-- Slides -->
					    <c:forEach var="img" items="${images }">
							<div class="swiper-slide">
								<img src="${pageContext.request.contextPath }/albumImg/${img.renameFilename}" class="d-block w-100"
										style="height:400px;" alt="#">
							</div>
						</c:forEach>
					  </div>
					  <!-- If we need pagination -->
					  <div class="swiper-pagination"></div>
					
					  <!-- If we need navigation buttons -->
					  <div class="swiper-button-prev"></div>
					  <div class="swiper-button-next"></div>
					
					  <!-- If we need scrollbar -->
					  <div class="swiper-scrollbar"></div>
					</div>
				</div>
			</div>
			</c:if>
		
			 <!-- Notice -->
			<div class="card p-2">
			  <div class="card-header d-flex justify-content-between">
			  	 <div class="header-title">
					<h5>공지사항</h5>
				</div>
                    <div class="header-title">
                       <button class="btn btn-link mt-2" onclick="location.href='${pageContext.request.contextPath}/notice/noticeF401List'">
		                 <svg class="svg-icon" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
		                     <path d="M5 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm14 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-7 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"></path>
		                 </svg>
	                 </button>
                    </div>
                 </div>	
                 <div class="card-body">
			  			<div class="card-header d-flex justify-content-between pb-0">
                 			<h6>가정통신문</h6>
                 		</div>
                 		<div class="card-body">
                 			<c:forEach items="${noticeList }" var="nl" > 
								<div class="d-flex align-items-center justify-content-between border-bottom">
									<div class="col-8 text-truncate">
										<h6 class="mb-2">${nl.noticeTitle }</h6>
									</div>	
									<div><fmt:formatDate value="${nl.noticeDate }" pattern="yyyy-MM-dd HH:mm:ss"/></div>
								</div>
							</c:forEach>
							<c:if test="${fn:length(noticeList) == 0}">
								<h6>작성된 가정통신문이 없습니다.</h6>
							</c:if>
                 		</div>
  
			  			<div class="card-header d-flex justify-content-between pb-0">
                 			<h6>알림장</h6>
                 		</div>
                 		<div class="card-body">
                 			<c:forEach items="${noticeList2 }" var="nl" > 
								<div class="d-flex align-items-center justify-content-between">
									<div class="col-8 text-truncate">
										<h6 class="mb-2">${nl.noticeContent }</h6>
									</div>	
									<div><fmt:formatDate value="${nl.noticeDate }" pattern="yyyy-MM-dd HH:mm:ss"/></div>
								</div>
							</c:forEach>
							<c:if test="${fn:length(noticeList2) == 0 }">
								<h6>작성된 알림장이 없습니다.</h6>
							</c:if>
                 		</div>
                 </div>
              </div>
              
              <!-- Survey -->
              <div class="card p-2">
			  <div class="card-header d-flex justify-content-between">
			  	 <div class="header-title">
					<h5>설문조사 리스트</h5>
				</div>
                    <div class="header-title">
                       <button class="btn btn-link mt-2" onclick="location.href='${pageContext.request.contextPath}/survey/surveyList'">
		                 <svg class="svg-icon" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
		                     <path d="M5 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm14 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-7 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"></path>
		                 </svg>
	                 </button>
                    </div>
                 </div>	
                 <div class="card-body">
					<table class="table table-bordered table-responsive-md text-center">
						<thead>
							<tr>
								<th scope="col">대상자</th>
								<th scope="col">설문명</th>
								<th scope="col">설문시작일</th>
								<th scope="col">설문종료일</th>
								<th scope="col">설문상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${surveyList }" var="list">
									<tr>
										<td>${list.accountType }</td>
										<td>${list.survTitle }</td>
										<td><fmt:formatDate value="${list.startDate }" pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${list.endDate }" pattern="yyyy-MM-dd" /></td>
										<c:choose>
											<c:when test="${list.survStatus eq '미진행'}">
												<td id="state"><span class="badge border border-secondary text-secondary">미진행</span></td>
											</c:when>
											<c:when test="${list.survStatus eq '진행'}">
												<td id="state"><span class="badge border border-info text-info">진행</span></td>
											</c:when>
											<c:otherwise>
												<td id="state"><span class="badge border border-danger text-danger">마감</span></td>
											</c:otherwise>
										</c:choose>														
									</tr>
							</c:forEach>
							<c:if test="${fn:length(surveyList) == 0 }">
								<td colspan="5"><h6>작성된 설문조사가 없습니다.</h6></td>
							</c:if>
						</tbody>
					</table>
                 </div>
              </div>
              
			</div>
		
		<div class="col-xl-12">
			<!-- Homework -->
			<div class="card p-2">
				<div class="card-header d-flex justify-content-between">
			  	 <div class="header-title">
					<h5>과제목록</h5>
				</div>
				<c:if test="${p.authority eq 'ROLE_A102' }">
                    <div class="header-title">
                       <button class="btn btn-link mt-2" onclick="location.href='${pageContext.request.contextPath}/homework/homeworkList'">
		                 <svg class="svg-icon" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
		                     <path d="M5 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm14 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-7 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"></path>
		                 </svg>
	                 </button>
                    </div>
                  </c:if>
                  <c:if test="${p.authority eq 'ROLE_A104' }">
                    <div class="header-title">
                       <button class="btn btn-link mt-2" onclick="location.href='${pageContext.request.contextPath}/test/testList'">
		                 <svg class="svg-icon" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
		                     <path d="M5 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm14 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-7 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"></path>
		                 </svg>
	                 </button>
                    </div>
                  </c:if>
                   </div>
				<table class="table table-bordered table-responsive-md text-center">
					<thead>
						<tr>
							<th>제목</th>
							<th>등록일</th>
							<th>마감일</th>
							<th>과제상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pageList}" var="list">
							<tr>
								<td>${list.homeworkTitle}</td>
								<td><fmt:formatDate value="${list.homeworkRdate}"
										pattern="yyyy월 MM월 dd일" /></td>
								<td><fmt:formatDate value="${list.homeworkDdate}"
										pattern="yyyy월 MM월 dd일" /></td>
								<c:choose>
									<c:when test="${list.homeworkDdate < list.today}">
										<td id="state"><span class="badge border border-danger text-danger">마감</span></td>
									</c:when>
									<c:when test="${list.submitCount eq '0'}">
										<td id="state"><span class="badge border border-secondary text-secondary">미진행</span></td>
									</c:when>
									<c:when test="${list.submitCount eq list.allStudent}">
										<td id="state"><span class="badge border border-danger text-danger">마감</span></td>
									</c:when>
									<c:otherwise>
										<td id="state"><span class="badge border border-info text-info">진행</span></td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
						<c:if test="${fn:length(pageList) == 0 }">
							<td colspan="4"><h6>작성된 과제가 없습니다.</h6></td>
						</c:if>
					</tbody>
				</table>			                   			
			</div>
		</div>
	</div>
		<!-- Page end  -->
	</div>
<script>
const swiper = new Swiper('.swiper', {
	  // Optional parameters
	  loop: true,
	  slidesPerView: 4,
      spaceBetween: 30,

	  // If we need pagination
	  pagination: {
	    el: '.swiper-pagination',
	    type: "progressbar",
	  },

	  // Navigation arrows
	  navigation: {
	    nextEl: '.swiper-button-next',
	    prevEl: '.swiper-button-prev',
	  },

	  autoplay: {
		    delay: 3000,
		},
	});
</script>
</body>
<!-- page url 입력 접속 막음 -->
<% String strReferer = request.getHeader("referer"); //이전 URL 가져오기 
 if(strReferer == null){ %>
 <script language="javascript">
  alert("URL을 직접 입력해서 접근하셨습니다.\n정상적인 경로를 통해 다시 접근해 주세요.");
  document.location.href="myhome";
 </script>
<% return; }%>
</html>