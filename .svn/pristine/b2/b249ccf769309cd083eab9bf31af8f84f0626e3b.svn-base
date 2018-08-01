<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>LSB-Modify</title>
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  
  
  
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">Register an Modify</div>
      <div class="card-body">
        <form method="post" id="formId">
          <!-- <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputName">First Name</label>
                <input class="form-control" id="exampleInputName" type="text" aria-describedby="nameHelp" placeholder="Enter First Name">
              </div>
              <div class="col-md-6">
                <label for="exampleInputLastName">Last name</label>
                <input class="form-control" id="exampleInputLastName" type="text" aria-describedby="nameHelp" placeholder="Enter last name">
              </div>
            </div>
          </div> -->
          <div class="form-group">
            <label for="usr">Id</label>
            <input class="form-control" id="usr" type="text" name="id" disabled value="${nowUser.id }">
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="pwd">Password</label>
                <input class="form-control" id="pwd" type="password" name="pw" onchange="validationPw(this)" placeholder="Password">
              	<div style="color:red; display:none;" id="inforPw">비밀번호는 영문자와 숫자가 1개이상 포함되어야 하며, 8자~20자이어야 합니다.</div>
              </div>
              <div class="col-md-6">
                <label for="cfpwd">Confirm password</label>
                <input class="form-control" id="cfpwd" type="password" name="cfpw" onchange="validationCheck(this)" placeholder="Confirm password">
              	<div style="color:red; display:none;" id="inforCfpw">비밀번호가 일치하지 않습니다.</div>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <label for="exampleInputName">Name</label>
            <input class="form-control" id="name" type="text" name="name" value="${nowUser.name }">
          </div>
          
          
          
          <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <input class="form-control" id="email" name="email" type="email" value="${nowUser.email }">
          </div>
          
          <button type="submit" class="btn btn-primary btn-block">Modify</button>	  	    
		  
		  
        </form>
        
        <div class="text-center">
          
          <a class="d-block small mt-3" href="login">Login Page</a>
          <a class="d-block small" href="index">Cancel</a>
          <a class="d-block small" onclick="signout_event()" href="/member/withdraw"/>Sign Out</a>
          
          
        </div>
      </div>
    </div>
  </div>
  
  <script>
	function validationId(id){
		var inforId = document.getElementById('inforId');
		var idText = id.value;
		var idRegex = /^\w{5,10}$/;
		inforId.style.display = 'none';
		if(idText != null && idRegex.test(idText)){
			return true;
		}
		else{
			inforId.style.display = 'block';
			return false;
		}
	}
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
	function validationCheck(cfpw){
		var pw = document.getElementById('pwd').value;
		document.getElementById('inforCfpw').style.display='none';
		if(pw == cfpw.value){
			return true;
		}
		else{
			document.getElementById('inforCfpw').style.display='block';
			return false;
		}
	}
	var formId = document.getElementById('formId');
	formId.onsubmit = function(){
		var id = document.getElementById('usr');
		var pw = document.getElementById('pwd');
		var cfpw = document.getElementById('cfpwd');
		var isOk = true;//제출을 할건지 말건지 결정하는 변수
		
		if(!validationId(id))
			isOk = false;
		if(!validationPw(pw))
			isOk = false;
		if(!validationCheck(cfpw))
			isOk = false;
		if(!isOk)
			return false;
		return true;
	}
	
	function signout_event(){
		if (confirm("${user.name}"+"님!" + " "+ "정말 탈퇴 하시겠습니까??") == true){    //확인
		    document.form.submit();
		}else{   //취소
			return;
		}
	}
	
  </script>
  
  
  
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
</body>

</html>
