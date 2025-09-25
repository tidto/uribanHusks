<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 상세정보</title>
</head>
<body>
	<table>
		<tr>
			<th>학생번호</th>
			<td>${studentInfo.studentNo }</td>
		</tr>
		<tr>
			<th>반ID</th>
			<td>${studentInfo.classId }</td>
		</tr>
		<tr>
			<th>학생아이디</th>
			<td>${studentInfo.studentId }</td>
		</tr>
		<tr>
			<th>학생이메일</th>
			<td>${studentInfo.studentEmail }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${studentInfo.studentName }</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${studentInfo.studentSex }</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${studentInfo.birthday }</td>
		</tr>
		<tr>
			<th>학생사진</th>
			<td>${studentInfo.studentImg }</td>
		</tr>
		<tr>
			<th>특이사항</th>
			<td>${studentInfo.remark }</td>
		</tr>
		<tr>
			<th>알레르기</th>
			<td>${studentInfo.allergy }</td>
		</tr>
	</table>
	<button type="button"
		onclick="location.href='studentUpdate?studentNo=${studentInfo.studentNo }'">수정</button>
	<button type="button"
		onclick="location.href='studentDelete?studentNo=${studentInfo.studentNo }'">삭제</button>
</body>
</html>