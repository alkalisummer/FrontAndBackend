package myspring.di.xml.test;

import org.springframework.context.ApplicationContext;

import org.springframework.context.support.GenericXmlApplicationContext;

import myspring.di.xml.Hello;
import myspring.di.xml.Printer;



public class HelloBeanTest {

	public static void main(String[] args) {
		//IoC 컨테이너 생성
		ApplicationContext context = new GenericXmlApplicationContext("config/beans.xml");
		//Hello bean 가져오기 
		
		Hello hello = (Hello)context.getBean("hello");
		System.out.println(hello.sayHello());
		hello.print();
		
		//StringPrinter Bean 가져오기 
		Printer printer =context.getBean("printer",Printer.class);
		System.out.println(printer.toString());
		
		

	}

}
