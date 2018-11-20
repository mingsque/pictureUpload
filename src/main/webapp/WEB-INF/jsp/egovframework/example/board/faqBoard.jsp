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
		<h2 class="top">FAQ</h2>
		<!-- <h4 class="top">FAQ 검색</h4> -->
		
		<input type="text" id="myInput" onkeyup="myFunction()" placeholder="궁금하신 내용을 입력해 주세요" title="Type in a name">

		<table id="myTable">
		
			<c:forEach items="${allFaqList}" var="allFaqList">
				<tr>
				<td>
					<button class="accordion" id="accordion">
						<c:out value="${allFaqList.title}"></c:out> 
					</button>
					<div class="panel" id="panel">
						<p><c:out value="${allFaqList.content }"></c:out></p>	
					</div>
				</td>
			</tr>
			</c:forEach>
			
			
			<!-- <tr>
				<td><button class="accordion" id="accordion">이메일 주소가변경되었습니다. 어떻게 하나요?</button>
					<div class="panel" id="panel">
						<p>홈페이지에서 로그인 하신 후 마이 페이지에서 나의 정보 -> '개인정보변경'에서 직접 수정해 주시면
							됩니다. 이메일 주소 변경을 해주시면 다음부터는 변경된 주소로 이메일이 발송되도록 하겠습니다.</p>
					</div>
				</td>

			</tr>
			
			<tr>
				<td><button class="accordion" id="accordion">ID/비밀번호를 분실했습니다. 어떻게하나요?</button>
					<div class="panel" id="panel">
						<p>로그인창 아래에 있는 '아이디 찾기' /'비밀번호 찾기' 버튼을 누른 후 정보를 입력하시면 됩니다. 본인명의의
						핸드폰인증이나 I-PIN인증을 통해 확인가능합니다.</p>
					</div>
				</td>

			</tr>
			
			<tr>
				<td><button class="accordion" id="accordion">아이디를 바꾸고 싶어요. 어떻게하나요?</button>
					<div class="panel" id="panel">
							<p>아이디변경은 불가능합니다. 각 브랜드 사이트에 한곳이라도 가입되어 있으시다면 그 아이디를 사용하셔야 합니다.
							회원탈퇴 후 재가입시만 아이디 변경이 가능합니다.</p>	
					</div>
				</td>

			</tr> -->
			
		</table>
	</div>

	<script>
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
