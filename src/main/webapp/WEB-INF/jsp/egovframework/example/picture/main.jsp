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
			$.cookie("lastViewSeqNoCookie", seqNo, {expires : 1});
		} else {
			var lastView = $.cookie("lastViewCookie")+","+url;
			var lastViewSeqNo = $.cookie("lastViewSeqNoCookie")+","+seqNo;
			$.cookie("lastViewCookie", lastView, {expires : 1});
			$.cookie("lastViewSeqNoCookie", lastViewSeqNo, {expires : 1});
		}	
		
		if($("#recentList").children().length === 5 ) {
			$("#recentList").children().last().off();
			$("#recentList").children().last().remove();
		}
		
		$("#recentList").prepend("<li data-filter='"+seqNo+"'><img src='"+url+"' width=80px height=80px/></li>");
	
		/*
		$("#recentList li").click(function(){
			var seqNo = $(this).attr("data-filter");
			
			popupWindow = window.open("pictureDetail.do?seq_no="+seqNo,"Detail","width=800, height=800");
		});
		*/
		
		if(typeof popupWindow !== 'undefined') {
			popupWindow.close();
		}
		
		popupWindow = window.open("pictureDetail.do?seq_no="+seqNo,"Detail","width="+ popWidth + ", height=800");
		
	})	
	
	$("#writeBtn").click(function(){
	
		document.location.href="pictureWrite.do";
	})
})

//@rnum := 0; 변수의 선언과 동시에 대입한다.

</script>


<div id="page-content">
	<div id="home-wrap" class="content-section">
		<div class="container">
			<section id="projects" data-isotope="load-simple" class="page padding-bottom-null">
				<div class="row no-margin text-left">
					<div class="col-sm-12 padding-leftright-null">
						<div class="filter-wrap left">
							<ul class="col-md-12 filters uppercase padding-leftright-null">
								<li><a href="favoritePictureList.do">추천순</a></li>
								<li><a href="pictureMain.do">최신순</a></li>
							</ul>

							<form action="pictureBoardSearch.do">
								<div align=right>
									<input name="keyword" style="padding:0.5rem 0.75rem; border-radius:0.25rem; border:1px solid" type="text" />
									<input type="submit" value="검색" class="btn btn-outline-dark">
									<button type="button" id="writeBtn" style="" class="btn btn-outline-dark">글쓰기</button>
								</div>
							</form>
							
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
					
				<div class="projects-items equal four-columns">
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
				
				<div style="text-align:center; font-size:20px; margin-bottom:30px">
					<c:if test="${pageGroup > 1 }">
						<a href="getPicturePage.do?page=${startPage-1 }&viewMode=${viewMode}" > < </a>
					</c:if>
					<c:forEach begin="${startPage }" end="${endPage }" varStatus="status">
						<a href="getPicturePage.do?page=${startPage + status.count - 1}&viewMode=${viewMode}">${startPage + status.count - 1 }</a>
					</c:forEach>
					<c:if test="${pageGroup < lastGroup }">
						<a href="getPict
						urePage.do?page=${endPage+1 }&viewMode=${viewMode}" > > </a>
					</c:if>
				</div>
				
			</section>
			<!-- END Portfolio -->
		</div>
	</div>
</div>
<!--  END Page Content -->