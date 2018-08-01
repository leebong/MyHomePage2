<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
<!--
function button_event(){
	if (confirm("${user.name}"+"님!" + " "+ "정말 탈퇴 하시겠습니까??") == true){    //확인
	    document.form.submit();
	}else{   //취소
		return;
	}
}

//-->
</script>

</head>
<body>
<div class="container">
<h1>
	회원정보 수정
</h1>
  <form method="post" id="formId">
    <div class="form-group">
      <label for="usr">Id:</label>
      <input type="text" class="form-control" id="usr" name="id" disabled
      value="${nowUser.id }">
    </div>
    
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" name="pw"
      	onchange="validationPw(this)" value="">
      <div style="color:red; display:none;" id="inforPw">
	     	비밀번호는 영문자와 숫자가 1개이상 포함되어야 하며, 8자~20자이어야 합니다.
	  </div>
    </div>
    
    <div class="form-group">
      <label for="pwd">Confirm Password:</label>
      <input type="password" class="form-control" id="pwdConfirm" name="pwConfirm"
      value="">
    </div>
    <div class="form-group">
      <label for="usr">email:</label>
      <input type="email" class="form-control" id="email" name="email"
      value="${nowUser.email }">
    </div>
    
    <button type="submit" class="btn btn-primary">회원정보 수정</button>
    
 
    <a href="/member/withdraw">
    <input type="button" onclick="button_event()" value="탈퇴" class="btn btn-danger"/> 
    </a>
    
    <a href="/board/list">
    <input type="button" value="취소" class="btn btn-primary"/> 
    </a>
  </form>
  
</div>
<script>
	
	function validationPw(pw){
		var inforPw = document.getElementById('inforPw');
		var pwText = pw.value;
		var pwRegex = /^(?=\w{8,20})(\w*((\d[a-zA-Z])|([a-zA-Z]\d))\w*)$/;
		inforPw.style.display = 'none';
		if(pwText != null && pwRegex.test(pwText)){
			return true;
		}
		else{
			inforPw.style.display = 'block';
			return false;
		}
	}
	var formId = document.getElementById('formId');
	formId.onsubmit = function(){
		var pw = document.getElementById('pwd');
		var isOk = true;//제출을 할건지 말건지 결정하는 변수
		
		if(!validationPw(pw))
			isOk = false;
		if(!isOk)
			return false;
		return true;
	}
	
</script>
</body>
</html>