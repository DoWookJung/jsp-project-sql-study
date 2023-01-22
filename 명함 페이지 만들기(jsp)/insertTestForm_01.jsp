<!--페이지 문자열 한글 출력 형식 utf-8-->
<!-- page 디렉티브로 정의 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--화면 전체적인 색상 설정하기 위한 jsp파일-->
<!-- include 디렉티브를 사용해 조각코드 삽입 -->
<%@include file="color.jsp" %>

<html>
<head>
<!-- link태그는 외부 문서를 연결시키는 태그이며, css와 같은 스타일시트 파일을 연결-->
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
<title>명함 등록</title>
</head>
<body>
  <h2>명함 등록</h2>
  <!-- style.css에 배경색 정의 -->
  <body bgcolor="<%=bodyback_c%>">
  <!-- 입력 폼 생성하기
  name : 폼을 식별하기 위한 이름을 지정, method : 폼을 서버에 전송할 http 메소드를 정의(GET 또는 POST)
  action : 폼을 전송할 서버 쪽 스크립트 파일을 지정
  onsubmit : form 태그 안에서 form전송을 하기 전에 입력된 데이터의 유효성을 체크하기 위해 사용하는 이벤트  
  inputcheck()함수가 값이 올바르게 입력됐는지 확인을 해줍니다
  결과 화면 : insertTestPro_01.jsp-->
  <form name="regForm" method="post" action="insertTestPro_01.jsp" onsubmit="return inputCheck()">
  <!-- center태그를 이용해 가운데 배치 -->
  <!-- style.css에 h1태그의 글자크기, 색깔 지정 -->
  <center>
	    <h1>CARD PLUS</h1>
  </center>
  <!-- <ins> 태그는 텍스트 아래쪽에 라인(line)을 추가하여 문서에 추가된 텍스트를 표현할 때 사용 -->
  <!-- id="ins"를 정의해 style.css에서 margin-left를 정의함 -->
  <ins><small><p id="ins">*는 필수 입력 사항입니다.</p></small></ins>
  <!--테이블 각 행과 제목부분 설정-->
  <!--width=행의 가로 넓이 지정, border=테두리두께 0, cellspacing=셀 사이의 경계선 굵기, 
  cellpadding=셀 테두리와 셀 내용 사이의 간격, align=테이블 정렬방식 bgcolor= 흰색 배경으로 정의-->
  <table width="500" border="0" cellspacing="0" cellpadding="2"  align="center" bgcolor="<%=Pro_table%>">
      <tr> 
      <!-- style.css 배경색 정의 -->
        <td width="100">이름(*)</td>
        <td width="200"> 
		<!-- 타입 = 텍스트, name=이름(name), size= 빈칸크기, maxlength=글자최대수 required=필수입력사항 -->
		  <input type="text" name="name" size="20" maxlength="10" required> </td>
      </tr>
      <tr> 
        <td width="100">직책</td>
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
        <td width="100">전화번호(*)</td>
        <td width="200"> 
        <!-- 타입 = 텍스트, onKeyup=사용자가 키보드의 키를 눌렀을 때 일어나는 이벤트(스크립트에 정의했음) name=이름(name), size= 빈칸크기, maxlength=글자최대수 placeholder= 예시, required=필수입력사항 -->
		  <input type="text" onKeyup="inputPhoneNumber(this);" name="tel" size="20" maxlength="20" placeholder="010-1234-5678" required> </td>
      </tr>
      <tr> 
         <td width="100">이메일(*)</td>
         <td width="200"> 
		   <input type="text" name="email" size="30" maxlength="30" placeholder="id@host" required> </td>
      </tr>
      <tr>  
         <td width="100">주소(*)</td>
         <td width="200"> 
		   <input type="text" name="addr" size="20" maxlength="30" > </td>
      </tr>
      <tr> 
      <!-- colspan= 셀의 열을 합친다. -->
         <td colspan="3" align="center">
           <input type="submit" value="명함등록" > 
           <!-- &nbsp;는 띄어쓰기, 즉 공백을 나타내는 특수문자 -->
              &nbsp; &nbsp; &nbsp; &nbsp;
           <input type="reset" value="입력취소">
           	  &nbsp; &nbsp; &nbsp; &nbsp;
           	  <!-- 버튼 클릭시 리스트 화면 전환 -->
           <button onclick="location.href='usePool_01.jsp'">리스트 보기</button> 
         </td>
       </tr>
    </form>
</body>
</html>