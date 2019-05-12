<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<html lang="en">

<head>
<meta charset="utf-8">
<!-- Styles -->
<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Font awesome CSS -->
<link href="css/metroKing/css/font-awesome.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/metroKing/css/style.css?ver=1" rel="stylesheet" type="text/css"/>

<!-- Favicon -->
<link rel="shortcut icon" href="#">
</head>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js/jquery.min.js"></script>



<script>

$(function(){
	$("#id").val("${userInfo.id}");
	$("#phone_number").val("${userInfo.phone_number}");
	$("#name").val("${userInfo.name}");
	$("#e_mail").val("${userInfo.e_mail}");
	$("#address").val("${userInfo.address}");
	$("#address_detail").val("${userInfo.address_detail}");
	$("#post_number").val("${userInfo.post_number}");
	$("#comment").val("${userInfo.comment}");
	var sex = "${userInfo.sex}";
	if(sex === "남") {
		$("#male").attr("checked",true);
		
	} else {
		$("#female").attr("checked",true);;
	}
	
})

</script>

<script>

function daumPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $("#post_number").val(data.zonecode); //5자리 새우편번호 사용
            $("#address").val(fullAddr);

            // 커서를 상세주소 필드로 이동한다.
            $("#address_detail").removeAttr("readonly");
            $("#address_detail").focus();
 
        }
    }).open();
}
</script>


