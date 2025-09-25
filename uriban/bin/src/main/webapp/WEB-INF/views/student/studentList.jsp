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
	<h3>학생목록</h3>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>이메일</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>특이사항</th>
				<th>알레르기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${studentList }" var="info">
				<tr>
					<td>${info.studentNo }</td>
					<td>${info.studentName }</td>
					<td>${info.studentEmail }</td>
					<td><fmt:formatDate value="${info.birthday }"
							pattern="yyyy년MM월dd일" /></td>
					<td>${info.studentSex }</td>
					<td>${info.remark }</td>
					<td>${info.allergy }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<button type="button" onclick="location.href='studentInsert'">학생
			신규 등록</button>
	</div>
	<script>
		document.querySelectorAll('tbody > tr').forEach(function(tag) {
			tag.addEventListener('click', function(e) {
				let studentNo = e.currentTarget.firstElementChild.textContent;
				location.href = 'studentInfo?studentNo=' + studentNo;
			});
		});
	</script>
</body>
</html>