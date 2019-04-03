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
			<div style="margin-top:40px;" >
			
				<div style="padding:25px 25px; margin:20px; border:solid 1px; border-color:#E6E6E6">
					<h3 style="padding-bottom:10px">공지사항</h3>
					<table id="noticeBoard" class="table table-border">
						<tbody>
							<tr>
								<td style="width:20%">공지카테고리1</td>							
								<td>공지사항1</td>
							</tr>
							<tr>
								<td style="width:20%">공지카테고리2</td>
								<td>공지사항2</td>
							</tr>
							<tr>
								<td style="width:20%">공지카테고리3</td>
								<td>공지사항3</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		
			<section style="margin:20px;border:solid 1px;border-color:#E6E6E6" id="projects" data-isotope="load-simple" class="page padding-bottom-null">

				<div style="text-align:left; font-size:20px">
					<h3>사진게시판</h3>
					<p style="display:inline-block"><a href="pictureMain.do">더 보기</a></p>
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