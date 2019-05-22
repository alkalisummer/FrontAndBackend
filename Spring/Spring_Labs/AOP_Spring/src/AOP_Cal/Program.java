package AOP_Cal;

import java.lang.reflect.Proxy;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;



public class Program {

	public static void main(String[] args) {
	 ApplicationContext context = new GenericXmlApplicationContext("AOP_Cal/ApplicationContext.xml");
		Calc calc= context.getBean("calc",Calc.class);
		
		 
		
		//int result = calc.SUB(10, 5);// 보조업무가 실행되면 안돼요
		calc.ADD(10, 5, 3);
		calc.MUL(10, 5, 3);
		calc.MAX(10, 5, 3);
		calc.MIN(10, 5, 3);
		calc.AVG(10, 5, 3);
		
	}

}
       

