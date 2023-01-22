<!--페이지 문자열 출력 형식 utf-8-->
<%@   page contentType="text/html; charset=utf-8" %>
<!--화면 전체적인 색상 설정하기 위한 jsp파일-->
<%@include   file="color.jsp" %> 

<html>
<head>
<meta   name= "viewport" content="width=device-width,   initial-scale=1.0"/>
<title>명함수정</title>
<link   href="style.css" rel="stylesheet" type="text/css">
<script   language="JavaScript" src="script.js"></script>
</head>

<!--배경색상을 css파일에서 설정한 bodyback색으로 설정-->
<body   bgcolor="<%=bodyback_c%>"> 
	<!-- 글자 꾸미기 -->
   <i><font size = "5em" color="blue">변경하기</font></i>
   
<hr>   <!--인사와 입력 폼 구분 위한 수평 선 그리기-->
<!-- submit시 updateTestPro_1.jsp로 환면전환  -->
<form name="upprom" method="post" action="updateTestPro_1.jsp" onsubmit="return inputCheck()">
<br>
  <!--테이블 각 행과 제목부분 설정-->
  <!--width=행의 가로 넓이 지정, border=테두리두께 0, cellspacing=셀 사이의 경계선 굵기, 
  cellpadding=셀 테두리와 셀 내용 사이의 간격, align=테이블 정렬방식 bgcolor= 흰색 배경으로 정의-->
  <table width="500" border="0" cellspacing="0" cellpadding="2"  align="center" bgcolor="<%=Pro_table%>">
      <tr> 
      <!-- style.css 배경색 정의 -->
        <td width="100">현재 이름</td>
        <td width="200"> 
		<!-- 타입 = 텍스트, name=이름(name), size= 빈칸크기, maxlength=글자최대수 required=필수입력사항 -->
		  <input type="text" name="name" size="20" maxlength="10" required> </td>
      </tr>
      <tr> 
        <td width="100">변경할 직책</td>
        <td width="200"> 
        <!-- 드롭다운 리스트를 이용해 처음엔 " "로 빈칸 체크되어 있게 했다. -->
		  <select name="position">
		  <option value=" " selected></option>
		  <option value="학부생">학부생</option>
		  <option value="대학원">대학원</option>
		  <option value="교수">교수</option>
		  <option value="직원">직원</option>
		  </select> </td>
      </tr>
      <tr>  
        <td width="100">변경할 전화번호</td>
        <td width="200"> 
        <!-- 타입 = 텍스트, onKeyup=사용자가 키보드의 키를 눌렀을 때 일어나는 이벤트(스크립트에 정의했음) name=이름(name), size= 빈칸크기, maxlength=글자최대수 placeholder= 예시, required=필수입력사항 -->
		  <input type="text" onKeyup="inputPhoneNumber(this);" name="tel" size="20" maxlength="20" placeholder="010-1234-5678" required> </td>
      </tr>
      <tr> 
         <td width="100">변경할 이메일</td>
         <td width="200"> 
		   <input type="text" name="email" size="30" maxlength="30" placeholder="id@host" required> </td>
      </tr>
      <tr>  
         <td width="100">주소</td>
         <td width="200"> 
		   <input type="text" name="addr" size="20" maxlength="30" > </td>
      </tr>
      <tr> 
      <!-- colspan= 셀의 열을 합친다. -->
         <td colspan="3" align="center"> 
           <input type="submit" value="수정하기" > 
              &nbsp; &nbsp; &nbsp; &nbsp;
           <input type="reset" value="입력취소"> 
         </td>
       </tr>
    </form>
  </table>
 
</body>
</html>