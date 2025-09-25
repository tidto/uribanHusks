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
                  <h4 class="card-title">앨범 이미지 다운로드 이력 조회 테이블</h4>
               </div>
            </div>
            <div class="card-body">
               <div class="table-responsive">
                  <table id="datatable" class="table data-table table-striped">
                     <thead>
                        <tr class="ligth">
                           <th>다운로드한 사용자 ID</th>
                           <th>다운로드한 사용자 IP</th>
                           <th>다운로드한 앨범번호</th>
                           <th>다운로드한 사진 갯수</th>
                           <th>다운로드한 날짜</th>
                           <th>다운로드 이력 상세보기</th>
                        </tr>
                     </thead>
                     <tbody>
                     <c:forEach items ="${downList}" var="list">
                        <tr>
                           <td>${list.userId}</td>
                           <td>${list.userIp}</td>
                           <td>${list.albumNo}</td>
                           <td>${list.downCnt}</td>
                           <td><fmt:formatDate value="${list.downDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></td>
                           <td><button type="button" class="btn btn-primary" onclick="goDetail(${list.downNo})">이력상세보기</button></td>
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
<script>
function goDetail(downNo){
	 location.href = "${pageContext.request.contextPath }/admin/downDetailHistory?downNo="+downNo;
}

$("#datatable").DataTable({    
	  order: [ [ 4, "desc" ] ] });

</script>
</html>