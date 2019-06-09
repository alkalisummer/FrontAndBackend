<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>LoginTest</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<meta name="google-signin-client_id" content="336471076565-3lqp1algfipjuadj2itt1f45gocobqvf.apps.googleusercontent.com">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<script type="text/javascript">
function init() {;
console.log('init');
gapi.load('auth2', function() { // Ready. 
	console.log('auth2');
	window.gauth = gapi.auth2.init({
		client_id: '336471076565-3lqp1algfipjuadj2itt1f45gocobqvf.apps.googleusercontent.com'
	})
	gauth.then(function(){
		console.log('googleAuth success');
		checkLoginStatus();
	}, function() {
		console.log('googleAuth fail');
	});
});
}

function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
	


</script>
  <style type="text/css">
  html, div, body,h3{
  	margin: auto;
  	padding: 0;
  }
  h3{
  	display: inline-block;
  	padding: 0.6em;
  }
   span input[type=submit]{
     font-family: sans-serif;
   }
   
   #abcRioButtonContentWrapper{ 
    margin: auto;
   }
   
    .abcRioButton .abcRioButtonLightBlue .g-signin2 { 
    text-align: center;
    margin: auto;
   }
   
   
  </style>
</head>
<body>
<div style="background-color:#5e4a8a; width: 100%; height: 50px;text-align: center; color: white; font-family: sans-serif; "><h3>Login Test</h3></div>
<br>
<form action="" method="POST">
 <div style="text-align: center; font-family:sans-serif;"><h2 style="font-family: sans-serif;">로그인</h2><br>
 <span style="">아이디:  </span><input type="text" id="userid"><br>
 <span>비밀번호:  </span><input type="password" id="pwd"><br><br>
 <input type="submit" style="background-color:#5e4a8a; color:white; border-radius:6px; width:223px; height:40px; font-family: sans-serif;" value="로그인"><br>
 </div>
 </form>
 <br>

<!-- 네이버 로그인 화면으로 이동 시키는 URL -->
<!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
<div id="naver_id_login" style="text-align:center"><a href="${url}"><img width="223" src="${pageContext.request.contextPath}/images/naver.png"/></a></div>
<br>
<div id="kakao_login" style="text-align:center"><a id="kakao-login-btn"></a></div><br>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('3b972baa329d693a4397d7801e943c22');  //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
    	  Kakao.API.request({

    		  url: '/v2/user/me',
    	       success: function(res) {
    	 
    	              
    	             alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
    	             alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
    	 
    	             console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
    	             console.log(res.account_email);//<---- 콘솔 로그에 email 정보 출력 
    	             //console.log(res.profile_image);
    	             console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
    	             // res.properties.nickname으로도 접근 가능 )
    	             //console.log(res.created);
    	             //console.log(res.status);
    	             console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
    	 
    	           // $('#kakao_id').val(res.properties.id);
    	            //$('#kakao_nickname').val(res.properties.nickname);  
    	  
    	            var d = new Date();
    	 
    	            document.write(res.properties.nickname+"님 환영합니다.");
    	            document.write('');
    	            document.write('접속시간 : '+ d.getFullYear()+'/'+d.getMonth()+'/'+d.getDate()+'/'+d.getHours()+':'+d.getMinutes()+':'+d.getSeconds());
    	 
    	            document.write('');
    	            document.write(res.id);
    	           }

    	         })

      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
  //]]>
</script>

	
	<div style="text-align: center; margin: auto;" class="g-signin2" data-onsuccess="onSignIn"></div>
</body>
</html>
