<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

$(document).ready(function(){
	//naturalWidth는 img태그의 속성으로 가지고 있는듯함, .naturalWidth로 접근 불가
	var originWidth	= $('#picture').prop('naturalWidth');
	var originHeight= $('#picture').prop('naturalHeight');
	
	$('#picture').attr('width'	,originWidth);
	$('#picture').attr('height'	,originHeight);
	
	$('.confirmReply').hide();

	$('.modReply').click(function(){
		
		var content = $(this).prev().prev().html();
		$(this).prev().prev().html("<textarea id='content' class='form-control' rows=1>"+content+"</textarea>");
		
		$('.modReply').hide();
		$('.deleteReply').hide();
		$('.confirmReply').show();
	})
	
	$('.deleteReply').click(function(){
		
		var that	= $(this);
		var seqNo	= $(this).parent().attr("data-filter");
		var form = {
				"seqNo"		: seqNo,
				};
		$.ajax({
			url			:	"deleteReply.do",
			type		:	"post",
			data		:	JSON.stringify(form), //json형태의 String임
			contentType :	"application/json",
			async: false, //ajax 동기 비동기, 리턴값이 돌아오는걸 기다림
			success : function(data) {
				var jObj = JSON.parse(data);
				if (jObj.result === "success") {
					that.parent().remove();
				}
				if (jObj.result === "FALSE") {
					alert("수정실패");
				}
			}
		});
		
	})
	
	$('.confirmReply').click(function(){
		var that	= $(this);
		var seqNo	= $(this).parent().attr("data-filter");
		//td 태그 아래 textarea를 추가했기 때문에 자식이 하나 더 생겼음, 앞으론 주의할 것
		var content = $(this).parent().children().eq(1).children().val();
		var form = {
				"seqNo"		: seqNo,
				"content"	: content 
				};
			
		$.ajax({
			url			:	"modReply.do",
			type		:	"post",
			data		:	JSON.stringify(form), //json형태의 String임
			contentType :	"application/json",
			async: false, //ajax 동기 비동기, 리턴값이 돌아오는걸 기다림
			success : function(data) {
				var jObj = JSON.parse(data);
				if (jObj.result === "success") {
					that.parent().children().eq(1).children().remove();
					that.parent().children().eq(1).text(content);	
				}
				if (jObj.result === "FALSE") {
					alert("수정실패");
				}
			}
		});
		$('.modReply').show();
		$('.deleteReply').show();
		$('.confirmReply').hide();
	});
	
	$("#favoriteBtn").click(function(){
		
		var favoriteIcon = $("#heartIcon").attr("class");
		var favoriteState;
		var boardNo = ${pictureDetail.seqNo};
		
		if(favoriteIcon === "fa fa-heart-o") {
			favoriteState = "noFavorite";
		} else {
			favoriteState = "favorite";
		}
		
		var form = {
				id 				: "${sessionScope.id}",
				favoriteState	: favoriteState,
				boardNo			: boardNo
		};
		
		$.ajax({
			url			:	"favorite.do",
			type		:	"post",
			data		:	JSON.stringify(form), //json형태의 String임
			contentType :	"application/json",
			async: false, //ajax 동기 비동기, 리턴값이 돌아오는걸 기다림
			success : function(data) {
				var jObj = JSON.parse(data);
				if (jObj.result === "success") {

				}
				if (jObj.result === "FALSE") {
					alert("수정실패");
				}
			}
		});
		
	
		if(favoriteIcon === "fa fa-heart-o") {
			$("#heartIcon").removeClass("fa fa-heart-o");
			$("#heartIcon").addClass("fa fa-heart");
		} else{
			$("#heartIcon").removeClass("fa fa-heart");
			$("#heartIcon").addClass("fa fa-heart-o");
		}
	
	});
})


</script>

<body style="background-color:#fff">
	<div style="background-color:#fff; margin:20px">
		<div class="container">
			<table class="table table-border">
				<tr>
					<th style="white-space:nowrap; width:85%">제목 : ${pictureDetail.title }</th>
					<th style="white-space:nowrap; width:5%">글쓴이 : ${pictureDetail.writer }</th>
					<th style="white-space:nowrap; width:5%">수정일 : ${pictureDetail.modDate }</th>
					<th style="white-space:nowrap; width:5%">추천수 : ${pictureDetail.favoriteCount }</th>
				</tr>
				<tr>
					<td colspan="3">${pictureDetail.content }</td>			
				</tr>
			</table>
			<img id="picture" src="${pictureDetail.url }" alt="" height="500" width="500">
	    </div>
	    
	    
	    <c:if test="${sessionScope.id ne null}">
			<div>
				<p id="favoriteBtn" style="text-align:center">좋아요 <i id="heartIcon" 
					<c:choose>
						<c:when test="${pictureDetail.myFavorite eq 'Y' }">
							class="fa fa-heart">
						</c:when>
						<c:otherwise>
							class="fa fa-heart-o">				
						</c:otherwise>
					</c:choose>
				</i></p>		
			</div>
		</c:if>
	    
	    <div id="replyList">
	    	<table class="table">
				<c:forEach items="${picturBoradReplyList}" var="picturBoradReplyList">
					<tr data-filter="${picturBoradReplyList.seqNo }">
						<td style="white-space:nowrap; width:5%">${picturBoradReplyList.writer }</td>
						<td style="white-space:nowrap; width:auto">${picturBoradReplyList.content }</td>
						<td style="white-space:nowrap; width:10%">${picturBoradReplyList.modDate }</td>
						<c:if test="${picturBoradReplyList.writer eq sessionScope.id }">
							<td style="white-space:nowrap; width:5%" class="modReply">수정</td>
							<td style="white-space:nowrap; width:5%" class="deleteReply">삭제</td>
							<td style="white-space:nowrap; width:5%" class="confirmReply">확인</td>
						</c:if>
					</tr>
				</c:forEach>   	
	    	</table>
	    </div>
		
		<div style="margin:10px">
	    	<form id="reply_form" action="setReply.do" method="post">
	    		
	    		<c:choose>
	    			<c:when test="${sessionScope.id eq null}">
	    					<p style="border:1px solid #e9ecef; padding:10px">댓글을 입력하려면 <a href="login.do">로그인</a>을 해주세요<p>
	    			</c:when>
	    			<c:otherwise>
		    			<div class="form-row">
				    		<div class="col-10">
				    			<input type="text" class="form-control" name="content" placeholder="댓글을 입력해주세요">
				    			<input type="hidden" name="writer" value="${sessionScope.id}">
				    			<input type="hidden" name="boardNo" value="${pictureDetail.seqNo}">
				    		</div>
				    		<div class="col-2">
				    			<button class="form-control" type="submit" id="replyBtn">등록</button>
				    		</div>
			    		</div>
	    			</c:otherwise>
	    		</c:choose>
	    	</form>
	    </div>
	</div>    
</body>

            