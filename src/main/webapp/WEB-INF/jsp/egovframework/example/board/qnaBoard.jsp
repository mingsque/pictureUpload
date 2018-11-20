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
</head>
<body>
	<div class="container">
		<h2 class="top">FAQ게시판</h2>
		<input type="text" id="myInput" onkeyup="myFunction()" placeholder="궁금하신 내용을 입력해 주세요" title="Type in a name">
		
		<table class="table table-sm table-hover">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">글 제목</th>
					<th scope="col">글쓴이</th>
					<th scope="col">작성일</th>
					<!-- <th scope="col">조회수</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${qnaBoardList}" var="qnaBoardList">
					<tr class="boardRow">

						<td>${qnaBoardList.no}</td>
						<td>${qnaBoardList.title}</td>		
						<td>${qnaBoardList.writer}</td>
						<td>${qnaBoardList.remoddate}</td>
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
	          	글을 쓰려면 <a href="login.do">로그인</a>을 하셔야합니다.                   	
			</c:when>
			<c:otherwise>
               <button type="button" class="btn btn-outline-dark pull-right" id="writeBtn">글쓰기</button>
			</c:otherwise>
		</c:choose>
	</div>

	<form id="frm" method="post" action="qnaBoardWrite.do">
	</form>

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
	
	
		$(".boardRow").click(function(){
			var no = $(this).children().eq(0).text();
			
			location.href = "boardDetail.do?no=" + no;
		});
	
		$("#writeBtn").click(function(){
			$("#frm").submit();
		});
	
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.display === "block") {
					panel.style.display = "none";
				} else {
					panel.style.display = "block";
				}
			});
		}

		function myFunction() {
			var input, filter, table, tr, td, i;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("myTable");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[0];
				if (td) {
					if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>

</body>
</html>
