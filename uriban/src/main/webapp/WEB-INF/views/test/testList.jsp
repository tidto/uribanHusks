<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제목록</title>
</head>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<body>
<c:choose>
	<c:when test="${empty param.td }">
		<div class="card">
			<div class="card-body">
				<div class="d-flex justify-content-start breadcrumb-content">
					<h5>과제목록</h5>
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="card">
			<div class="card-body">
				<div class="d-flex justify-content-start breadcrumb-content">
					<h5>오늘의 과제</h5>
				</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>

	<form name="subjectfrm" action="${pageContext.request.contextPath}/test/testList">
		<input type="hidden" name="pageNo" value="1">
		<c:if test="${not empty param.td }">
			<input type="hidden" name="td" value="td">
		</c:if>
		<div class="input-group mb-4">
	    	<div class="input-group-prepend">
	    		<label class="input-group-text" for="inputGroupSelect01">선택보기</label>
	    	</div>
	    	<select class="custom-select" id="testSubject" name="testSubject">
	       		<option value="" selected>과목을 선택하세요</option>
	       		<option value="국어">국어</option>
	       		<option value="수학">수학</option>
	       		<option value="영어">영어</option>
	    	</select>
	    </div>
    </form>	
	<div class="card-body">
      <div id="table" class="table-editable">
         <table class="table table-bordered table-responsive-md table-striped text-center">
            <thead>
               <tr>
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
            	<c:forEach items ="${pageList}" var="list">
	               <tr>
	                  <td>${list.homeworkTitle}</td>
	                  <td>${list.problemCount}</td>
	                  <td><fmt:formatDate value="${list.homeworkRdate}" pattern="yyyy년 MM월 dd일"/></td>
	                  <td><fmt:formatDate value="${list.homeworkDdate}" pattern="yyyy년 MM월 dd일"/></td>
	                  <fmt:formatDate var="Dday" value="${list.homeworkDdate}" pattern="yyyy-MM-dd"/>
	                  <c:choose>
		                  <c:when test="${empty param.td }">
			                  <c:choose>
			                  	<c:when test="${list.answerState eq '제출'}">
			                  		<td><button type="button" class="btn btn-primary" onclick="goHomeWork('${list.homeworkNo}','done')">정답확인</button></td>
			                  	</c:when>
			                  	<c:otherwise>
			                  		<c:choose>
			                  			<c:when test="${Dday < today}">
			             					<td>
			             						<button type="button" class="btn btn-primary" onclick="goHomeWork('${list.homeworkNo}','done')">정답확인</button>
			             					</td>	     			
			                  			</c:when>
			                  			<c:otherwise>
			                  				<td>
			                  					<button type="button" class="btn btn-secondary" onclick="goHomeWork('${list.homeworkNo}','do')">문제풀기</button>
			                  				</td>	
			                  			</c:otherwise>
			                  		</c:choose>
			                  	</c:otherwise>
			                  </c:choose>
		                  </c:when>
		                  <c:otherwise>
		                  	<c:choose>
			                  	<c:when test="${list.answerState eq '제출'}">
			                  		<td><button type="button" class="btn btn-primary" onclick="goHomeWork2('${list.homeworkNo}','done')">정답확인</button></td>
			                  	</c:when>
			                  	<c:otherwise>
			                  		<c:choose>
			                  			<c:when test="${Dday < today}">
			             					<td>
			             						<button type="button" class="btn btn-primary" onclick="goHomeWork2('${list.homeworkNo}','done')">정답확인</button>
			             					</td>	     			
			                  			</c:when>
			                  			<c:otherwise>
			                  				<td>
			                  					<button type="button" class="btn btn-secondary" onclick="goHomeWork2('${list.homeworkNo}','do')">문제풀기</button>
			                  				</td>	
			                  			</c:otherwise>
			                  		</c:choose>
			                  	</c:otherwise>
			                  </c:choose>
		                  </c:otherwise>
	                  </c:choose>
	                   <c:choose>
	                  	<c:when test="${list.answerState eq '제출'}">
	                  		<td class="text-primary">${list.answerState}</td>
	                  	</c:when>
	                  	<c:otherwise>
	                  		<td class="text-secondary">${list.answerState}</td>
	                  	</c:otherwise>
	                   </c:choose>
	                  
	                  <td>${list.totalScore}</td>
	               </tr>
               </c:forEach>
            </tbody>
         </table>
         <ul class="pagination justify-content-center">
      		<c:choose>
				<c:when test="${page.startPage eq page.pageNo}">
					<li class="page-item disabled">
					   <a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="javascript:goPage(${page.pageNo-1})">이전</a>
					</li>
				</c:otherwise>
      		</c:choose>
           <c:forEach var="pages" begin="${page.startPage}" end="${page.endPage}">
				<c:if test="${page.pageNo ne pages}">
					<li class="page-item"><a class="page-link" href="javascript:goPage(${pages})">${pages}</a></li>
				</c:if>
				<c:if test="${page.pageNo eq pages}">
					<li class="page-item active" aria-current="page">
						<a class="page-link" href="javascript:goPage(${pages})">${pages}<span class="sr-only">(current)</span></a>
					</li>
				</c:if>	           
           </c:forEach>
           <c:choose>
				<c:when test="${page.endPage eq page.pageNo}">
					<li class="page-item disabled">
					   <a class="page-link" href="#" tabindex="-1" aria-disabled="true">다음</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="javascript:goPage(${page.pageNo+1})">다음</a>
					</li>
				</c:otherwise>
      		</c:choose>
		</ul>
      </div>
   </div>
</body>
<script>
function goHomeWork(homeworkNo,isDone){
	console.log(homeworkNo);
	 location.href = "../studentAnswer/studentAnswerList?homeworkNo="+homeworkNo+"&isDone="+isDone;
}

function goHomeWork2(homeworkNo,isDone){
	console.log(homeworkNo);
	 location.href = "../studentAnswer/studentAnswerList?homeworkNo="+homeworkNo+"&isDone="+isDone+"&td=td";
}

$('#testSubject').val("${param.testSubject}");
$('#testSubject').on('change', function(){
	goPage(1)
})

function goPage(pageNo){
	subjectfrm.pageNo.value = pageNo;
	subjectfrm.submit();
}
</script>
</html>