package DI3;

import java.util.Scanner;

public class NewRecordView implements RecordView {
  //점수를 출력하기 위해서(NewRecord 객체를 필요)
	
   private NewRecord record;
   
   //1.[생성자]를 통해서 필요한 객체 생성 or 주입 >> DI
   //2. 함수([setter])를 통해서 필요한 객체 주입 >> DI2
   
   
   //핵심 Point
   //객체를 참조할때 다형성(인터페이스)
   public void setRecord(Record record) { // parameter의 타입을 Record로 씀으로써 다형성을 확보 
	   //함수의 parameter를 통해서 NewRecord 객체의 주소를 얻음.
	   this.record = (NewRecord)record;
   }
    @Override
    public void print() {
    	System.out.println(record.total()+"/"+record.avg());
    }
    
    @Override
    public void input() {
    	Scanner scan = new Scanner(System.in);
    	System.out.println("kor:");
    	record.setKor(scan.nextInt());
    	
    	System.out.println("eng:");
    	record.setKor(scan.nextInt());
    	
    	System.out.println("math:");
    	record.setKor(scan.nextInt());
    	
    	
    }
}
