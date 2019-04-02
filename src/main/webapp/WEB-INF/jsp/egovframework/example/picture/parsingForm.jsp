<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>

$().ready(function(){

	$("#submitButton").click(function(){
		
		var form = {
				"url"	: $("#url").val()
				};
	
		$.ajax({
		url			:	"pictureParsing.do",
		type		:	"post",
		data		:	JSON.stringify(form), //json형태의 String임
		contentType :	"application/json",
		async: false, //ajax 동기 비동기, 리턴값이 돌아오는걸 기다림
		success : function(data) {
			var jObj = JSON.parse(data);
			if (jObj.result === "success") {
			}
			if (jObj.result === "FALSE") {
			}
		}
	});
})

})




</script>

<body>
	<div class="container">
		<div style="margin:30px auto">
			<form method="post">
	
				<div class="form-group">
					<label for="url">URL</label>
					<input class="form-control" name="url" id="url"/>
				</div>
				
	 			<div class="form-group">
	 				<textarea id="" class="form-control" rows="5"></textarea>
				</div>
				<button style="margin:20px auto" id="submitButton"class="float-right btn btn-default" type="button">파싱요청</button>
	 		</form>
 		</div>            
    </div>
</body>

            