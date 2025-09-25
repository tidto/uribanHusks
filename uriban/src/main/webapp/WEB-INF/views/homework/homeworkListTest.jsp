<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
         <div class="row">
            <div class="col-sm-12">
               <div class="card">
                  <div class="card-body">
                     <div class="table-responsive">
                        <table id="datatable" class="table data-table table-striped">
                           <thead>
                              <tr class="ligth">
                                 <th>제목</th>
                                 <th>등록</th>
                                 <th>마감</th>
                                 <th>문항수</th>
                                 <th>제출인원</th>
                                 <th>과제상태</th>
                                 <th>제출상태</th>
                                 <th>수정  |  삭제</th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:forEach items="${homeworkListTest}" var="list">
						<tr>
							<td>${list.homeworkTitle}</td>
							<td><fmt:formatDate value="${list.homeworkRdate}"
									pattern="yyyy월 MM월 dd일" /></td>
							<td><fmt:formatDate value="${list.homeworkDdate}"
									pattern="yyyy월 MM월 dd일" /></td>
							<td>${list.problemCount}</td>
							<td>${list.submitCount} / ${list.allStudent}</td>
							<c:choose>
								<c:when test="${list.homeworkDdate < list.today}">
									<td id="state">마감</td>
								</c:when>
								<c:when test="${list.submitCount eq '0'}">
									<td id="state">미진행</td>
								</c:when>
								<c:when test="${list.submitCount eq list.allStudent}">
									<td id="state">마감</td>
								</c:when>
								<c:otherwise>
									<td id="state">진행중</td>
								</c:otherwise>
							</c:choose>
							<td><span>
									<button type="button"
										class="btn bg-danger-light btn-rounded btn-sm my-0"
										onclick="location.href='${pageContext.request.contextPath }/submitTest/submitTestList?homeworkNo=${list.homeworkNo}'">상세보기</button>
							</span></td>
								<!-- 날짜 조건만 비교됨 // 날짜 조건도 안됨 -->
							<c:choose>
								<c:when test="${list.homeworkStatus eq '미진행' and list.homeworkDdate >= list.today}">
									<td><span>
											<button type="button"
												class="btn bg-danger-light btn-rounded btn-sm my-0"
												onclick="location.href='homeworkUpdate?homeworkNo=${list.homeworkNo}'">수정</button>
											&nbsp;&nbsp;&nbsp;
											<button type="button"
												class="btn bg-danger-light btn-rounded btn-sm my-0"
												id="delBtn" onclick="remove()">삭제</button> <input
											type="hidden" value="${list.homeworkNo}"> <!-- location.href='homeworkDelete?homeworkNo=${list.homeworkNo}' -->
									</span></td>
								</c:when>
								<c:otherwise>
								<td><span>
											<button type="button"
												class="btn bg-danger-light btn-rounded btn-sm my-0" disabled>수정</button>
											&nbsp;&nbsp;&nbsp;
											<button type="button"
												class="btn bg-danger-light btn-rounded btn-sm my-0" disabled>삭제</button>
									</span></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
                           </tbody>
                           <tfoot>
                              <tr>
                                <th>제목</th>
                                 <th>등록</th>
                                 <th>마감</th>
                                 <th>문항수</th>
                                 <th>제출인원</th>
                                 <th>과제상태</th>
                                 <th>제출상태</th>
                                 <th>수정  |  삭제</th>
                              </tr>
                           </tfoot>
                        </table>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
</body>
</html>