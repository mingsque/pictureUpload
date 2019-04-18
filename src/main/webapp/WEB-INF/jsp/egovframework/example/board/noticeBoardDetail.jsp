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
	
</style>
</head>

<body>
	<div class="container">
		<h2 style="margin:30px auto">공지사항 세부</h2>
		<table class="table border">
			<tr>
				<th>제목 : ${noticeBoardDetail.title }</th>
				<th style="width:20%">글쓴이 : ${noticeBoardDetail.writer }</th>
				<th style="width:20%">수정일 : ${noticeBoardDetail.remoddate }</th>
			</tr>
		
			<tr style="width:800px; height:500px">
				<td colspan="3">${fn:replace(noticeBoardDetail.content, enter, '<br>')}</td>				
			</tr>
		</table>
		
		<div align="right"style="margin:30px auto">
			<button class="btn btn-outline-dark" id="modifyBtn">수정</button>
			<button class="btn btn-outline-dark" id="deleteBtn">삭제</button>
		</div>
		
		<div align="right" style="padding-bottom:10px">
			<a href="noticeBoard.do">목록으로</a>
		</div>
	</div>

	<script>

		$("#modifyBtn").click(function(){
			var seqNo = ${noticeBoardDetail.seqNo};
			
			location.href = "noticeBoardModify.do?seq_no="+seqNo;
		})

		$("#deleteBtn").click(function(){
			
			//location.href = "noticeBoardDelete.do?no="+${noticeBoardDetail.no};
		})
	</script>

</body>
</html>
