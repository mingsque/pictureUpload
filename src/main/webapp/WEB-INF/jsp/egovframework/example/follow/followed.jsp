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
							<div style="border:solid 1px; border-color:#E6E6E6">
							<p>아이디 : ${followedList.id}</p>
							<c:choose>
								<c:when test="${followedList.comment eq null or empty followedList.comment }">
									<img src="uploaded//default_profile_picture.png" alt="" height="150" width="150">
								</c:when>
								<c:otherwise>
									<img src="${followedList.profilePicture }" alt="" height="150" width="150">
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${followedList.comment eq null or empty followedList.comment }">
									<p>한마디 : 없음</p>
								</c:when>
								<c:otherwise>
									<p>한마디 : ${followedList.comment }</p>	
								</c:otherwise>
							</c:choose>
						</div>	
					</c:forEach>
			</section>
		</div>
	</div>
</div>
