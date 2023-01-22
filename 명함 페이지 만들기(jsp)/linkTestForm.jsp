<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta 
	charset="UTF-8"
	
	name="viewport"
	content="width=device-width;
	initial-scale=1.0;
	minimum-scale=1.0;
	maximum-scale=1.0;
	user-scalable=yes;"
	/>
	
<!--<style>
		@media only screen and (max-width: 320px) {
			* { background: #386665; color: white; }
		}
		
		/* 세로보기모드 */
		@media only screen and (min-width: 321px) and (orientation: portrait) {  
			* { background: #ffa0a0; color: black; }
		}
		
		/* 가로보기모드 */
		@media only screen and (min-width: 321px) and (orientation: landscape) { 
			* { background: #baedf4; color: black; }
		}
</style>-->

<title>외부 프로그램 링크</title>
</head>


<body>

	<h2>외부 프로그램 링크 사용하기</h2>
	<form method="post" action="linkTestProc.jsp" >
		<!--이메일 입력-->
		<label for="email">E-mail</label>
		<input id="email" name="email" type="email" size="15" placeholder="Input E-mail" autofocus required><p>
		
		<!--전화번호 입력(전화)-->
		<label for="phone">Phone</label>
		<input id="phone" name="phone" type="number" size="10" placeholder="Input phone number"><p>
		
		<!--전화번호 입력(SMS)-->
		<label for="sms">SMS</label>
		<input id="sms" name="sms" type="number" size="10" placeholder="Input phone number"><p>
		
		<!--주소 입력-->
		<label for="addr">Address</label>
		<input id="addr" name="addr" type="text" size="25" placeholder="Input Address"><p>		
		<input type="submit" value="SUBMIT"></input>	
	</form>
	
	
</body>

</html>