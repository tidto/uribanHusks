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
      <div class="col-lg-12">
         <div class="card">
            <div class="card-header d-flex justify-content-between">
               <div class="header-title">
                  <h4 class="card-title">앨범 이미지 다운로드 상세 이력 조회 테이블</h4>
               </div>
            </div>
            <div class="card-body">
               <div class="table-responsive">
                  <table id="datatable" class="table data-table table-striped">
                     <thead>
                        <tr class="ligth">
                           <th>이미지 번호</th>
                           <th>이미지 이름</th>
                        </tr>
                     </thead>
                     <tbody>
                     <c:forEach items ="${detailHistory}" var="list">
                        <tr>
                           <td>${list.imgNo}</td>
                           <td>${list.originalFilename}</td>
                        </tr>
                     </c:forEach>
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
</body>
</html>