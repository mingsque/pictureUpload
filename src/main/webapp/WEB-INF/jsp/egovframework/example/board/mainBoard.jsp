<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h2>게시판</h2>
		<p>GetGround Notice Board</p>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>no</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>첫번째 게시판 제목</td>
					<td>작성자1</td>
					<td>12</td>
				</tr>
				<tr>
					<td>2</td>
					<td>두번째 게시판 제목</td>
					<td>작성자2</td>
					<td>13</td>
				</tr>
				<tr>
					<td>3</td>
					<td>세번째 게시판 제목</td>
					<td>작성자3</td>
					<td>41</td>
				</tr>
			</tbody>
		</table>
	</div>
	<a href="writeBoard.do"><button type="button" class="btn btn-primary btn-sm" style="margin-left: 70%;">글쓰기</button></a>

</body>
</html>