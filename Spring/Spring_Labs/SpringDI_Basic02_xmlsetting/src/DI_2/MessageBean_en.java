package DI_2;

public class MessageBean_en implements MessageBean{

	@Override
	public void sayHello(String name) {
		System.out.println("Hello " + name + "!");
		
	}

}
