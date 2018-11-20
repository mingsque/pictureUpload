<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="js/jquery.min.js"></script>
<script>
	$(function(){

	})
	function initCategory(mainCate, subCate){
		var result = "";
		
		for(var i = 0; i < mainCate.length; i++){ 
			result += "<li><a href='/product.do?category=" + mainCate[i].seq_No + "'>" + mainCate[i].category_Name + "</a></li>";
			
			for(var j = 0; j < subCate.length; j++){
				if(subCate[j].category_Fk === mainCate[i].seq_No) { 
					result += "<li><a href='/product.do?category=" + subCate[j].seq_No + "'>::" + subCate[j].category_Name + "</a></li>";
				}
			}
		}
		
		$("#cateList").append(result);
	}
	$(document).ready(function(){
		$.ajax({
			url : "/cateList.do",
			type : "post",
			contentType : "application/json",
			success : function(data) {
				var jObj = JSON.parse(data);
				initCategory(jObj.list, jObj.smallList);
			}
		});
	})
</script>

<style>
.first {
	background: black;
	color: white;
	text-align: center;
	font-size: 13px;
	padding: 10px
}

.first li {
	display: inline;
	margin-left: 10px;
}
</style>

<header id="header" class="border">
	<nav class="first">
		<ul>
			<li>로그인</li>

			<li>회원가입</li>

			<li>마이페이지</li>

			<li>주문배송조회</li>

			<li>장바구니</li>

			<li>관심상품</li>

			<li>공지사항</li>

			<li>즐겨찾기</li>
		</ul>
	</nav>

	<div class="container">
		<nav class="navbar navbar-default">
			<!--  Header Logo  -->
			<div id="logo">
				<a class="navbar-brand" href="main.do"> 
					<img src="img/logo.png" class="normal" alt="logo"> <!--<img src="img/logo@2x.png" class="retina" alt="logo"> -->
				</a>
			</div>
		<!--  END Header Logo  -->
			<!--  Menu  -->
			<div id="sidemenu">
				<div class="menu-holder">

					<ul>
						<li class="submenu"><a href="javascript:void(0)"
							class="active-item">Home</a>
							<ul class="sub-menu">
								<li><a href="index.html">Home Minimal</a></li>
								<li><a href="index-creative.html">Home Creative</a></li>
								<li><a href="index-agency.html">Home Agency</a></li>
								<li><a href="index-shop.html">Home Shop</a></li>
							</ul></li>
						<li class="submenu"><a href="javascript:void(0)">상품</a>
							<ul class="sub-menu" id="cateList">

							</ul></li>
						<li class="submenu"><a href="#">고객센터</a>
							<ul class="sub-menu">
								<li><a href="qnaBoard.do">QnA</a></li>
								<li><a href="faqBoard.do">FAQ</a></li>
								<li><a href="noticeBoard.do">공지사항</a></li>
								<li><a href="personalBoard.do">1:1문의</a></li>
							</ul></li>

						<li><a href="manage/main.do">manage</a></li>

						<c:choose>
							<c:when test="${sessionScope.name eq null}">
								<li><a href="login.do">로그인</a></li>
								<li><a href="register.do">회원가입</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="#" id="loginState"><c:out
											value="${sessionScope.name}님 안녕하세요" /></a></li>
								<li><a href="modify.do">정보수정</a></li>
								<li><a href="logout.do">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
			<!--  END Menu  -->
			<!--  Button for Responsive Menu  -->
			<div id="menu-responsive-sidemenu">
				<div class="menu-button">
					<span class="bar bar-1"></span> <span class="bar bar-2"></span> <span
						class="bar bar-3"></span>
				</div>
			</div>
			<!--  END Button for Responsive Menu  -->
		</nav>
	</div>
	<nav>
		자전거 종류가 들어갈 자리
	
	</nav>
	
	
	
</header>
<!--  END Header & Menu  -->