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
<style>
.container {
	margin: 2% 15%;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	border: 1px solid #ddd;
}

th, td {
	text-align: left;
	padding: 16px;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}
</style>

<script>
	$(document).ready(function() {		
		
	    $("#title").click(function(){
			var seqNo = $(this).data("view");			

			$('#noticeView').attr("action","noticeBoadView.do");			
			$('#seqNo').val(seqNo);
			
			$('#noticeView').submit(); 
	    		
	    });
	 }); 	
</script>

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
				<c:forEach items="${noticeBoardList}" var="noticeBoardList">
					<tr>
						<td>
							<c:out value="${noticeBoardList.seqNo}"></c:out> 
						</td>
						<td id="title" data-view="<c:out value="${noticeBoardList.seqNo}"/>">
							<c:out value="${noticeBoardList.title}"></c:out> 
						</td>
						<td>
							<c:out value="${noticeBoardList.id}"></c:out> 
						</td>
						<td>
							<c:out value="${noticeBoardList.viewCnt}"></c:out> 
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<form id="noticeView" action="#">
			<input type="hidden" id="seqNo" />
		</form>
	</div>
	<!--  <a href="writeBoard.do"><button type="button" class="btn btn-primary btn-sm" style="margin-left: 70%;">글쓰기</button></a>  -->

</body>
</html>