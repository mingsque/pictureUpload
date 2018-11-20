<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
* {
    box-sizing: border-box;
}

input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}

input[type=checkbox] {
	width: 20px;
	height: 20px;
}

input[type=button] {
	padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}


label {
    padding: 12px 12px 12px 0;
    display: inline-block;
}

input[type=submit] {
    background-color: #008299;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float: right;
}

/* input[type=submit]:hover {
    background-color: #45a049;
} */

.container {
	margin: 2% 20%;
    border-radius: 5px;
    /* background-color: #f2f2f2; */
}

.col-25 {
    float: left;
    width: 25%;
    margin-top: 6px;
}

.col-75 {
    float: left;
    width: 75%;
    margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}

.row{
	margin-top: 1%;
}

@media screen and (max-width: 600px) {
    .col-25, .col-75, input[type=submit] {
        width: 100%;
        margin-top: 0;
    }
}
</style>

<script type="text/javascript">

	function showPopup(){
		window.open("/uploadPicture.do","a","width = 400,height = 250, left = 550, top = 200");
	}

</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<div class="container">

  <h3>1:1 문의</h3>
  <form action="/action_page.php">
  
  
  <div class="row">
      <div class="col-25">
        <label for="country">문의 유형</label>
      </div>
      <div class="col-75">
        <select id="country" name="country">
          <option value="australia">상품 정보 문의</option>
          <option value="canada">로그인 / 회원가입 문의</option>
          <option value="usa">기타 문의</option>
        </select>
      </div>
    </div>
    
    
    <div class="row">
      <div class="col-25">
        <label for="fname">제목</label>
      </div>
      <div class="col-75">
        <input type="text" id="fname" name="firstname">
      </div>
    </div>
    
    
    <div class="row">
      <div class="col-25">
        <label for="subject">내용</label>
      </div>
      <div class="col-75">
        <textarea id="subject" name="subject" placeholder="Write Content...." style="height:200px"></textarea>
      </div>
    </div>
    
    
    <div class="row">
      <div class="col-25">
        <label for="fname">사진 첨부</label>
      </div>
      <div class="col-75">
        <input type="button" id="fname" name="firstname" value="사진" onclick="showPopup();">
      </div>
    </div>
    
    <div class="row">
      <div class="col-25">
        <label for="fname">답변 알림</label>
      </div>
      <div class="col-75">
        <input type="checkbox" id="fname" name="firstname"> SMS로 받기
        <input type="checkbox" id="fname" name="firstname"> 이메일로 받기
      </div>
    </div>
    
    
     <div class="row">
      <div class="col-25">
        <label for="fname">이메일</label>
      </div>
      <div class="col-75">
        <input type="text" id="fname" name="firstname">
      </div>
    </div>
    
     <div class="row">
      <div class="col-25">
        <label for="fname">휴대폰 번호</label>
      </div>
      <div class="col-75">
        <input type="text" id="fname" name="firstname">
      </div>
    </div>
    
    <div class="row">
      <input type="submit" value="등록">
    </div>
    
    
  </form>
</div>



</body>
</html>