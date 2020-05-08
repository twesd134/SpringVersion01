<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%>     
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<title>로그인창</title>
<style>
   .text_center{
     text-align:center;
   }
</style>
<c:choose>
	<c:when test="${result=='loginFailed' }">
	  <script>
	    window.onload=function(){
	      alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
	    }
	  </script>
	</c:when>
</c:choose>  
</head>

<body>
<form name="frmLogin" method="post"  action="${contextPath}/member/login.do">
   <table width="300" align="center"border="1" bordercolor="skyblue">
	<tr height="100">
	<td align="center" colspan="2">
		<font size="6" color="skyblue">로그인</font></td>
	</tr>
	
	<tr height="40">
		<td width="120" align="center">아이디</td>
		<td width="180">
		<input type="text" name="id" size="15"></td>
	</tr>
	
	
	<tr height="40">
		<td width="120" align="center">패스워드</td>
		<td width="180"><input type="password" name="pwd" size="15"></td>
	</tr>
	
	
	<tr height="40">
	
	<td align="center" colspan="2">
	<input type="submit" value="로그인">
	<input type="reset"  value="다시입력" ></td> 
	</tr>
	</table>
	</form>
</body>
</html>
