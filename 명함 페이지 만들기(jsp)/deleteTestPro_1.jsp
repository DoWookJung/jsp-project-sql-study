<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("utf-8");%>

<%
  String name= request.getParameter("name");
  String tel= request.getParameter("tel");

  Connection conn=null;
  PreparedStatement pstmt=null;
  ResultSet rs=null;

  try{
	String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp?serverTimezone=Asia/Seoul";
    String dbId="jspid";
    String dbPass="jsppass";
	 
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	
	String sql= "select name, tel from member where name= ?";
	pstmt=conn.prepareStatement(sql);
    pstmt.setString(1,name);
	rs=pstmt.executeQuery();
    
	if(rs.next()){ 
	  String rName=rs.getString("name");
	  String rTel=rs.getString("tel");
	  if(name.equals(rName) && tel.equals(rTel)){
	    sql= "delete from member where name= ? ";
	    pstmt=conn.prepareStatement(sql);
	    pstmt.setString(1,name);
	    pstmt.executeUpdate();
%>
<html>
<head>
<title>레코드 삭제</title>
</head>
<body>
  member 테이블의 레코드를 삭제했습니다. <br>
  <form method="post" action="usePool_01.jsp">
  <input type="submit" value="조회창으로">
</body>
</html>
<%
	  }else
		out.println("전화번호가 틀렸습니다.");
	}else
		 out.println("없는 이름입니다.");
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