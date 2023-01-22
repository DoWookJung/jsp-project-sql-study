<%@   page language="java" contentType="text/html;   charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@   page import="java.sql.*"%>

<%    request.setCharacterEncoding("utf-8"); %>

<%
  String name=   request.getParameter("name");
  
  String position=   request.getParameter("position");
  String tel= request.getParameter("tel");
  String email=   request.getParameter("email");
  String addr=   request.getParameter("addr");

  Connection conn=null;
  PreparedStatement pstmt=null;
  ResultSet rs=null;

  try{
	String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp?serverTimezone=Asia/Seoul";
    String dbId="jspid";
    String dbPass="jsppass";
	 
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn=DriverManager.getConnection(jdbcUrl,dbId,dbPass );
	
	String sql= "select name from member where name= ?";
	pstmt=conn.prepareStatement(sql);
    pstmt.setString(1,name);
	rs=pstmt.executeQuery();
    
	if(rs.next()){  //db 의 name 
	String rName=rs.getString("name");
      if(name.equals(rName)){ //사용자가 입력한 name
	       sql= "update member set position=?,tel=?,email=?,addr= ? where name= ? ";
	       pstmt=conn.prepareStatement(sql);
	       pstmt.setString(1,position);
	       pstmt.setString(2,tel);
	       pstmt.setString(3,email);
	       pstmt.setString(4,addr);
	       pstmt.setString(5,name);     
	       pstmt.executeUpdate();	   
%>
<html>
<head>
<title>레코드 수정</title>
</head>
<body>
  명함을 수정했습니다.
  <br>
   <button onclick="location.href='usePool_01.jsp'">리스트 보기</button>
</body>
</html>
<%
      }else
	out.println("번호가 틀렸습니다.");
	}else
	 out.println("이름이 틀렸습니다.");
  }catch(Exception e){ 
	  e.printStackTrace();
  }finally{
	  if(rs != null) 
		 try{rs.close();}catch(SQLException sqle){}
	  if(pstmt != null) 
		 try{pstmt.close();}catch(SQLException sqle){}
	  if(conn != null) 
		 try{conn.close();}catch(SQLException sqle){}
  }
%>