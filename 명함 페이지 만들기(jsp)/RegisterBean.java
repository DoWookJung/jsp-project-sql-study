// 과제
 package ch10.register; //패키지에서 정의한 폴더가 생성되고 클래스 파일이 생성됨
 public class RegisterBean{ //클래스 선언하기
	// 직접 접근 불가능하도록 캡슐화
 	private String name;	//데이터 은닉성을 위해 멤버변수 private 변수 사용 name(이름)
	private String position;	//데이터 은닉성을 위해 멤버변수 private 변수 사용 position(직책)
	private String tel;	//데이터 은닉성을 위해 멤버변수 private 변수 사용 tell(전화번호)
 	private String email;	//데이터 은닉성을 위해 멤버변수 private 변수 사용 email(이메일)
  	private String addr;	//데이터 은닉성을 위해 멤버변수 private 변수 사용 address(주소)

	// public으로 접근 가능하게 한다.
 	//메소드 선언하기 : Setter() 프로퍼티 값을 저장, 설정할 때 사용한다.
 	public void setName(String name) {	//이름(set 함수)
 		this.name = name; 
 	}
	public void setPosition(String position) {	//직책(set 함수)
 		this.position = position; 
 	}
	 public void setTel(String tel) {	//전화번호(set 함수)
 		this.tel = tel; 
 	}	
 	public void setEmail(String email) {	//이메일(set 함수)
 		this.email = email; 
 	}
	 public void setAddr(String addr) {	//주소(set 함수)
 		this.addr = addr; 
 	}
 	
	//메소드 선언 : Getter() 프로퍼티 값을 읽어낼 때 사용한다.
 	public String getName() {	//이름(get 함수)
 		return name;
 	}
	public String getPosition() {	//직책(get 함수)
 		return position;
 	}
   	public String getTel() {	//전화번호(get 함수)
 		return tel;
 	}
 	public String getEmail() {	//이메일(get 함수)
 		return email;
 	}
	 public String getAddr() {	//주소(get 함수)
 		return addr;
 	}
 }