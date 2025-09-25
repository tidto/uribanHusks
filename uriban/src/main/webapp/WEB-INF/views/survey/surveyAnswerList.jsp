 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sec:authentication property="principal" var="p" />
	<div class="container-fluid" >
		<div class="row">
			<div class="col-sm-12 col-lg-12">
				<div class="card">
					<div class="card-header d-flex justify-content-between">
						<div class="header-title delSurvNo">
							<input type="hidden" value="${surveyInfo.survNo }">
							<h4 class="card-title">${surveyInfo.survTitle }</h4>
						</div>
					</div>
					<c:forEach items="${surveyInfo.question }" var="question" varStatus="queNo">
						<div class="question">
							<div class="card-body">
								<h5>${question.queMarkNo }. ${question.questionContent } (${question.questionCheck })</h5>
								<c:forEach items="${question.answer }" var="answer">
                        			<input type="radio" class="ml-3" disabled
                        				<c:if test="${fn:contains(responseInfo, answer.answerNo ) ? 'true' : 'false'}">checked</c:if>>
                        			<label  class="ml-3" 
                        				<c:if test="${fn:contains(responseInfo, answer.answerNo ) ? 'true' : 'false'}">style="color:red"</c:if>>
                      					${answer.answerContent }  
                        			</label>
                        		</c:forEach>		
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<c:choose>
				<c:when test="${p.authority eq 'A102' }">
					<div class="form-group">
						<button class="btn btn-primary" onclick="location.href='surveyCustList?SurvNo=${surveyInfo.survNo }'">뒤로가기</button>
					</div>
				</c:when>
				<c:otherwise>
					<div class="form-group">
						<button class="btn btn-primary" onclick="location.href='surveyList'">뒤로가기</button>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<script type="text/javascript">
	
		$(document).ready(function() {
			function resCnt(){
				let AnswerNo = $('.answerNo');
				console.log(AnswerNo);
			}
		})
				
	</script>
</body>
</html>