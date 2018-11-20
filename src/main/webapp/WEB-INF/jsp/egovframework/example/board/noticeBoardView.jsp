<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<h2>글쓰기</h2>
		<p>Write Board</p>
		<form>
			<div class="form-group">
				<label for="usr">Title</label> <input type="text"
					class="form-control" id="title" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="pwd">Writer</label> <input type="password"
					class="form-control" id="id" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="comment">Content</label>
				<textarea class="form-control" rows="5" id="content" readonly="readonly"></textarea>
			</div>
			<!-- <a href="writeBoard.do"><button type="button" class="btn btn-primary btn-sm" style="margin-left: 70%;">입력</button></a> -->
		</form>
	</div>

</body>
</html>