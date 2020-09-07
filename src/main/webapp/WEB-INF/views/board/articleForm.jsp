<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<%
  request.setCharacterEncoding("UTF-8");
%> 

<head>
<meta charset="UTF-8">
<title>글쓰기창</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 제이커뤄리를 사용하기위해 반드시 설정필요 버전에 상관없이 JQuery사용하고 싶으면 min.js 를 사용한다. -->
<script type="text/javascript">
   function readURL(input) {
<!--원래 이미지 미리보기를 하기 위해서는 이미지를 서버에 업로드를 한 후에 업로드된 이미지의 URL을 전달 받아 그 URL로 이미지 src에 세팅을 해주는 것으로 처리를 해야한다. 
하지만 FileReader 라는  Javascript 객체가 생기면서 최신 브라우저에서는 
서버에 이미지를 업로드 안해도 이미지 미리보기 기능을 구현할 수 있다. 해당 내용은 아래와 같습니다.-->	   
      if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        $('#preview').attr('src', e.target.result);
          }
         reader.readAsDataURL(input.files[0]);
      }
  }  
  function backToList(obj){
	  <!-- 이전상태(listArticle.do)로 돌아가기 기능 -->
    obj.action="${contextPath}/board/listArticles.do";
    obj.submit();
  }
  
  var cnt=1;
  
  <!-- cnt를 1로 초기화하고 파일이 업로드될때마다 cnt값 증가-->
  function fn_addFile(){
	  <!-- 파일 업로드기능 -->
	  $("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
	  cnt++;
  }  

</script>
 <title>글쓰기창</title>
</head>
<body>
<h1 style="text-align:center">글쓰기</h1>
  <form name="articleForm" method="post" action="${contextPath}/board/addNewArticle.do"   enctype="multipart/form-data">
    <table border="0" align="center">
      <tr>
			 <td width=150  align="center" bgcolor=skyblue> 작성자</td>
					<td colspan=2  align="left"><input type="text" size="80" maxlength="100"  value="${member.name }" readonly/> </td>
			</tr>
	     <tr>
			  <td width=150  align="center" bgcolor=skyblue>글제목: </td>
			   <td colspan="2"><input type="text" size="80"  maxlength="500" name="title" /></td>
		 </tr>
	 		<tr>
			<td width=150  align="center" bgcolor=skyblue><br>글내용: </td>
				<td colspan=2><textarea name="content" rows="30" cols="70" maxlength="4000"></textarea> </td>
     </tr>
     <tr>
			<td width=150  align="center" bgcolor=skyblue>이미지파일 첨부:  </td>
			  <td> <input type="file" name="imageFileName"  onchange="readURL(this);" /></td>
			  <td><img  id="preview" src="#"   width=200 height=200/></td>
			  
			  
				
	   </tr>
	   <tr>
	      <td colspan="4"><div id="d_file"></div></td>
	   </tr>
	    <tr>
	      <td align="right"> </td>
	      <td colspan="2">
	       <input type="submit" value="글쓰기" />
	       <input type=button value="목록보기"onClick="backToList(this.form)" />
	      </td>
     </tr>
    </table>
  </form>
</body>
</html>
