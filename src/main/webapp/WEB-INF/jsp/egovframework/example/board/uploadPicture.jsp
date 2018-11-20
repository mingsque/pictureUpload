<%@page import="org.springframework.web.multipart.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">

.content{
	margin: 20% auto;
}

.file_input label {
	position: relative;
	cursor: pointer;
	display: inline-block;
	vertical-align: middle;
	overflow: hidden;
	width: 100px;
	height: 30px;
	background: #777;
	color: #fff;
	text-align: center;
	line-height: 30px;
}

.file_input label input {
	position: absolute;
	width: 0;
	height: 0;
	overflow: hidden;
}

.file_input input[type=text] {
	vertical-align: middle;
	display: inline-block;
	width: 400px;
	height: 28px;
	line-height: 28px;
	font-size: 11px;
	padding: 0;
	border: 0;
	border: 1px solid #777;
}

input[type=submit] {
    background: #777;
    color: white;
    width: 98%;
	height: 28px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-top: 10px;
}
</style>

<script type="text/javascript">
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="content">

	<form action="#" class="file_input">
		<div class="file_input">
		<input type="text" readonly="readonly" title="File Route" id="file_route">
			<label> 
			Search..
			<input type="file" onchange="javascript:document.getElementById('file_route').value=this.value">
			</label> 
		</div>
		
		<input type="submit" value="사용">
	</form>

</div>



</body>
</html>