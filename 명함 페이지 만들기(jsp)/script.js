function inputCheck(){
	var userinput = eval("document.regForm");
// 이름, 이메일, 연락처는 required 속성을 사용해 제외했습니다.

	if(userinput.addr.value==""){
		alert("주소를 입력해 주세요");
		userinput.addr.focus();
		return false;
	}
	//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
	// asd@naver.com으로 완벽해야지만 넘어감	
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if(exptext.test(userinput.email.value)==false){
			alert("이 메일형식이 올바르지 않습니다.");
			userinput.email.focus();
			return false;
	}
}

// 전화번호에 하이픈을 넣어주는 기능
function inputPhoneNumber(obj) {
    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";

    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}