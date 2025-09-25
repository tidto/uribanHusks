<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.layer {
	display: none;
	position: fixed;
	width: 20%;
	left: 50%;
	margin-left: -10%; /* half of width */
	top: 40%;
	margin-top: -150px; /* half of height */
	overflow: auto;
	z-index: 10000;
}
</style>
<title>Insert title here</title>
<style type="text/css">
.x80 {
	width: 80px;
	height: 80px;
}

.c-mar {
	width: 60%;
}

.he100px {
	height: 6em;
}

.hei100per {
	height: 100%;
}

.newcalss-bg {
	background-color: #ededed;
	border-bottom-left-radius: 16px;
	border-bottom-right-radius: 16px;
}

.newcalss-bg-hover {
	background-color: #e6e6e6;
}
</style>
</head>
<body>
	<sec:authentication property="principal" var="p" />

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">프로필</div>
				<div class="row no-gutters he100px">
					<div class="col-{breakpoint}-auto hei100per p-2 align-items-center">
						<img
							src="${pageContext.request.contextPath }/profile/${p.memberProfile}"
							class="x80 rounded-circle " alt="#">
					</div>
					<div class="col-6">
						<div class="card-body">
							<h4 class="card-title">${p.memberName}</h4>
							<span class="card-text">${p.memberId}</span>
							<c:choose>
								<c:when
									test="${member.authority eq 'A102' or member.authority eq 'A103'}">
									<span class="badge bg-primary">${member.authKor}</span>
								</c:when>
								<c:when test="${member.authority eq 'A104'}">
									<span class="badge bg-info">${member.authKor}</span>
								</c:when>
								<c:when test="${member.authority eq 'A105' }">
									<span class="badge bg-secondary">${member.authKor}</span>
								</c:when>
								<c:otherwise>
									<span class="badge bg-dark">${member.authKor}</span>
								</c:otherwise>
							</c:choose>

						</div>
					</div>
					<div class="col-4" style="text-align: right;">
						<a href="myInfo?memberId=${member.memberId}"
							class="btn text-primary mi-mr">계정 관리</a>
					</div>
				</div>
			</div>
		</div>

		<div class="col-12">
			<div class="card">
				<!-- 관리자 페이지 시작 -->
				<c:if test="${member.authority eq 'A101'}">
					<div class="card-header">관리자 페이지</div>
					<div class="row no-gutters he100px newcalss-bg">
						<div class="col-12" style="text-align: center;">
							<a href="admin/adminHome" class="" style="color: #999;">관리자
								페이지</a>
						</div>
					</div>
				</c:if>
				<!-- 관리자 페이지 끝 -->



				<!-- 우리반 목록 헤더 시작 -->
				<c:if
					test="${member.authority ne 'A101' and member.authority ne 'A103'}">
					<div class="card-header">우리반</div>
				</c:if>
				<!-- 우리반 목록 헤더 끝 -->

				<!-- 우리반 바디 시작-->
				<c:forEach items="${getMyClass}" var="c">
				<!-- 회원이 가입된 학급의 목록 -->
						<div class="row no-gutters he100px">
							<div class="col-{breakpoint}-auto hei100per p-2"></div>
							<div class="">
								<div class="">
									<a class=""><span>${c.STATES}</span> ${c.CITY}
										${c.SCHOOL_NAME} ${c.GRADE}학년 ${c.CLASSES}반</a>
								</div>
								<c:choose>
									<c:when
										test="${member.authority eq 'A102' or member.authority eq 'A103'}">
										<span>${member.memberName}</span><span class="badge bg-primary">${member.authKor}</span>
									</c:when>
									<c:when test="${member.authority eq 'A105'}">
										<span>${c.STUDENT_NAME}</span>
										<span class="badge bg-info">학생</span>
									</c:when>
									<c:when test="${member.authority eq 'A104'}">
										<span>${member.memberName}</span>
										<span class="badge bg-info">학생</span>
									</c:when>
									<c:otherwise>
										<span class="badge bg-dark">${member.authKor}</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="col-4" style="text-align: right;">

								<c:if
									test="${member.authority eq 'A101' || member.authority eq 'A102' }">
									<button class="btn bg-primary"
										onclick="window.location.href='myClass/myClassUpdate?classId=${c.CLASS_ID}'"
										data-toggle="tooltip" name="updateClass" data-placement="top"
										title="" data-original-title="반 정보 수정">
										<svg class="svg-icon mr-0 text" id="h-03-p" width="20"
											xmlns="http://www.w3.org/2000/svg" fill="none"
											viewBox="0 0 24 24" stroke="currentColor">
	                                              <path
												stroke-linecap="round" stroke-linejoin="round"
												stroke-width="2"
												d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path>
	                                              <path
												stroke-linecap="round" stroke-linejoin="round"
												stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
	                                          </svg>
									</button>
								</c:if>
								<a href="myClass/myClassHome?classId=${c.CLASS_ID}"
									class="btn btn-primary mi-mr">우리반으로</a>
							</div>
						</div>
				</c:forEach>
				<!-- 우리반 목록 바디 끝 -->

				<!-- 우리반 찾기 학생 시작-->
				<c:if test="${member.authority eq 'A104'and empty getMyClass}">
					<div class="row no-gutters he100px newcalss-bg">
						<div class="col-12" style="text-align: center;">
							<a href="myClass/myClassList" class="" style="color: #999;">우리반
								찾기</a>
						</div>
					</div>
				</c:if>
				<!-- 우리반 찾기 학생 끝-->

				<!-- 우리반 찾기 학부모 시작-->
				<c:if test="${member.authority eq 'A105'}">
					<div class="row no-gutters he100px newcalss-bg">
						<div class="col-12" style="text-align: center;">
							<a href="myClass/myClassList" class="" style="color: #999;">우리반
								찾기</a>
						</div>
					</div>
				</c:if>
				<!-- 우리반 찾기 학부모 끝-->

				<!-- 교사자격 인증 시작-->
				<c:if test="${member.authority eq 'A103'}">
					<div class="card-header">교사자격 인증</div>
					<div class="row no-gutters he100px newcalss-bg">
						<div class="col-12" style="text-align: center;">
							<a href="myInfo?memberId=${p.memberId}" class=""
								style="color: #999;">교사자격 인증하기</a>
						</div>
					</div>
				</c:if>
				<!-- 교사자격 인증 끝-->

				<!-- 우리반 생성하기 시작-->
				<c:if test="${member.authority eq 'A102' and empty getMyClass}">
					<div class="row no-gutters he100px newcalss-bg">
						<div class="col-12" style="text-align: center;">
							<a href="myClass/myClassInsert" class="" style="color: #999;">반
								생성하기</a>
						</div>
					</div>
				</c:if>
				<!-- 우리반 생성하기 끝-->
			</div>
		</div>
	</div>
	<div class="alert text-white bg-info layer" id="done" role="alert">
			<div class="iq-alert-text done"></div>
			<button type="button" class="close close1">
				<i class="ri-close-line"></i>
			</button>
		</div>
	<c:if test="${not empty result}">
	<script type="text/javascript">
		$('.done').text('클래스가 생성 되었습니다.');
		$('#done').show();
	</script>
	</c:if>
	<script type="text/javascript">
		$('.close1').on('click', function() {
			$('.layer').hide();
		})
	</script>

</body>
</html>