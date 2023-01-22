
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta 
	charset="UTF-8"
	
	name="viewport"
	content="width=device-width;
	initial-scale=1.0;
	minimum-scale=1.0;
	maximum-scale=1.0;
	user-scalable=no;"
	/>

<% request.setCharacterEncoding("utf-8");%>

<!--<style>
		@media only screen and (max-width: 320px) {
			* { background: #386665; color: white; }
		}
		
		/* 세로보기모드 */
		@media only screen and (min-width: 321px) and (orientation: portrait) {  
			* { background: #f2efb8; color: black; }
		}
		
		/* 가로보기모드 */
		@media only screen and (min-width: 321px) and (orientation: landscape) { 
			* { background: #c1f9bd; color: black; }
		}
</style>-->

	
	<%
	   String email = request.getParameter("email");
	   String phone = request.getParameter("phone");
	   String sms = request.getParameter("sms");
	   String addr = request.getParameter("addr");
	%>

	<body>
		<form method="post" action="linkTestForm.jsp" >
			<h2>외부 프로그램 링크 사용하기</h2>
			<!--입력한 이메일 출력-->
			<label style="font-weight:bold">E-mail  </label>
			<a href="mailto:<%=email %>"><%=email%></a><p>
			
			<!--입력한 전화번호 출력-->
			<label style="font-weight:bold">Phone  </label>
			<a href="tel:<%=phone %>" target="_blank"><%=phone%></a><p>
			
			<label style="font-weight:bold">SMS  </label>
			<a href="sms:<%=sms %>"  target="_blank"><%=sms%></a><p>
			
			<!--입력한 주소 출력-->
			<label style="font-weight:bold">Adress</label>
			<a href="http://maps.google.com/maps?q=<%=addr %>"><%=addr%></a><p>
			
			<input type="submit" value="HOME"></input>		
		</form>	
	</body>
