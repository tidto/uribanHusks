<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생제출과제목록</title>
</head>
<body>
	<div class="card-body">
	  <div>
	  	<input type=hidden name="homeworkNo" value="${homeworkList.homewokrNo}">
	  </div>
      <div id="table" class="table-editable">
         <table class="table table-bordered table-responsive-md table-striped text-center">
            <thead>
               <tr>
                  <th>No.</th>
                  <th>학생이름</th>
                  <th>제출일</th>
                  <th>정답률</th>
                  <th>총점</th>
                  <th>제출답안</th>
               </tr>
            </thead>
            <tbody>
            	<c:forEach items ="${pageList}" var="list">

            		<input type="hidden" value="${list.memberId}">

	               <tr>
	                  <td contenteditable="true">${list.submitTestNo}</td>
	                  <td contenteditable="true">${list.memberName}</td>
	                  <td contenteditable="true"><fmt:formatDate value="${list.submitDate}" pattern="yyyy월 MM월 dd일"/></td>
	                  <td contenteditable="true">${list.answerPercent}</td>
	                  <td contenteditable="true">${list.totalScore}</td>
	                  <td>
	                  	<span class="table-remove">
	                     	<button type="button" class="btn bg-danger-light btn-rounded btn-sm my-0" onclick="location.href='${pageContext.request.contextPath }/studentAnswer/studentAnswerList?homeworkNo=${list.homeworkNo}&isDone=done'">제출답안</button>
	                     </span>
	                  </td>
	               </tr>
               </c:forEach>
            </tbody>
         </table>
      </div>
   </div>
</body>
</html>