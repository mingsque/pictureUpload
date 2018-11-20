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
	
		<h2 style="margin:30px auto">QNADETAIL</h2>
		
		<table class="table border">
			<tr>
				<th>제목 : ${qnaBoardDetail.title }</th>
				<th style="width:20%">글쓴이 : ${qnaBoardDetail.writer }</th>
				<th style="width:20%">수정일 : ${qnaBoardDetail.remoddate }</th>
			</tr>
		
			<tr style="width:800px; height:500px">
				<td>${fn:replace(qnaBoardDetail.content, enter, '<br>')}</td>				
				
			</tr>
		
		</table>
		
		<div style="margin:30px auto" class="pull-right">
			<button class="btn btn-outline-dark" id="modifyBtn">수정</button>
			<button class="btn btn-outline-dark" id="deleteBtn">삭제</button>
		</div>
		
	
		<table class="table">
			<tbody>
				<c:forEach items="${qnaBoardReplyList}" var="qnaBoardReplyList">
					<tr>
						<input type="hidden" id="seqNo" name="seqNo" value="${qnaBoardReplyList.seqNo}"/>
						<td>${qnaBoardReplyList.writer}	</td>
						<td>${qnaBoardReplyList.content}</td>
						<c:if test="${qnaBoardReplyList.writer eq sessionScope.id}">
							<td class="deleteQnaBoardReply" style="width:10%">삭제</td>
						</c:if>
					<tr>
				</c:forEach>
			</tbody>
		</table>	
		
		<c:choose>
			<c:when test="${sessionScope.id eq null}">
				댓글을 쓰려면 <a href="login.do">로그인</a>이 필요합니다.
			</c:when>
			<c:otherwise>
				<form class="form-control" action="insertReply.do" method="post">
					<div class="form-group">
						<input class="form-control" type="text" id="content" name="content"/>
					</div>	
					<button type="submit" class="btn btn-outline-dark">등록</button>
					<input type="hidden" id="writer" name="writer" value="${sessionScope.id}"/>
					<input type="hidden" id="no" name="no" value="${qnaBoardDetail.no}"/>
				</form>
			</c:otherwise>
		</c:choose>
		
		<div style="margin:30px">
			<a class="pull-right" href="qnaBoard.do">목록으로</a>
		</div>
		
		
	</div>

	<script>
		$(".deleteQnaBoardReply").click(function(){
			
			var a = $(this).parent().children().eq(0).children().attr("value");			
			location.href = "deleteQnaBoardReply.do?seqNo="+a+"&no="+"${qnaBoardDetail.no}";
		})

		$("#modifyBtn").click(function(){
			
			location.href = "qnaBoardModify.do?no="+${qnaBoardDetail.no};
		})

		$("#deleteBtn").click(function(){
			
			location.href = "qnaBoardDelete.do?no="+${qnaBoardDetail.no};
		})
	</script>

</body>
</html>
