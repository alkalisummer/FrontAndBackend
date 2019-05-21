package DI_2;

public class MessageBean_kr implements MessageBean {

	@Override
	public void sayHello(String name) {
		System.out.println("안녕 " + name + "!");		
	}

}
