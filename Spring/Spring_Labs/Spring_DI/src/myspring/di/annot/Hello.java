package myspring.di.annot;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Hello {
	@Value("${myname}")
   String name;
   
//   @Autowired
//   @Qualifier("consolePrinter")
   @Resource(name="${printer2}")
   Printer printer;

   /*
public void setName(String name) {
	this.name = name;
}

public void setPrinter(Printer printer) {
	this.printer = printer;
}
*/
public String sayHello() {
	return "Hello"+ name;
	
}

public void print() {
	this.printer.print(sayHello());
}
}
