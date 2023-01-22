<%-- page 디렉티브 속성 정의--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@include file="color.jsp" %>

<%-- 파라미터 값을 넘겨받을 때 한글 깨짐 방지 --%>
<% request.setCharacterEncoding("utf-8");%>

<%-- request 내장객체의 getParameter() 메소드로 값 읽음 --%>
<% 
   String name = request.getParameter("name");
   String position= request.getParameter("position");
   String tel = request.getParameter("tel");
   String email = request.getParameter("email");
   String addr = request.getParameter("addr");

   Connection conn=null;
   PreparedStatement pstmt=null;
   String str="";
   // 예외처리
   try{
	 // 연동할 DBUrl, 사용자계정, 패스워드
	 String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp?serverTimezone=Asia/Seoul"; 	 
     String dbId="jspid";
     String dbPass="jsppass";
 	 
	 Class.forName("com.mysql.cj.jdbc.Driver");   	 
 	 conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
 	
 	 String sql= "insert into member values (?,?,?,?,?)";
 	 // sql이 실행할 쿼리문
 	 pstmt=conn.prepareStatement(sql); 
 	 
 	 pstmt.setString(1,name);
 	 pstmt.setString(2,position);
     pstmt.setString(3,tel);
 	 pstmt.setString(4,email);
 	 pstmt.setString(5,addr);
 	 pstmt.executeUpdate();
 	 
 	}catch(Exception e){ 
 		e.printStackTrace();
 		str="member 테이블에 새로운 레코드를 추가에 실패했습니다";
 	}finally{
 		if(pstmt != null) 
 			try{pstmt.close();}catch(SQLException sqle){}
 		if(conn != null) 
 			try{conn.close();}catch(SQLException sqle){}
 	}
 %>

<!--액션태그로 자바빈 객체 생성하기-->
<!-- id속성: 생성될 자바빈 객체의 이름. class속성:객체가 생성될 자바빈 클래스명을 적는다 -->
<!--액션태그로 파라미터 값 찾아서 자바빈 객체 필드에 저장하기-->
<!--property의 속성값을 *로 주면 모든 프로퍼티의 값을 세팅한다 -->
<!-- 
<jsp:useBean id="regBean" class="ch10.register.RegisterBean" />
<jsp:setProperty name="regBean" property="*" /> --> 

<jsp:setProperty name="regBean" property="name" />
<jsp:setProperty name="regBean" property="position" />
<jsp:setProperty name="regBean" property="tel" />
<jsp:setProperty name="regBean" property="email" />
<jsp:setProperty name="regBean" property="addr" />



<html>
<head>
<!-- 페이지의 제목 설정 -->
<title>명함 추가</title>
</head>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
<body bgcolor="<%=bodyback_c%>">
  
  <!-- center태그를 이용해 가운데 배치 -->
  <!-- style.css에 h1태그의 글자크기, 색깔 지정 -->
  <center>
	    <h1>등록 완료</h1>
  </center>
  <!--테이블 각 행과 제목부분 설정-->
  <!--width=행의 가로 넓이 지정, border=테두리두께 0, cellspacing=셀 사이의 경계선 굵기, 
  cellpadding=셀 테두리와 셀 내용 사이의 간격, align=테이블 정렬방식-->
    <table width="500" border="0" cellspacing="0" cellpadding="2"  align="center">
    <!-- style.css에 Pro_table=흰색 정의 -->
      <tr height="39" align="left" bgcolor="<%=Pro_table%>"> 
      <!-- font size로 크기 지정, <b>태그로 글씨체 변경 -->
      <!-- getProperty 액션 태그로 regBean객체의 name 프로퍼티 값을 읽어온다. -->
        <td> <font size="6"><b><jsp:getProperty name="regBean" property="name"/></b></td>
        <!-- 같은 디렉토리에 파일을 넣어 사진 삽입 -->
        <td align="right"> <img src="logo.png" width="100" height="100" alt="학교사진"> </td>
      </tr>
      <tr height="39" align="left" bgcolor="<%=Pro_table%>"> 
        <td colspan="2"><font size="5"> <jsp:getProperty name="regBean" property="position"  /></td>
      </tr>
      <!-- 셀의 열 2개 합치기 -->
      <tr bgcolor="<%=Pro_table%>"><td colspan="2"><hr></td></tr>
      <tr> 
        <td width="100" bgcolor="<%=Pro_table%>">전화번호</td>
        <td width="400" bgcolor="<%=Pro_table%>"> 
		  <jsp:getProperty name="regBean" property="tel"  /> </td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=Pro_table%>">이메일</td>
        <td width="400" bgcolor="<%=Pro_table%>"> 
		  <jsp:getProperty name="regBean" property="email" /> </td>
      </tr>
            <tr> 
        <td width="100" bgcolor="<%=Pro_table%>">주소</td>
        <td width="400" bgcolor="<%=Pro_table%>"> 
		  <jsp:getProperty name="regBean" property="addr" /> </td>
      </tr>
      <!-- 입력 폼 생성하기
	  name : 폼을 식별하기 위한 이름을 지정, method : 폼을 서버에 전송할 http 메소드를 정의(GET 또는 POST)
	  action : 폼을 전송할 서버 쪽 스크립트 파일을 지정
	  onsubmit : form 태그 안에서 form전송을 하기 전에 입력된 데이터의 유효성을 체크하기 위해 사용하는 이벤트  
	  inputcheck()함수가 값이 올바르게 입력됐는지 확인을 해줍니다
	  버튼을 누르면 결과 화면 : insertTestForm_01.jsp-->
      <form name="regForm" method="post" action="insertTestForm_01.jsp" onsubmit="return inputCheck()">
       <tr> 
       <!-- colspan로 열 합친 후 버튼을 만들고 누르면 registerForm.jsp가게끔 위에서 정의한걸 만듬 -->
        <td colspan="3" align="right"  bgcolor="<%=Pro_table%>"> 
           <input type="submit" value="명함등록 페이지로" > 
         </td>
           </form>
  </table>
	<!-- 리스트 화면으로 전환 -->
	<form name="usepool" method="post" action="usePool_01.jsp" onsubmit="return inputCheck()">
	<table width="500" border="0" cellspacing="0" cellpadding="2"  align="center">
    <!-- style.css에 Pro_table=흰색 정의 -->
      <tr>
      <td colspan="3" align="right"  bgcolor="<%=Pro_table%>"> 
    	<input type="submit" value="리스트 보기">
    	</td>
    	</tr>
    	</form> 
</body>
</html>