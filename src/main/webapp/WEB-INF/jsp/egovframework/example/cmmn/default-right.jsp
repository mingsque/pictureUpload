<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<script>
	
	$().ready(function(){
		var lastViewList = $.cookie("lastViewCookie");	
		var temp = lastViewList.split(',');	
		
		for(i=0; i<5; i++) {
			console.log(temp[temp.length-1-i]);
			
			$("#recentList").append("<li><img src='"+temp[temp.length-1-i]+"' width=80px height=80px/></li>");
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

