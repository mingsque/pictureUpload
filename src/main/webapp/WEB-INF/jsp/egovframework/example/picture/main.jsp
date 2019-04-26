<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

$(document).ready(function(){
	
	var popupWindow;
	
	$(".detailView").click(function(){
		
		var seqNo = $(this).parent().find(".pictureListSeqNo").attr('data-filter');
		
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
	
	$(".pictureListWriter").click(function(){
		
		if($(this).hasClass("openList") === false) {
			$(this).addClass("openList");
			$(this).next().show();
		} else {
			$(this).removeClass("openList");
			$(this).next().hide();
		}
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


							<h3>사진 게시판</h3>
							<form action="pictureBoardSearch.do">
								<div align=right>
									<input name="keyword" style="diplsy:inline-block; height:38px; vertical-align:middle; padding:0.5rem 0.75rem; border-radius:0.25rem; border:1px solid" type="text" />
									<input type="submit" value="검색" class="btn btn-outline-dark">
									<button type="button" id="writeBtn" style="" class="btn btn-outline-dark">글쓰기</button>
								</div>
							</form>

							<ul class="filters">
								<li style="padding:0px;"><a href="favoritePictureList.do">추천순</a></li>
								<li><a href="pictureMain.do">최신순</a></li>
							</ul>
														
							<!-- 
							 data-xxx 의미는 없지만 데이터 저장용으로 사용할 수 있는 태그
							<ul class="col-md-12 filters uppercase padding-leftright-null">
								<li data-filter="*" class="is-checked">All</li>
								<li data-filter=".design">Design</li>
								<li data-filter=".branding">Branding</li>
								<li data-filter=".photography">Photography</li>
								<li data-filter=".web">Web</li>
								<li data-filter=".app">Apps</li>
							</ul> -->
						</div>
					</div>
				</div>
					
				<div style="border:solid 1px; border-color:#E6E6E6" class="projects-items equal four-columns">
					<c:forEach items="${pictureList }" var="pictureList">
						<div class="single-item styled one-item">
							<div class="item">
								<img class="detailView" src="${pictureList.url }" alt="" height="300" width="300">
								<p class="detailView">${pictureList.title }</p>
								<h3 class="pictureListWriter">${pictureList.writer }</h3>
								<div style="display:none; float:left; border:solid 1px; border-color:#E6E6E6" class="writerAbout">
									<ul>
										<li><a href="follow.do">팔로우 하기</a></li>
										<li><a href="writeBoardList.do">작성한 글</a></li>
									</ul>
								</div>
								<input class="pictureListSeqNo" type="hidden" data-filter="${pictureList.seqNo }"/>
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