<script>

	var check = {			
			//적절한 패스워드 실시간 판단 스크립트
			password : function() {
				var password	= $("#password").val();
				var pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

				if (password.length === 0) {
					$("#passwordCheckResult").text("");
				}
				
				else if (password.length<8 || password.length>16) {
					$("#passwordCheckResult").text("비밀번호를 8~16자리로 입력해주세요.");
				}

				else if (pattern.test(password) != true) {
					$("#passwordCheckResult").text("비밀번호에 특수문자를 포함하여 주세요.");
				}

				else {
					$("#passwordCheckResult").text("");
				}
			},
		
			eMail : function() {
				
				var emailPattern = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
				var email = $("#e_mail").val();
				
				
				if ( email.length === 0 ) {	
					$("#eMailCheckResult").text("");
				} 
				
				if ( emailPattern.test(email) != true ) {	
					$("#eMailCheckResult").text("올바른 이메일 형식이 아닙니다.");
				} else {
					$("#eMailCheckResult").text("");
				} 
			},
			
			submit : function() {
				
				var submitOk = true;
				
				var id			= $("#id").val();
				var password	= $("#password").val();
				var adress		= $("#address").val();
				var postAdress	= $("#post_number").val();
				var rePassword	= $("#password-confirm").val();
				var name		= $("#name").val();
				var phonenumber	= $("#phone_number").val();
				var email		= $("#e_mail").val();
				
				var idPattern			= /^[A-z0-9_]{4,20}$/;
				var passwordPattern		= /[`~!@#$%^&*|\\\'\";:\/?]/gi;
				var emailPattern 		= /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
				
				if (id.length === 0) {	
					alert("아이디를 입력해 주세요.");
					submitOk = false;
				} else if ( id.length<4 || id.length>20 ) {
					alert("아이디는 4~20글자 입니다.");
					submitOk = false;
				} else if ( idPattern.test(id) != true) {
					alert("아이디는 영문과 숫자 조합입니다.");
					submitOk = false;
				}
				
				else if (password.length === 0) {	
					alert("비밀번호를 입력해 주세요.");
					submitOk = false;
				} else if (password.length<4 || password.length>20 ) {
					alert("비밀번호는 8~16글자 입니다.");
					submitOk = false;
				} else if (passwordPattern.test(password) != true) {
					alert("비밀번호에 특수문자가 없습니다.");
					submitOk = false;
				} else if (password !== rePassword) {
					alert("비밀번호를 다시 확인해주세요");
					submitOk = false;
				}
				
				else if ( name.length === 0 ) {
					alert("이름을 입력해주세요.");
					submitOk = false;
				} else if ( name.length > 10 ) {
					alert("이름은 10글자 이하 입니다.");
					submitOk = false;
				} 
				
				else if ( phonenumber.length === 0 ) {	
					alert("핸드폰 번호를 입력해주세요.");
					submitOk = false;
				} else if ( phonenumber.length > 30 ) {
					alert("유효하지 않는 핸드폰 번호입니다.");
					submitOk = false;
				} else if ( isNaN(phonenumber) === true ) {
					alert("유효하지 않는 핸드폰 번호입니다.");
					submitOk = false;
				} 
				
				else if (postAdress.length === 0) {
					alert("우편번호를 적어주세요.");
					submitOk = false;
				}
				
				else if ( email.length === 0 ) {	
					alert("이메일을 입력해주세요.");
					submitOk = false;
				} else if ( emailPattern.test(email) != true ) {	
					alert("올바른 이메일이 아닙니다.");
					submitOk = false;
				}
				
				else if ( $("#male").prop("checked") === false && $("#female").prop("checked") === false ) {
					alert("성별을 체크해주세요");
					submitOk = false;
				}
				
				if (submitOk == true) {
					alert("가입가능");
					
					$("#frm").attr("action","modifyAction.do");
					$("#frm").submit();
				}		
			}			
	}

</script>

<body>

	<div class="admin-form">
		<!-- Widget starts -->
		<div class="widget wred">
			<div class="widget-head">
				<i class="fa fa-lock"></i> Modify
			</div>
			<div class="widget-content">
				<div class="padd">
					<form class="form-horizontal" method="post" enctype="multipart/form-data" id="frm">
						<!-- Registration form starts -->
						<!-- Userid -->
						<div class="form-group">
							<label class="col-sm-2 control-label" for="userid">아이디</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="id" name="id" readonly>
							</div>	
						</div>
							
						<!-- Password -->
						<div class="form-group">
							<label class="col-sm-2 control-label" for="password">비밀번호</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="password" name="password" onkeyup="check.password()">
								<p style="color:red" id="passwordCheckResult"><p>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-2" for="password-confirm">비밀번호 확인</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="password-confirm" name="password-confirm">
							</div>
						</div>

						<!-- Name -->
						<div class="form-group">
							<label class="control-label col-sm-2" for="name">이름</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="name" name="name">
							</div>
						</div>

						<!-- Phone -->
						<div class="form-group">
							<label class="control-label col-sm-2" for="phone_number">핸드폰</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="phone_number" name="phone_number">
							</div>
						</div>
						
						<!-- adress -->
						<div class="form-group">
							<label class="control-label col-sm-2" for="post_address">우편번호</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="post_number" name="post_number" readonly>
								
							</div>
							<div class="col-sm-2">
								<button type="button" class="btn btn-default" onclick="daumPostCode()">우편번호 찾기</button>
							</div>							
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-2"></label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="address" name="address", placeholder="주소" readonly>
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="address_detail" name="address_detail" placeholder="상세주소" readonly>
							</div>					
						</div>

						<!-- E-mail -->
						<div class="form-group">
							<label class="control-label col-sm-2">E-MAIL</label>							
							<div class="col-sm-10">
								<input type="text" class="form-control" id="e_mail" name="e_mail" onkeyup="check.eMail()">
								<p style="color:red" id="eMailCheckResult"><p>
							</div>
							<!-- 
							<div class="col-lg-4">
								<select class="form-control">
									<option>&nbsp;</option>
									<option>naver.com</option>
									<option>daum.net</option>
									<option>gmail.com</option>
									<option>직접입력</option>
								</select>
							</div>
							 -->
						</div>
						
						<!-- sex -->
						<div class="form-group">
							<label class="control-label col-sm-2">성별</label>	
							<div class="col-sm-8">
								<label class="radio-inline">
									<input type="radio" name="sex" value="남 " id="male">남
								</label>
								<label class="radio-inline">
									<input type="radio" name="sex" value="여" id="female">여
								</label>
							</div>
						</div>
						
						<!-- comment -->
						<div class="form-group">
							<label class="control-label col-sm-2" for="comment">한 마디</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="comment" name="comment">
							</div>
						</div>
						
						<!-- 프로필 사진 -->
						<div class="form-group">
							<label class="control-label col-sm-2" for="profile_picture">프로필 사진</label>
							<div class="col-sm-10">
								<input type="file" id="profile_picture" name="profile_picture">
							</div>
						</div>
						
						<!-- Accept box and button s-->
						<div class="form-group">
							<div class="col-sm-12 col-sm-offset-2">
							<!-- 
								<div class="checkbox">
									<label> <input type="checkbox"> Accept Terms
										&amp; Conditions
									</label>
								</div>
							 -->
								<!-- 
							  <button type="submit" class="btn btn-danger">Register</button>
							  <button type="reset" class="btn btn-success">Reset</button>
							   -->
								<button type="button" class="btn btn-default" onclick="check.submit()">등록</button>
								<button type="reset" class="btn btn-default">초기화</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="widget-foot">
				이미 가입 하셨나요 ? <a href="login.do">로그인</a>
			</div>
		</div>
	</div>

	<!-- Javascript files -->
	<!-- jQuery -->
	<script src="js/jquery.js"></script>
	<!-- Bootstrap JS -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Respond JS for IE8 -->
	<script src="js/respond.min.js"></script>
	<!-- HTML5 Support for IE -->
	<script src="js/html5shiv.js"></script>
</body>
</html>