<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<body>
	<div class="container">
		<div style="margin:30px auto">
			<form method="post" action="pictureUpload.do" enctype="multipart/form-data">
				<div class="form-group">
					<label for="title">제목</label>
					<input class="form-control" id="title" name="title" type="text">
				</div>
	
				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" name="content" id="content" rows="8"></textarea>
				</div>
				
				<div class="form-group">
					<label for="content">해시태그</label>
					<textarea class="form-control" name="hashtag" id="hashtag" rows="2"></textarea>
				</div>
				
	 			<div class="form-group">
					<label for="file">첨부파일</label> 
					<input id="file" type="file" name="file"> 
				</div>
				
				<button style="margin:20px auto" class="float-right btn btn-default" type="submit">글쓰기</button>
	 		</form>
 		</div>            
    </div>
</body>

            