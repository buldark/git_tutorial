<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name ="boardViewForm" id = "boardViewForm" >
	<input type="hidden" id="seq" name="seq" value="${seq }" />
	<input type="hidden" id="pg" name ="pg" value="${pg }" />
	<input type="hidden" id="memId" value="${memId }" />
	
	<table width="450" border="1" cellpadding="5" frame="hsides" rules="rows">
		<tr>
			<td colspan="3">
				<h2><span id="subjectSpan"></span></h2>
			</td>
		</tr>
		
		<tr>
			<td width="150">글번호 : <span id="seqSpan"></span></td>
			<td width="150">작성자 : <span id="idSpan"></span></td>
			<td width="150">조회수 : <span id="hitSpan"></span></td>
		</tr>
		
		<tr>
			<td colspan="3" height="250" valign="top">
				<div style="width: 100%; height: 100%; overflow: auto"> <!-- 밑으로 긴 글일때 스크롤바가 뜨게 -->
					<pre style="white-space: pre-line; word-break: break-all;">
						<span id="contentSpan"></span>
					</pre>
				</div>
			</td>
		</tr>
	</table>
	
	<div style="margin-top: 5px;">
		<input type="button" value="목록" 
		onclick="location.href='/miniProject_MVC/board/boardList.do?pg=${pg}'" />
		
		<span id="boardViewSpan">
			<!-- <input type="button" value="글수정" onclick="mode(1)"/>
			<input type="button" value="글삭제" onclick="mode(2)"/>  자바 스크립트 방식?? -->
			
			<input type="button" value="글수정" id = "boardUpdateBtn"/>
			<input type="button" value="글삭제" id = "boardDeleteBTn"/>
		</span>
	</div>
</form>
<!--  <script type="text/javascript"> <!-- 이부분은 jquery 못잡음 순서 --> 
	<!--  function mode(num){
	 if(num == 1){//글수정 -seq &pg
		document.boardViewForm.method="get";
		 //document.폼이름
		document.boardViewForm.action="/miniProject_MVC/board/boardUpdateForm.do";
		document.boardViewForm.submit();//submit은 name속성만 가져감 (id 속성은 노놉 )
	}else(num == 2){
		//글삭제 -seq만
		if(confirm("정말로 삭제하시겠습니까??")){
		document.boardViewForm.method ="get";
		document.boardViewForm.action="/miniProject_MVC/board/boardDelete.do";
		document.boardViewForm.submit();
		}//if
	} 
	
}  -->  
 <!-- </script>   -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
//$(function(){});
$(document).ready(function(){
	$.ajax({
		url: '/miniProject_MVC/board/getBoard.do',
		type: 'post',
		data: 'seq=' + $('#seq').val(),
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			
			$('#subjectSpan').text(data.subject);
			$('#seqSpan').text(data.seq);
			$('#idSpan').text(data.id);
			$('#hitSpan').text(data.hit);
			$('#contentSpan').text(data.content);
			
			if($('#memId').val() == data.id){
				$('#boardViewSpan').show()
			}else{
				$('#boardViewSpan').hide()
			}
		},
		error: function(err){
			console.log(err);
		}
	});
});

//글수정
$('#boardUpdateBtn').click(function(){
	$('#boardViewForm').attr('action','/miniProject_MVC/board/boardUpdateForm.do');
	$('#boardViewForm').submit();
});

//글삭제
$('#boardDeleteBTn').click(function(){
	if(confirm("정말로 삭제하시겠습니까?")){
		$.ajax({
			url :'/miniProject_MVC/board/boardDelete.do',
			type:'post',
			data:'seq='+$('#seq').val(),
			success:function(){
				alert("글삭제 완료");
				location.href='/miniProject_MVC/board/boardList.do?pg=1';
			},
			error :function(err){
				console.log(err)
			}
		});//$.ajax
	}
});
</script>
</body>
</html>




















