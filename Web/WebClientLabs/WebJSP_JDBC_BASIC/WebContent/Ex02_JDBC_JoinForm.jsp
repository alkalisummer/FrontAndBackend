<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: solid 2px white;
	border-collapse: collapse;
}

tr {
	border: solid 1px ;
	background-color: white;
	border-collapse: collapse;
	color: black;
}

td {
	border: solid 1px white;
	border-collapse: collapse;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
 //jquery 로 간단하게 유효성 check 하기
 $(function() {
  	$('#joinForm').submit(function() {
	   //alert("가입");
	if ($('#id').val() == "") { // 아이디 검사
    	alert('ID를 입력해 주세요.');
    	$('#id').focus();
    return false;
   } else if ($('#pwd').val() == "") { // 비밀번호 검사
    alert('PWD를 입력해 주세요.');
    $('#pwd').focus();
    return false;
   }else if ($('#mname').val() == "") { // 이름 검사
    alert('mname를 입력해 주세요.');
    $('#mname').focus();
    return false;
   }else if ($('#age').val() == "") { // 나이 검사
    alert('age를 입력해 주세요.');
    $('#age').focus();
    return false;
   }else if ($('#email').val() == "") { // 우편번호
    alert('email를 입력해 주세요.');
    $('#email').focus();
    return false;
   }
   
  });
 });
</script>
<!--  
CREATE TABLE koreaMember
(
    id VARCHAR2(50) PRIMARY KEY ,
    pwd VARCHAR2(50) NOT NULL,
    NAME VARCHAR2(50) NOT NULL,
    age NUMBER ,
    gender CHAR(4),
    email VARCHAR2(50),
    ip   VARCHAR2(50)
)
-->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

</head>
<body>
	<table
		style="width: 1000px; height: 720px; margin-left: auto; margin-right: auto;">
		<tr>
			<td colspan="2">
				<jsp:include page="/common/Top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td style="width: 150px">
				<jsp:include page="/common/Left.jsp"></jsp:include>
			</td>
			<td style="width: 700px">
				<form action="Ex02_JDBC_JoinOK.jsp" method="post" name="joinForm" id="joinForm">
					<h2>Registration</h2>
					        <div class="form-group" >
								<label for="ID" class="col-sm-3 control-label">ID</label>
                                 
								<input type="text" name="id" id="id" class="form-control" autofocus style ="width:80%">
							 
							  </div>
							   <div class="form-group">
								<label for="pwd" class="col-sm-3 control-label">Password</label>
								<input type="password" name="pwd" id="pwd" class="form-control" autofocus style ="width:80%">
							    </div>
							    
							    <div class="form-group">
								<label for="mname" class="col-sm-3 control-label">name</label>
								<input type="text" name="mname" id="mname" class="form-control" autofocus style ="width:80%">
							    </div>
							    
							    <div class="form-group">
								<label for="age" class="col-sm-3 control-label">age</label>
								<input type="text" name="age" id="age" maxlength="3" class="form-control" autofocus style ="width:80%">
						         </div>
								
								<div class="form-group">
                    <label class="control-label col-sm-3">Gender</label>
                    <br> 
                    <br> 
                     
                    
                           
                                <label class="radio-inline" >
                                    <input type="radio" id="gender" name="gender" value="여">Female
                                </label>
                            
                            
                                <label class="radio-inline col-sm-3">
                                   &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" id="gender" name="gender" value="남">Male
                                </label>
                            
                       
                   
                </div>
               
							<div class="form-group">
							
								<label for="email" class="col-sm-3 control-label">Email</label>
								<input type="text" name="email" id="email" class="form-control" autofocus style ="width:80%">
							
							</div>
								
									<input type="submit" class="btn btn-primary btn-block" value="회원가입" style ="width:80%">
									<!-- <input type="reset" value="취소"> -->
							
						

					
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<jsp:include page="/common/Bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>