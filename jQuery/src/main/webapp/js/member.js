$(function(){
	$('#join').submit(function(){
		var user_id= $('input[name="user_id"]').val();
		if(!user_id){//아이디가 들어오면 트루 -> !붙으면 false
			alert("아이디를 입력하세요");
			$('input[name="user_id"]').focus();
			return false;
			}
		var user_pw= $('input[name="user_pw"]').val();
		if(!user_pw){//아이디가 들어오면 트루 -> !붙으면 false
			alert("비밀번호 입력하세요");
			$('input[name="user_pw"]').focus();
			return false;
			}
		var juminno= $('input[name="juminno"]').val();
		if(!juminno){//아이디가 들어오면 트루 -> !붙으면 false
			alert("주민번호 입력하세요");
			$('input[name="juminno"]').focus();
			return false;
			}
		if(!$('input[name="gender"]').is(':checked')){
				alert("성별을 선택하세요 ");
				//document.form1.gender[0].checked =true; //자바 스크립트 버젼				
				//$('input[name="gender"]').eq(1).attr('checked',true); //jquery 버젼
				$('input[name="gender"]').eq(1).prop('checked',true); //jquery attr VS prop
				return false;
			}//체크가 되었느냐는 is함수 사용	
		var email= $('input[name="email"]').val();
		if(!email){//아이디가 들어오면 트루 -> !붙으면 false
			alert("이메일 입력하세요");
			$('input[name="email"]').focus();
			return false;
			}
		var url= $('input[name="url"]').val();
		if(!url){//아이디가 들어오면 트루 -> !붙으면 false
			alert("URL 입력하세요");
			$('input[name="url"]').focus();
			return false;
			}
		var hpno= $('input[name="hpno"]').val();
		if(!hpno){//아이디가 들어오면 트루 -> !붙으면 false
			alert("핸드폰 입력하세요");
			$('input[name="hpno"]').focus();
			return false;
			}
		if(!$('input[name="hobby"]').is(':checked')){
				alert("취미를 선택하세요 ");
				$('input[name="hobby"]:eq(0)').attr('checked',true);			
				//$('input[name="hobby"]').eq(0).prop('checked',true); //jquery attr VS prop
				return false;
			}//체크가 되었느냐는 is함수 사용
						
		if($('select[name="job"]>option:selected').index()<1){
			alert("직업을 입력하세요");
			$('select[name="job"]>option:eq(1)').attr('selected',true);
			return false;
		}
		
		//입력한 내용을 화면에 출력
		var gender = $('input[name="gender"]:checked').val();
		
		var hobby =$('input[name="hobby"]:checked');
		var hobby_val ="";
		hobby.each(function(){
			hobby_val += $(this).val()+"  "; //$(this)=>반복문에서 hobby안에 포함된 객체
		});
		
		var job = $('select[name="job"]>option:selected').val();
		
		var result = '<ul>';
		result+='<li>아이디 :'+user_id +'</li>'
		result+='<li>비밀번호:'+user_pw +'</li>'
		result+='<li>주민번호:'+juminno +'</li>'
		result+='<li>성별:'+gender +'</li>'
		result+='<li>이메일:'+email+'</li>'
		result+='<li>url:'+ url+'</li>'
		result+='<li>핸드폰:'+hpno+'</li>'
		result+='<li>취미:'+hobby_val +'</li>'
		result+='<li>직업:'+job +'</li>'
		result+='</ul>'		
		$('body').html(result);		
		return false;//저동으로 보낸것을(페이지 이동) 막는것 
	});	
});





/*
팀장님
$(function(){
   $('#join').submit(function(){
      var user_id = $('input[name="user_id"]').val();
      var user_pw = $('input[name="user_pw"]').val();
      var juminno = $('input[name="juminno"]').val();
      var email = $('input[name="email"]').val();
      var url = $('input[name="url"]').val();
      var hpno = $('input[name="hpno"]').val();

      
      if(!user_id){
         alert("아이디를 입력하세요");
         $('input[name="user_id"]').focus();
         return false; // submit - 페이지 이동을 막아줘야한다
      }
      if(!user_pw){
         alert("비밀번호를 입력하세요");
         $('input[name="user_pw"]').focus();
         return false;
      }
      if(!juminno){
         alert("주민번호를 입력하세요");
         $('input[name="juminno"]').focus();
         return false;
      }
      if(!$('input[name="gender"]').is(':checked')){
         alert("성별을 선택하세요");
         //$('input[name="gender"]:eq(0)').attr('checked','checked'); //문자열
         $('input[name="gender"]:eq(0)').prop('checked','checked'); //객체로 취급
         return false;
      }
      if(!email){
         alert("이메일을 입력하세요");
         $('input[name="email"]').focus();
         return false;
      }
      if(!url){
         alert("url을 입력하세요");
         $('input[name="url"]').focus();
         return false;
      }
      if(!hpno){
         alert("휴대폰번호를 입력하세요");
         $('input[name="hpno"]').focus();
         return false;
      }
      if(!$('input[name="hobby"]').is(':checked')){
         alret("취미를 선택하세요");
         $('input[name="hobby"]:eq(0)').prop('checked','checked');
         return false;
      }      
      if($('select[name="job"] > option:selected').index() < 1){
         alert("직업을 선택하세요");
         $('select[name="job"] > option:eq(1)').attr('selected', true);
         return false;
      }
      
      var gender =$('input[name="gender"]:checked').val();
      var hobby = $('input[name="hobby"]:checked');
      var hobby_val = "";
      hobby.each(function(){
         hobby_val += $(this).val()+"  "; // $('input[name="hobby"]:checked')
      });
      var job =  $('select[name="job"] > option:selected').val();
      
      var result = '<ul>';
      result += '<li>'+ user_id + '</li>';
      result += '<li>'+ user_pw + '</li>';
      result += '<li>'+ juminno + '</li>';
      result += '<li>'+ gender + '</li>';
      result += '<li>'+ email + '</li>';
      result += '<li>'+ url + '</li>';
      result += '<li>'+ hpno + '</li>';
      result += '<li>'+ hobby_val+ '</li>';
      result += '<li>'+ job+ '</li>';
      result += '</ul>';
      
      $('body').html(result);
      
      return false;
   });
});



*/









