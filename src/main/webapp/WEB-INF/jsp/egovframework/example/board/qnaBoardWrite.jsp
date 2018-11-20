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
		<h2 style="margin: 30px auto">QNA Write</h2>
		
		<form id="frm" method="post">
			<div class="form-group">
				<label for="title">Title</label> 
				<input class="form-control" type="text" id="title" name="title">
			</div>
			<div class="form-group">
				<label for="content">Content</label> 
				<textarea id="content" name="content" class="form-control" rows="7"></textarea>
			</div>
			
			<input type="hidden" id="writer" name="writer" value="${sessionScope.id }">
		</form>
		
		<button class="btn btn-outline-dark pull-right"type="button" id="confirmBtn">완료</button>
	
	</div>

	<script>
		$("#confirmBtn").click(function(){
			$("#frm").attr("action","qnaBoardWriteSet.do");
			
			$("#frm").submit();
		})
	
	</script>

</body>
</html>
