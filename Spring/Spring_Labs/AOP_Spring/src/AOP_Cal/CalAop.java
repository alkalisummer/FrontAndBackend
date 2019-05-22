package AOP_Cal;

import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class CalAop {
@Pointcut("execution(* AOP_Cal.NewCalc.MAX(..))")
public void pointCut() {
	
}
	
		
		@Before("pointCut()") //AOP_Annotation 패키지 안의 모든 결합점
		public void useCalc()
		{
			System.out.println("Before : 핵심 기능 전 실행 할 공통 기능 ");
		}
		
		//@AfterReturning("execution(* AOP_Annotation.*.*(..))") //AOP_Annotation 패키지 안	
		@AfterReturning("execution(int *(..))") //리턴 타입이 int인 모든 함수
		public void useCalc2()
		{
			System.out.println("AfterReturning : 핵심 기능 후 실행 할 공통 기능");
		}
		
	}


