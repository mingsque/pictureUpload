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
		<h2 style="margin:30px auto">공지사항 수정</h2>
		
		
		<form id="frm">
			<table class="table border">
				<tr>
					<th style="padding-right:0px"><input name="title" class="border" style="width:100%;line-height:20px" type="text" value="${noticeBoardDetail.title}"></th>
					<th style="width:20%">글쓴이 : ${noticeBoardDetail.writer }</th>
					<th style="width:20%">수정일 : ${noticeBoardDetail.remoddate }</th>
				</tr>
			
				<tr style="width:800px; height:500px">
					<td colspan="3">
						<textarea name="content" class="border" rows=25 style="height:auto;width:100%">${fn:replace(noticeBoardDetail.content, enter, '<br>')}</textarea>
					</td>				
				</tr>
			</table>
		</form>
		<div align="right"style="margin:30px auto">
			<button class="btn btn-outline-dark" id="confirmBtn">완료</button>
		</div>
		
		<div align="right" style="padding-bottom:10px">
			<a href="noticeBoard.do">목록으로</a>
		</div>
	</div>

	<script>

		$("#confirmBtn").click(function(){
			
			$("#frm").attr("action","noticeBoardModifyAction.do?no="+"${noticeBoardDetail.seqNo}");
			
			$("#frm").submit();
		});
		
	</script>

</body>
</html>
