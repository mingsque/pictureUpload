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
		<h2 style="margin: 30px auto">공지사항 쓰기</h2>
		
		<form id="frm" method="post">
			<label for="title">Title</label>
			<div class="form-inline">
				<div style="width:100%" class="form-group">
					<select class="form-control col-lg-2">
						<option>공지사항</option>
						<option>이벤트</option>					
					</select>
					<input class="form-control off-set col-lg-10" type="text" id="title" name="title">
				</div>
			</div>
				
			<div style="padding-top:10px" class="form-group">
				<label for="content">Content</label> 
				<textarea id="content" name="content" class="form-control" rows="7"></textarea>
			</div>
			
			<input type="hidden" id="writer" name="writer" value="${sessionScope.id }">
		</form>
		
		<div align="right" style="margin-bottom:20px;">
			<button class="btn btn-outline-dark" type="button" id="confirmBtn">완료</button>
		</div>
	</div>

	<script>
		$("#confirmBtn").click(function(){
			$("#frm").attr("action","qnaBoardWriteSet.do");
			
			$("#frm").submit();
		})
	
	</script>

</body>
</html>
