<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생과제목록</title>
</head>
<body>
	<div class="card-body">
	    <div class="table-responsive">
	       <table class="data-table table" style="width:100%">
	          <thead>
	             <tr>
	                <th>번호</th>
	                <th>제목</th>
	                <th>문제수</th>
	                <th>출제일시</th>
	                <th>제출기한</th>
	                <th>제출</th>
	                <th>제출여부</th>
	                <th>점수</th>
	             </tr>
	          </thead>
	          <tbody>
	          	 <c:forEach items="${studentHomeworkList}" var="list">
		             <tr>
		                <td>${list.homeworkNo}</td>
		                <td>${list.homeworkTitle}</td>
		                <td>${list.problemCount}</td>
						<td><fmt:formatDate value="${list.homeworkRdate}" pattern="yyyy월 MM월 dd일"/></td>
		                <td><fmt:formatDate value="${list.homeworkDdate}" pattern="yyyy월 MM월 dd일"/></td>
		                <td><button type="button" class="mt-2 btn btn-success"><i class="ri-bill-fill"></i>문제풀기</button></td>
		                <td>${list.answerState}</td>
		                <td>${list.totalScore}</td>
		             </tr>
	             </c:forEach>
	          </tbody>
	       </table>
	    </div>
	 </div>
</body>
</html>