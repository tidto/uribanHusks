<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>과제목록</title>
</head>
<body>
	<div class="card-body">
      <div id="table" class="table-editable">
         <span class="table-add float-right mb-3 mr-2">
         <button class="btn btn-sm bg-primary" onclick='location.href="${pageContext.request.contextPath }/homeworkInsert"'>
         	<i class="ri-add-fill"><span class="pl-1">과제 등록</span></i>
         </button>
         </span>
         <table class="table table-bordered table-responsive-md table-striped text-center">
            <thead>
               <tr>
                  <th>No.</th>
                  <th>제목</th>
                  <th>등록</th>
                  <th>마감</th>
                  <th>문항수</th>
                  <th>제출</th>
                  <th>과제상태</th>
                  <th>제출상태</th>
                  <th>수정 | 삭제</th>
               </tr>
            </thead>
            <tbody>
            	<c:forEach items ="${homeworkList}" var="list">
	               <tr>
	                  <td contenteditable="true">${list.homeworkNo}</td>
	                  <td contenteditable="true">${list.homeworkTitle}</td>
	                  <td contenteditable="true"><fmt:formatDate value="${list.homeworkRdate}" pattern="yyyy월 MM월 dd일"/></td>
	                  <td contenteditable="true"><fmt:formatDate value="${list.homeworkDdate}" pattern="yyyy월 MM월 dd일"/></td>
	                  <td contenteditable="true">${list.problemCount}</td>
	                  <td contenteditable="true">${list.submitCount}</td>
	                  <td contenteditable="true">${list.homeworkStatus}</td>
	                  <td>
	                  	<span class="table-remove">
	                     	<button type="button" class="btn bg-danger-light btn-rounded btn-sm my-0">상세보기</button>
	                     </span>
	                  </td>
	                  <td>
	                     <span class="table-remove">
	                     	<button type="button" class="btn bg-danger-light btn-rounded btn-sm my-0" onclick="location.href='homeworkUpdate?homeworkNo=${list.homeworkNo}'">수정</button> &nbsp;&nbsp;&nbsp;
	                     	<button type="button" class="btn bg-danger-light btn-rounded btn-sm my-0" id="delBtn" onclick="location.href='homeworkDelete?homeworkNo=${list.homeworkNo}'">삭제</button>
	                     </span>
	                  </td>
	               </tr>
               </c:forEach>
            </tbody>
         </table>
      </div>
   </div>
   <script>
   
	
   </script>
</body>
</html>