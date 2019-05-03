<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

$(document).ready(function(){
	
	
})

</script>

<div id="page-content">
	<div id="home-wrap" class="content-section">
		<div class="container">
			<section id="projects" data-isotope="load-simple" class="page padding-bottom-null">
			
			
				<h3 style="margin-bottom:10px;margin-top:10px; font-family:Sans-Serif;">나를 팔로우 한 사람</h3>
					<c:forEach items="${followedList}" var="followedList">
						<p>${followedList.id}</p>
						<div style="border:solid 1px; border-color:#E6E6E6" class="projects-items equal four-columns">
						
						<%-- <c:forEach items="${followBoardList }" var="followBoardList">
							<c:if test="${followList.follow eq followBoardList.writer}">
								<div class="single-item styled one-item">
									<div class="item">
									<img class="detailView" src="${followBoardList.url }" alt="" height="300" width="300">
									<p class="detailView">${followBoardList.title }</p>
									<p class="pictureListWriter">${followBoardList.writer }</p>
									<div style="display:none;border:solid 1px; border-color:#E6E6E6" class="writerAbout">
										<ul style="width:30%;font-size:12px">
											<li><a class="follow" href="#">팔로우 하기</a></li>
											<li><a href="writerPictureBoardList.do?writer=${followBoardList.writer }">작성한 글</a></li>
										</ul>
									</div>
										<input class="pictureListSeqNo" type="hidden" data-filter="${followBoardList.seqNo }"/>
									</div>
								</div>
							</c:if> 
						</c:forEach>--%>
						</div>					
					</c:forEach>
			</section>
		</div>
	</div>
</div>
