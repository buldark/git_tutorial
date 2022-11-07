<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
}
</style>
</head>
<body>
<h2>로그인</h2>
<form name="loginForm">
	<table border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" id="id" size="30" placeholder="아이디 입력">
				<div id="idDiv"></div>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="pwd" id="pwd" size="40">
				<div id="pwdDiv"></div>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<button type="button" id="loginBtn">로그인</button>
				<button type="button" onclick="location.href='writeForm.do'">회원가입</button>
			</th>
		</tr>
	</table>
	<br><br>
	
	<div id="loginResult"></div>
	
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$('#loginBtn').click(function(){
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	
	if($('#id').val() == ''){
		$('#idDiv').text('아이디를 입력하세요');
		$('#id').focus();
		
	}else if($('#pwd').val() == ''){
		$('#pwdDiv').text('비밀번호를 입력하세요');
		$('#pwd').focus();
		
	}else{
		$.ajax({
			url: '/miniProject_MVC/member/login.do',
			type: 'post',
			data: 'id=' + $('#id').val() +'&pwd=' + $('#pwd').val(),
			//data: { 'id': $('#id').val(), 'pwd': $('#pwd').val() }
			dataType: 'text',			
			success: function(data){
				data = data.trim();
				
				if(data == 'ok'){
					location.href='../index.jsp';
					
				}else if(data == 'fail'){
					$('#loginResult').text('아이디 또는 비밀번호가 맞지 않습니다.');
					$('#loginResult').css('font-size', '12pt');
				}
				
			},
			error:function(err){
				//alert(err);
				console.log(err);
			}
		});
	}
		
});
</script>
</body>
</html>



















