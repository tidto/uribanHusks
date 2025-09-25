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
	<div class="container-fluid">
         <div class="row">
         	<c:forEach items ="${testInfo}" var="info">
           		<input type="hidden" name="homeworkNo" id="homeworkNo" value="${info.homeworkNo}">
	         	<div class="col-md-6 col-lg-4 col-sm-6">
	               <div class="card">
         			  <input type="hidden" id="testNo" name="testNo" value="${info.testNo}">
					  <div class="checkbox d-inline-block mr-3">
					  	<input type="checkbox" class="checkbox-input" id="checkbox1">
					  </div>
	                  <img src="../assets/images/page-img/07.jpg" class="card-img-top" alt="#">
	                  <div class="card-body">
						 <div class="input-group mb-4">
		                     <div class="input-group-prepend">
		                        <span class="input-group-text" id="basic-addon1">점수</span>
		                     </div>
		                     <input type="text" class="form-control" placeholder="Username" aria-label="Username"
		                        aria-describedby="basic-addon1" value="${info.testScore}">
		                  </div>
		                   <div class="input-group mb-4">
		                     <div class="input-group-prepend">
		                        <span class="input-group-text" id="basic-addon1">문제</span>
		                     </div>
		                     <input type="text" class="form-control" placeholder="Username" aria-label="Username"
		                        aria-describedby="basic-addon1" value="${info.testDetail}">
		                  </div>
		                  
		                  <div class="input-group mb-4">
		                     <div class="input-group-prepend">
		                        <span class="input-group-text" id="basic-addon1">정답</span>
		                     </div>
		                     <input type="text" class="form-control" aria-describedby="basic-addon1">
		                  </div>
		                  
		                  <div class="d-flex align-items-center justify-content-center">
		 	                 <button class="btn btn btn-success mt-2 rounded-small">제출</button>&nbsp;&nbsp;
		                   	 <button class="btn btn btn-light mt-2 rounded-small" onclick="location.href='${pageContext.request.contextPath}/studentAnswer/studentHomeworkList'">취소</button>
		                  </div>
	                  </div>
	               </div>
	            </div>
            </c:forEach>
      	</div>      
      </div>
</body>
</html>