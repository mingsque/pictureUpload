<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.container {
	margin: 2% 20%;
}

.top {
	margin: 30px auto;
}

.accordion {
	background-color: #eee;
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
}

.active, .accordion:hover {
	background-color: #ccc;
}

.panel {
	padding: 0 18px;
	display: none;
	background-color: white;
	overflow: hidden;
}

#myInput {
	background-image: url('/css/searchicon.png');
	background-position: 10px 10px;
	background-repeat: no-repeat;
	width: 100%;
	font-size: 16px;
	padding: 12px 20px 12px 40px;
	border: 1px solid #ddd;
	margin-bottom: 12px;
}

#myTable {
	border-collapse: collapse;
	width: 100%;
	border: 1px solid #ddd;
	font-size: 18px;
}

#myTable th, #myTable td {
	text-align: left;
	padding: 12px;
}

#myTable tr {
	border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
	background-color: #f1f1f1;
}
</style>
</head>
<body>
	<div class="container">
		<h2 class="top">QNAModify</h2>
		
		<form id="confirm" method="post">
			<table>
				<tr>
					<td>글 제목</td>
					<td>
						<input type="text" id="title" name="title" value="${qnaBoardDetail.title}">
					</td>
				</tr>
				
				<tr>
					<td>글 쓴이</td>
					<td>${qnaBoardDetail.writer }</td>
				</tr>
				
				<tr>
					<td>글 내용</td>
					<td> 
						<input type="text" id="content" name="content" value="${qnaBoardDetail.content }">
					</td>
				</tr>
				
				<tr>
					<td>수정일</td>
					<td>${qnaBoardDetail.moddate }</td>
				</tr>
		
			</table>
			<input type="hidden" id="no" name="no" value="${qnaBoardDetail.no}">
		</form>	
				
		<button id="confirmBtn">완료</button>
	
	</div>

	<script>
		$("#confirmBtn").click(function(){
		
			$("#confirm").attr("action","qnaBoardModifySet.do");
		
			$("#confirm").submit();
		})
		
	
	</script>

</body>
</html>
