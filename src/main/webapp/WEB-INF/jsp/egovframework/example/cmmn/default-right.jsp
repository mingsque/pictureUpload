<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<script>
	
	$().ready(function(){
		var lastViewList = $.cookie("lastViewCookie");	
		var temp = lastViewList.split(',');	
		
		for(i=0; i<5; i++) {
			console.log(temp[temp.length-1-i]);
			
			$("#recentList").append("<li><img src='"+temp[temp.length-1-i]+"' width=70px height=70px/></li>");
		}
		
	})

</script>


<div style="position:fixed; right:100px; top:300px; z-index:2;">
	
	<div>
		<p>최근 본 사진</p>		
		<ul id="recentList">
		
		</ul>
	</div>
	
</div>

