package DI_Annotation_04;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor;
import org.springframework.beans.factory.annotation.Qualifier;

public class MonitorViewer {
 
	
	//setter 통한 자동 주입 
	private Recorder recorder;

	public Recorder getRecorder() {
		return recorder;
	}
	
    // @Autowired 오류남(같은 타입의 객체 여러개)
	@Resource(name="zz")//by name(같은 타입이 여러개 있더라도 name 하나 선택)
	public void setRecorder(Recorder recorder) {
		this.recorder = recorder;
		System.out.println("setter 주입 성공: "+recorder);
	}
	 
	
	
  
   
}
