<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

$(document).ready(function(){
	
	var popupWindow;
	
	$(".detailView").click(function(){
		
		var seqNo = $(this).children().children().eq(1).children().eq(2).attr('data-filter');
		
		var popWidth = $(this).children().children().eq(0).prop('naturalWidth');
		
		var url = $(this).children().children().eq(0).attr('src');
		
		popWidth = (popWidth > 500) ? popWidth + 200 : 800; 
		
		//쿠키에 특수문자가 안들어감, 인코딩 디코딩필요
		//encodeURIComponent(value);
		//decodeURIComponent(value);
		
		//쿠키 생성 및 추가
		if(typeof $.cookie("lastViewCookie")==='undefined'){
			$.cookie("lastViewCookie", url, {expires : 1});
		} else {
			var lastView = $.cookie("lastViewCookie")+","+url;
			$.cookie("lastViewCookie", lastView, {expires : 1});
		}	
		
		if($("#recentList").children().length === 5 ) {
			$("#recentList").children().last().remove();
		}
		
		$("#recentList").prepend("<li><a href='pictureDetail.do?seq_no="+seqNo+"'><img src='"+url+"' width=70px height=70px/></a></li>");
		
		if(typeof popupWindow !== 'undefined') {
			popupWindow.close();
		}
		
		popupWindow = window.open("pictureDetail.do?seq_no="+seqNo,"Detail","width="+ popWidth + ", height=800");
		
	})	
})

//@rnum := 0; 변수의 선언과 동시에 대입한다.

</script>



<div id="page-content">
	<div id="home-wrap" class="content-section">
		<div class="container">
			<section id="projects" data-isotope="load-simple"
				class="page padding-bottom-null">
				<div class="row no-margin text-left">
					<div class="col-sm-12 padding-leftright-null">
						<div class="filter-wrap left">
							<ul class="col-md-12 filters uppercase padding-leftright-null">
								<li><a href="">추천순</a></li>
								<li>최신순</li>
							</ul>
							<!-- data-xxx 의미는 없지만 데이터 저장용으로 사용할 수 있는 태그-->
							<ul class="col-md-12 filters uppercase padding-leftright-null">
								<li data-filter="*" class="is-checked">All</li>
								<li data-filter=".design">Design</li>
								<li data-filter=".branding">Branding</li>
								<li data-filter=".photography">Photography</li>
								<li data-filter=".web">Web</li>
								<li data-filter=".app">Apps</li>
							</ul>
						</div>
					</div>
				</div>
					
				<div style="text-align:center; font-size:20px">
					<c:if test="${pageGroup > 1 }">
						<a href="getPage.do?page=${startPage-1 }" > < </a>
					</c:if>
					<c:forEach begin="${startPage }" end="${endPage }" varStatus="status">
						<a href="getPage.do?page=${startPage + status.count - 1}">${startPage + status.count - 1 }</a>
					</c:forEach>
					<c:if test="${pageGroup < lastGroup }">
						<a href="getPage.do?page=${endPage+1 }" > > </a>
					</c:if>
				</div>

				<div class="projects-items equal three-columns">
					<c:forEach items="${pictureList }" var="pictureList">
						<div class="single-item styled one-item detailView">
							<div class="item">
								<img src="${pictureList.url }" alt="" height="300" width="300">
								<div class="content">
									<h3>${pictureList.writer }</h3>
									<p>${pictureList.title }</p>
									<input type="hidden" data-filter="${pictureList.seqNo }"/>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</section>
			<!-- END Portfolio -->
		</div>
	</div>
</div>
<!--  END Page Content -->