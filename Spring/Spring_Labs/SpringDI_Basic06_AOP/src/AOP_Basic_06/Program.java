package AOP_Basic_06;

import java.lang.reflect.Proxy;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Program {

	public static void main(String[] args) {
	 ApplicationContext context = new GenericXmlApplicationContext("classpath:AOP_Basic_06/ApplicationContext.xml");
		Calc calc= context.getBean("proxy",Calc.class);
		
		//int result = calc.SUB(10, 5);// 보조업무가 실행되면 안돼요
		int result = calc.ADD(10, 5);
		System.out.println("결과 : " + result);
	}

}



