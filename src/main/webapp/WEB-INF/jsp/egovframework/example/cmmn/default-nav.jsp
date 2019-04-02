<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<div class="container">
		<nav style="height:100px "class="navbar navbar-default">
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
						<li class="submenu"><a href="main.do">Home</a>
						
						</li>
						<!-- <li class="submenu"><a href="javascript:void(0)"
							class="active-item">Home</a>
							<ul class="sub-menu">
								<li><a href="index.html">Home Minimal</a></li>
								<li><a href="index-creative.html">Home Creative</a></li>
								<li><a href="index-agency.html">Home Agency</a></li>
								<li><a href="index-shop.html">Home Shop</a></li>
							</ul></li> -->
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
<!-- 
						<li><a href="manage/main.do">manage</a></li>
 -->						
 						<li><a href="pictureMain.do">게시판</a></li>
						
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
</header>
<!--  END Header & Menu  -->