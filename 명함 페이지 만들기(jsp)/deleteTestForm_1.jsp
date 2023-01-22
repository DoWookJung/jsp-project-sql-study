<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>레코드 삭제</title>
</head>
<body>
  <h2>명함 삭제</h2>
    
  <form method="post" action="deleteTestPro_1.jsp">
      이름: <input type="text" name="name" maxlength="50"><br>
      전화번호: <input type="text" name="tel" maxlength="16"><br>
      <input type="submit" value="입력완료">
      <!-- 이름과 번호 로 삭제 확인--> 
  </form>
</body>
</html>