<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<table border="1">
			<tr>
				<th>schedule_no</th>
				<td>${scheduleInfo.scheduleNo }</td>
			</tr>
			<tr>
				<th>class_id</th>
				<td>${scheduleInfo.classId }</td>
			</tr>
			<tr>
				<th>notice_no</th>
				<td>${scheduleInfo.noticeNo }</td>
			</tr>
			<tr>
				<th>schedule_writer</th>
				<td>${scheduleInfo.scheduleWriter }</td>
			</tr>
			<tr>
				<th>schedule_category</th>
				<td>${scheduleInfo.scheduleCategory }</td>
			</tr>
			<tr>
				<th>schedule_title</th>
				<td>${scheduleInfo.scheduleTitle }</td>
			</tr>
			<tr>
				<th>start_date</th>
				<td><fmt:formatDate value="${scheduleInfo.startDate }" pattern="yyyy년MM월dd일"/></td>
			</tr>
			<tr>
				<th>end_date</th>
				<td><fmt:formatDate value="${scheduleInfo.endDate }" pattern="yyyy년MM월dd일"/></td>
			</tr>
		</table>
		<div>
			<button type="button" onclick="location.href='empUpdate?employeeId=${empInfo.employeeId}'">수정</button>
			<button type="button" onclick="location.href='scheduleList'">목록으로</button>
		</div>
	</div>
</body>
</html>