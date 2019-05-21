package DI_01;

public class HelloApp {

	public static void main(String[] args) {
		MessageBean messagebean = new MessageBean();
		messagebean.sayHello("hong");
		

	}

}
/*
 요구사항 
 영문버전(hong) : hello hong!
 한글버전(hong) : 안녕 hong!
 기능 2가지 
 
 
 >MessageBean_kr > 함수 > sayHello
 >MessageBean_en > 함수 > sayHello 
 
 >> 위 두개의 클래스에 대해서 Interface 를 구현 (다형성)
 


*/