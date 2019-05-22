package AOP_Basic_05;

import java.lang.reflect.Proxy;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Program {

	public static void main(String[] args) {
	 ApplicationContext context = new GenericXmlApplicationContext("classpath:AOP_Basic_05/ApplicationContext.xml");
		Calc calc= context.getBean("proxy",Calc.class);
		
		int result = calc.MUL(10000, 50000);
		System.out.println("결과 : " + result);
	}

}



