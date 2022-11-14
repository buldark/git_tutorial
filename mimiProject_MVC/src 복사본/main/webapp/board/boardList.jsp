<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#pagingDiv {
	text-align: center;
	width: 900px;
	margin-top: 10px;
}

#currentPaging {
	border: 1px solid blue;
	padding: 5px 10px;
	margin: 2px;
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

#paging {
	cursor: pointer;
	padding: 5px 10px;
	margin: 2px;
}

.subjectA:link { color: black; text-decoration: none; }
.subjectA:visited { color: black; text-decoration: none; }
.subjectA:hover { color: green; text-decoration: underline; }
.subjectA:active { color: black; text-decoration: none; }
</style>
</head>
<body>
<input type="hidden" id="pg" value="${pg }">
<input type="hidden" id="memId" value="${memId }">

	<table id="boardListTable" border="1" cellpadding="5" frame="hsides" rules="rows">
		<tr>
			<th style="width: 100px">글번호</th>
			<th style="width: 400px">제목</th>
			<th style="width: 100px">작성자</th>
			<th style="width: 100px">조회수</th>
			<th style="width: 200px">작성일</th>
		</tr>
		
		<!-- 동적처리 -->
		
	</table>
	
	<div style="display: inline-block;">
		<div id="pagingDiv"></div>
	</div>


<script type="text/javascript">
function boardPaging(pg) {
	location.href = "boardList.do?pg=" + pg;
}

function isLogin(id, seq, pg){
	if(id == 'null') 
		alert("먼저 로그인하세요");
	//else
		//location.href="boardView.jsp?seq=" + seq + "&pg="+pg;
}
</script>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="../js/boardList.js"></script>
</body>
</html>



















