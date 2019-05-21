package DI_04_Spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;



public class HelloApp {

	public static void main(String[] args) {
	    //java 코드 
		//MessageBeanImpl messagebean = new MessageBeanImpl("hong"); // 생성자 초기화 (name)
		//messagebean.setGreeting("hello");//setter 초기화
	    
		//interface: MessageBean 타입
		//messagebean.sayHello();
		
		//위작업의 코드를 xml 설정을 통해서 .... Spring 
		
		ApplicationContext context = new GenericXmlApplicationContext("classpath:DI_04_Spring/DI_04.xml");
		
		MessageBean messagebean = context.getBean("m2",MessageBean.class);
		messagebean.sayHello();
	}

}
