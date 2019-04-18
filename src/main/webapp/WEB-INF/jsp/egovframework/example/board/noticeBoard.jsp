<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<style>
.container {
	margin: 2% 20%;
}

.top {
	margin: 30px auto;
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
</style>

<script>
		function goPreGroup() {
			var endPage = ${resMap.startPage};
			endPage = endPage -1;
			location.href = "goPage.do?page="+endPage;
		}
	
		function goNextGroup() {
			var endPage = ${resMap.endPage};
			endPage = endPage + 1;
			location.href = "goPage.do?page="+endPage;
		}
	
		$().ready(function(){
			$(".boardRow").click(function(){
				var seq_no = $(this).children().eq(0).text();
				
				location.href = "noticeBoardDetail.do?seq_no=" + seq_no;
			});
			
			$("#writeBtn").click(function(){
				location.href =	"noticeBoardWrite.do";
			});
		});
</script>


<body>
	<div class="container">
		<h2 class="top">공지사항</h2>
		<input type="text" id="myInput" onkeyup="myFunction()" placeholder="궁금하신 내용을 입력해 주세요" title="Type in a name">
		
		<table class="table table-sm table-hover">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">종류</th>
					<th scope="col">글 제목</th>
					<th scope="col">글쓴이</th>
					<th scope="col">작성일</th>
					<!-- <th scope="col">조회수</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${noticeBoardList}" var="noticeBoardList">
					<tr class="boardRow">
						<td>${noticeBoardList.seqNo}</td>
						<td>${noticeBoardList.category}</td>
						<td>${noticeBoardList.title}</td>		
						<td>${noticeBoardList.writer}</td>
						<td>${noticeBoardList.remoddate}</td>
					</tr>
				</c:forEach>
			</tbody>	
		</table>
		
		<div class ="text-center">
			<ul class="list-inline">
				<c:if test="${resMap.startPage ne '1'}">
					<a href="#" onclick=goPreGroup()> << </a>
				</c:if>
	
				<c:forEach var="i" begin="${resMap.startPage}" end="${resMap.endPage}">
					<c:if test="${i <= resMap.totalPage}">
						<a href = "goPage.do?page=<c:out value="${i}"/>"><c:out value="${i}"/></a>
					</c:if>
				</c:forEach>
			
				<c:if test="${resMap.totalPage > resMap.page}">
					<a href="#" onclick="goNextGroup()"> >> </a>
				</c:if>
			</ul>
		</div>
		
		<c:choose>
        	<c:when test="${sessionScope.name eq null}">
	        	<p>글을 쓰려면 <a href="login.do">로그인</a>을 하셔야합니다.</p>                   	
			</c:when>
			<c:otherwise>
				<div align="right">
            		<button type="button" class="btn btn-outline-dark" id="writeBtn">글쓰기</button>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>
