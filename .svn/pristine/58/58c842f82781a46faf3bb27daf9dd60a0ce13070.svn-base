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
  <title>LSB-Signup</title>
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <script src="/resources/jquery.validate.js"></script>
  <script src="/resources/additional-methods.js"></script>
  
  
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
      <div class="card-header">Register an Account</div>
      <div class="card-body">
      
        <form method="post" id="form">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputName">Id</label>
                <input class="form-control" id="id" type="text"  placeholder="Id">
             	<input class="btn btn-primary btn-block small mt-3" id="dup" type="button" aria-describedby="nameHelp" value="Id Check">
              </div>
            </div>
          </div>
          
          <!-- <div class="form-group">
            <div class="form-row">
	          <div class="col-md-6">
	            <label>Id</label>
	            <input class="form-control" id="id" type="text" name="id" >
	          </div>
	            <input class="btn btn-default" id="dup" type="button" value="Input">
	          
	        </div>
	      </div> -->
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="pwd">Password</label>
                <input class="form-control" id="pw" type="password" name="pw" placeholder="Password">

              </div>
              <div class="col-md-6">
                <label for="cfpwd">Confirm password</label>
                <input class="form-control" id="repassword" type="password" name="repassword" placeholder="Confirm password">
<!--               	<div style="color:red; display:none;" id="inforCfpw">비밀번호가 일치하지 않습니다.</div> -->
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <label for="exampleInputName">Name</label>
            <input class="form-control" id="name" type="text" name="name">
          </div>
          
          
          
          <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <input class="form-control" id="email" name="email" type="email" >
          </div>
          <button type="submit" class="btn btn-primary btn-block">Register</button>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="login">Login Page</a>
          <a class="d-block small" href="forgot-password.html">Forgot Password?</a>
        </div>
      </div>
    </div>
  </div>
  
  <script>
	  $(function(){
		    $("#form").validate({
		        rules: {
		            id: {
		                required : true,
		                minlength : 4,
		                regex: /^\w{5,10}$/
		            },
		            pw: {
		                required : true,
		                minlength : 8,
		                regex: /^(?=\w{8,20}$)\w*(\d[A-z]|[A-z]\d)\w*$/
		            },
		             repassword: {
		                required : true,
		                minlength : 8,
		                equalTo : pw
		            }, 
		            name: {
		                required : true,
		                minlength : 2
		            },
		            age: {
		                digits : true
		            },
		            email: {
		                required : true,
		                minlength : 2,
		                email : true
		            },
		            homepage: {
		                url : true
		            }
		        },
		        //규칙체크 실패시 출력될 메시지
		        messages : {
		            id: {
		                required : "필수로입력하세요",
		                minlength : "최소 {0}글자이상이어야 합니다",
		                regex : "영문자와 숫자로 이루어져야합니다"
		            },
		            pw: {
		                required : "필수로입력하세요",
		                minlength : "최소 {0}글자이상이어야 합니다",
		                regex : "영문자, 숫자로 이루어져있으며 최소 하나이상 포함"
		            },
		            repassword: {
		                required : "필수로입력하세요",
		                minlength : "최소 {0}글자이상이어야 합니다",
		                equalTo : "비밀번호가 일치하지 않습니다."
		            },
		            name: {
		                required : "필수로입력하세요",
		                minlength : "최소 {0}글자이상이어야 합니다"
		            },
		            age: {
		                digits : "숫자만입력하세요"
		            },
		            email: {
		                required : "필수로입력하세요",
		                minlength : "최소 {0}글자이상이어야 합니다",
		                email : "메일규칙에 어긋납니다"
		            },
		            homepage: {
		                url : "정상적인 URL이 아닙니다"
		            }
		        }
		    });
		});	
		$.validator.addMethod(
		    "regex",
		    function(value, element, regexp) {
		        var re = new RegExp(regexp);
		        return this.optional(element) || re.test(value);
		    },
		    "Please check your input."
		);
	  
		$("#dup").on("click",function(){
			var id = $("#id").val();			
			$.ajax({
				async:true,
				type:'POST',
				data:id,
				url:"member/dup",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
					//alert("test");
					if(data.cnt > 0){
						alert("아이디 존재");
					}else{
						alert("아이디 사용 가능");
					}
				}
			});
		});
  </script>	
 
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
  
  <script src="/resources/jquery.validate.js"></script>
  <script src="/resources/additional-methods.js"></script>
  
</body>

</html>
