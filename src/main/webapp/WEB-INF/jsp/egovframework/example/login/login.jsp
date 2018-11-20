<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
	<head>	
		<!-- Styles -->
		<!-- Bootstrap CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<!-- Custom CSS -->
		<link href="css/metroKing/css/style.css" rel="stylesheet">
		<!-- Favicon -->
		<link rel="shortcut icon" href="#">

		<!-- 
		<link href="css/metroKing/css/font-awesome.min.css" rel="stylesheet">
		 -->
	</head>
	<!-- jQuery -->
	<script src="js/jquery.js"></script>
	<!-- RSA -->
	<script src="js/rsa/jsbn.js"></script>
	<script src="js/rsa/prng4.js"></script>
	<script src="js/rsa/rsa.js"></script>
	<script src="js/rsa/rng.js"></script>
	
	<script type="text/javascript">
	$(function(){
		$("#loginResultMessage").text("${sessionScope.error}");
		
		var RSAModulus 	= "${RSAModulus}";
		var RSAExponent = "${RSAExponent}";
		
		if(RSAModulus == ""){
			location.href = "login.do";
		}
		
		$("#loginBtn").click(function(){
			
			var validationChk = validationChkFn();
			
			if(validationChk === false){
				 
			} else { 
				var rsa = new RSAKey();
				rsa.setPublic(RSAModulus, RSAExponent);
				
				var id			= $("#inputId");
				var password	= $("#inputPassword");
				
				id.val(rsa.encrypt(id.val()));
				password.val(rsa.encrypt(password.val()));
				
				$("#frm").submit();
			}
		});
	});
		
	var validationChkFn = function() {
		var inputNotEmpty	= true;
		var allInputSpace	= $("input");
		
		allInputSpace.each(function(){
			//this, $(this)의 주의 
			//$this는 제이쿼리 오브젝트인데 input을 제이쿼리 타겟으로 잡아왔으니 제이쿼리 오브젝트로 받아와야함
			//this를 찍어보면 input문장이 그래도 들어가있음
			//제이쿼리 객체를 계속 만들어서 쓸 필요는 없음 $this
			var $this = $(this);
			
			if($this.val() === "") {
				inputNotEmpty = false;
				
				alert($this.attr("title") + "은(는) 필수 입력 사항입니다.");
			
				$this.focus();
				
				return false;
			}
		})
		return inputNotEmpty;
	}
	</script>
	
	<body>
		<!-- Form area -->
		<div class="admin-form">
			<!-- Widget starts -->
			<div class="widget worange">
				<!-- Widget head -->
				<div class="widget-head">
					<i class="fa fa-lock"></i> Login 
				</div>

				<div class="widget-content">
					<div class="padd">
						<!-- Login form -->
						<form class="form-horizontal" method="post" action="loginAction.do" id="frm">
							<!-- ID -->
							<div class="form-group">
								  <label class="control-label col-lg-2" for="inputId">아이디</label>
								  <div class="col-lg-9">
									<input type="text" class="form-control" title="아이디" id="inputId" name="inputId" placeholder="ID">
								  </div>
							</div>
				
							<!-- Password -->
							<div class="form-group">
								  <label class="control-label col-lg-2" for="inputPassword">비밀번호</label>
								  <div class="col-lg-9">
									<input type="password" class="form-control" title="비밀번호" id="inputPassword" name="inputPassword" placeholder="Password">
								  </div>
							</div>
							
							<div class="form-group">
							 	  <label class="control-label col-lg-2"></label>
								  <div class="col-lg-9">
									<p style="margin:0px 10px; color:red" id="loginResultMessage"></p>
								  </div>
							</div>
								
							<div class="form-group">
								<div class="col-lg-9 col-lg-offset-2">
									<button type="button" class="btn btn-default" id="loginBtn">로그인</button>
									<button type="reset" class="btn btn-default">초기화</button>
								</div>
							</div>
						</form>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="widget-foot">
				  회원가입을 아직 안하셨나요? <a href="register.do">&nbsp;&nbsp;회원가입</a>
				</div>
			</div>  
		</div>

		<!-- Javascript files -->
		<!-- Bootstrap JS -->
		<script src="js/bootstrap.min.js"></script>
		<!-- Respond JS for IE8 -->
		<script src="js/respond.min.js"></script>
		<!-- HTML5 Support for IE -->
		<script src="js/html5shiv.js"></script>
	</body>	
</html>