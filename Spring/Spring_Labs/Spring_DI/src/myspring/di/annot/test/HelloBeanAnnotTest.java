package myspring.di.annot.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

import org.springframework.context.support.GenericXmlApplicationContext;

import myspring.di.annot.Hello;
import myspring.di.annot.Printer;



public class HelloBeanAnnotTest {

	public static void main(String[] args) {
		//IoC 컨테이너 생성
	    
		ApplicationContext context = new GenericXmlApplicationContext("config/annot.xml");
		//Hello bean 가져오기 
		
		Hello hello2 = context.getBean("hello",Hello.class);
		System.out.println(hello2.sayHello());
		hello2.print();
		
	

	}

}
