<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %> <%--XML파일 태그 시작 전에 공백 분자 제거.. --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
DB연동 - 아이디가  "hong"이면 비밀번호 "111"이면 로그인 성공으로 취급 
--%>
<c:set var="result" value="true"/>
<c:set var="message" value="홍길동 들어옴"/>

<c:if test="${param.user_id != 'hong'}">
	<c:set var="result" value="false"/>
	<c:set var="message" value="가입 되지 않은 아이디"/>
</c:if>

<c:if test="${param.user_password != '111'}">
	<c:set var="result" value="false"/>
	<c:set var="message" value="비밀번호 틀림"/>
</c:if>

<?xml version="1.0" encoding="UTF-8"?>
<login>
	<result>${result}</result>
	<message>${message}</message>
</login>