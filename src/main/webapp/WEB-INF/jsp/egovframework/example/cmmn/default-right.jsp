<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<script>

	var popupWindow;
	
	$(document).ready(function(){
		
		$("#recentList").on("click","li", function(){
			var seqNo = $(this).attr("data-filter");
					
			popupWindow = window.open("pictureDetail.do?seq_no="+seqNo,"Detail","width=800, height=800");
		});
		
		var lastViewList = $.cookie("lastViewCookie");	
		var lastViewListSeqNo = $.cookie("lastViewSeqNoCookie");
		var temp = lastViewList.split(',');	
		var seqTemp = lastViewListSeqNo.split(',');
		
		$("#recentList").children().remove();
		
		for(i=temp.length-1; i>temp.length-6; i--) {
			console.log(temp[temp.length-1-i]);
			
			$("#recentList").append("<li data-filter='"+seqTemp[i]+"'><img src='"+temp[i]+"'width=80px height=80px/></li>");
		}
	})

</script>


<div style="border:solid 1px; position:fixed; right:100px; top:200px; z-index:2;">
	
	<div style="text-align:center">
		<p>최근 본 사진</p>		
		<ul id="recentList">
		
		</ul>
	</div>
	
</div>

