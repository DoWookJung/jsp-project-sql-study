<%@   page language="java" contentType="text/html;   charset=utf-8"
	    pageEncoding="utf-8"%>
<%@   page import="java.sql.*"%>	    
<%@include   file="color.jsp" %>
<%   request.setCharacterEncoding("utf-8");%>

<jsp:useBean   id="regBean" class="ch10.register.RegisterBean">
<jsp:setProperty   name="regBean" property="*" />
</jsp:useBean>

<html>
<head>
<html>
	<button onclick="location.href='usePool_01.jsp'">리스트 보기</button> 
</html>
<%   String name = request.getParameter("name");

Connection   conn=null;
  PreparedStatement pstmt=null;
  ResultSet rs=null;
// DB쿼리문을 쓰기위해서 변수들을 초기화 해주었다	
 try{
		String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp?serverTimezone=Asia/Seoul";
	    String dbId="jspid";
	    String dbPass="jsppass";
		 
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
//DB를 생성하고 연결해주었다	
String   sql= "select * from member where name like   '"+name+"%';";
//쿼리문에 cardmember 테이블에 입력받은 name과 일치하는 정보를 모두 골라낸다
    pstmt=conn.prepareStatement(sql);
//쿼리문을 넣어준다
    rs=pstmt.executeQuery();
//쿼리문을 실행시켜서 resultset에 넣어준다	
while(rs.next()){
       String name1=   rs.getString("name");
       String position= rs.getString("position");
       String tel=   rs.getString("tel");
       String email=   rs.getString("email");
       String addr=   rs.getString("addr");
%>	


<title>검색 결과</title>
<link   href="style.css" rel="stylesheet" type="text/css">
<script   language="JavaScript" src="script.js"></script>
</head>

<body   bgcolor="<%=bodyback_c%>">
       <p><center>  <%=name%>님의 검색 결과    <br/><br/></center></p>
	<hr/>
    <table width="500"   border="0" cellspacing="0" cellpadding="2"  align="center">
      <tr height="39"   align="center" bgcolor="<%=title_c%>">   
        <td colspan="2"><b>명함 확인</b></td>
      </tr>
	<!-- 액션태그로 자바빈 값 각각 출력하기 -->  
    <!--자바빈 객체에서 저장된 프로퍼티 값을 얻어내기 위해 사용하는 프로퍼티 getProperty-->
      <tr> 
        <td width="100"   bgcolor="<%=title_c%>">이름</td>
        <td width="400" bgcolor="<%=value_c%>"><%=name1%>   
      </tr>
      <tr> 
        <td width="100"   bgcolor="<%=title_c%>">직책</td>
        <td width="400"   bgcolor="<%=value_c%>"><%=position%> 
      </tr>

      <tr>
        <td width="100"   bgcolor="<%=title_c%>">번호</td>
        <td width="400"   bgcolor="<%=value_c%>"><%=tel%>	
      </tr>

      <tr> 
        <td width="100"   bgcolor="<%=title_c%>">메일</td>
        <td width="400"   bgcolor="<%=value_c%>"><%=email%>
      </tr>

      <tr> 
        <td width="100"   bgcolor="<%=title_c%>">주소</td>
        <td width="400"   bgcolor="<%=value_c%>"><%=addr%> 
      </tr>
      <tr>
      	<td colspan="3" align="center">
      	<form method="post"   action="deleteTestForm_1.jsp">
           <input type="submit"   value="명함삭제"   >
        </form>
        </td>
      </tr>
        
  </table>
</body>

<%  }
 }catch(Exception e){ 
   e.printStackTrace();
 }finally{
   if(rs != null) 
      try{rs.close();}catch(SQLException   sqle){}
   if(pstmt != null) 
     try{pstmt.close();}catch(SQLException   sqle){}
   if(conn != null) 
     try{conn.close();}catch(SQLException   sqle){}
 }
%>
</html>