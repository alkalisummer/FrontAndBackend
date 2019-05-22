package DI_02_Spring;

public class HelloApp {

	public static void main(String[] args) {
		//영문
		//MessageBean_en messagebean_en = new MessageBean_en();
		//messagebean_en.sayHello("hong");
		
		//한글
		//MessageBean_kr messagebean_kr = new MessageBean_kr();
		//messagebean_kr.sayHello("hong");

		//interface 다형성 (하나의 참조 변수가 여러개의 주소를 가질 수 있다)
		MessageBean messagebean = new MessageBean_en();
		messagebean.sayHello("hong");
	}

}
