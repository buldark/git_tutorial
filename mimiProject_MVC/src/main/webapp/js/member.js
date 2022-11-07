function change(){
	document.writeForm.email2.value = document.writeForm.email3.value;
}

//회원가입
$('#writeBtn').click(function(){
	$('#nameDiv').empty();
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	
	if($('#name').val() == ''){
		$('#nameDiv').text('아이디를 입력하세요');
		$('#name').focus();

	}else if($('#id').val() == ''){
		$('#idDiv').text('아이디를 입력하세요');
		$('#id').focus();
		
	}else if ($('#pwd').val() == ''){
		$('#pwdDiv').text('비밀번호를 입력하세요');
		$('#pwdDiv').focus();
		
	}else if ($('#pwd').val() != $('#repwd').val()){
		$('#pwdDiv').text('비밀번호가 맞지 않습니다.');
		$('#pwdDiv').focus();
		
	}else if($('#id').val() != $('#check').val()){
		$('#idDiv').text('아이디 중복체크 하세요');
		$('#id').focus();
	
	}else{
		$.ajax({
			url: '/miniProject_MVC/member/write.do',
			type: 'post',
			data: $('#writeForm').serialize(),
			success: function(){
				alert("회원가입 성공");
				location.href = "/miniProject_MVC/index.jsp";
			},
			error: function(err){
				console.log(err);
			}			
		});
	}
});

//중복 아이디 체크
$('#id').focusout(function(){		
	if($('#id').val() == ''){
		$('#idDiv').text('먼저 아이디를 입력하세요');
		$('#idDiv').css('color', 'magenta');
		
	}else{
		//서버로 요청하고 제자리로 돌아와라
		$.ajax({
			url: 'http://localhost:8080/miniProject_MVC/member/checkId.do',
			type: 'post',
			data: 'id=' + $('#id').val(),
			dataType: 'text', //text, html, xml, json
			success: function(data){
				data = data.trim();
				
				if(data == 'exist'){ //사용 불가능
					$('#idDiv').text('사용 불가능');
					$('#idDiv').css('color', 'red');
					
				}else if(data == 'non_exist'){//사용 가능
					$('#idDiv').text('사용 가능');
					$('#idDiv').css('color', 'blue');
					
					$('input[name="check"]').val($('#id').val());					
				}
			},
			error: function(err){
				console.log(err);
			}
		});//$.ajax
	}
});













