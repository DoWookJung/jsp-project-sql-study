<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*, javax.naming.*" %>
<%@include file="color.jsp" %>
<html>
<title>커넥션 풀을 사용한 전체 테이블</title>
<body   style="background-color:#f8f8ff">
	<!-- 이름으로 정보 찾기,  -->
<form method="post" action="serchForm.jsp">
<label   style="font-weight:bold">조회할 이름을 입력하세요.</label>
<input   id="name" name="name" type="text"   size="14" placeholder="Input Name"   maxlength="16" required>
<input   type="submit" value="Search">

</from>

<!-- 하이퍼링크로 추가, 수정, 삭제 클릭으로 화면전환 -->
	<a href="insertTestForm_01.jsp">추가하기</a>
	<a href="updateTestForm_1.jsp">수정하기</a>
	<a href="deleteTestForm_1.jsp">삭제하기</a>

<link href="style.css" rel="stylesheet" type="text/css">
<body>
  <h3>커넥션 풀을 사용한 전체 테이블</h3>
  <body bgcolor="<%=bodyback_c%>">
  <TABLE width="900" border="1" cellspacing="0" cellpadding="2"  align="center">
  <TR height="39" align="left" bgcolor="<%=Pro_table%>">
  	<TD width="100">이름</TD>
  	<TD width="100">직책</TD>
  	<TD width="200">전화번호</TD>
  	<TD width="250">이메일</TD>
  	<TD width="250">주소</TD> 
  </TR>
<%
  Connection conn=null;
  PreparedStatement pstmt=null;
  ResultSet rs=null;

  try{
	Context initCtx = new InitialContext();
    Context envCtx = (Context) initCtx.lookup("java:comp/env");
    DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");
    conn = ds.getConnection();

	String sql= "select * from member";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();

	while(rs.next()){
	  String name= rs.getString("name");
      String position= rs.getString("position");
      String tel= rs.getString("tel");
      String email= rs.getString("email");
      String addr=rs.getString("addr");

%>
     <TR height="39" align="left" bgcolor="<%=Pro_table%>">
  	   <TD width="100"><%=name%></TD>
  	   <TD width="100"><%=position%></TD>
  	   <TD width="200"><%=tel%></TD>
  	   <TD width="250"><%=email%></TD>
  	   <TD width="250"><%=addr%></TD>
    </TR>
<%  } 
  }catch(Exception e){ 
		//e.printStackTrace();
		out.println("Error! " + e.toString());
  }finally{
	    if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
  }
%>
    
</table>
</body>
</html>