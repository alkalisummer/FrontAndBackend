package AOP_Cal;


import org.springframework.aop.framework.ProxyFactoryBean;

public class NewCalc implements Calc{

	@Override
	public int ADD(int x, int y, int z) {
		//보조업무(공통사항 : cross-cutting-concern)
		int sum = x + y + z; //주업무(core-concern)
		//보조업무(공통사항 : cross-cutting-concern)
		
		System.out.println("ADD 함수 실행:"+ sum);
		
		return sum;
	}

	@Override
	public int MUL(int x, int y, int z) {
		//보조업무(공통사항 : cross-cutting-concern)
		int mul = x * y * z; //주업무(core-concern)
		//보조업무(공통사항 : cross-cutting-concern)
		System.out.println("MUL 함수 실행:"+ mul);
		
		return mul;
	}

	@Override
	public int MAX(int x, int y, int z) {
		//보조업무(공통사항 : cross-cutting-concern)
		
		int arr[] = {x,y,z};
		int max = 0;
		for(int i=0;i<3;i++) {
			if(max<arr[i]) {
				max = arr[i];
			}
		}
		System.out.println("MAX 함수 실행:"+ max);
		//보조업무(공통사항 : cross-cutting-concern)
		return max;
	}

	@Override
	public int MIN(int x, int y, int z) {
		
		int arr[] = {x,y,z};
		int min = x;
		for(int i=0;i<3;i++) {
			if(min>arr[i]) {
				min = arr[i];
			}
		}
		
		System.out.println("MIN 함수 실행:"+ min);
		return min;
	}

	@Override
	public int AVG(int x, int y, int z) {
		// TODO Auto-generated method stub
		
		int avg = (x+y+z)/3;
		
		System.out.println("AVG 함수 실행:"+ avg);
		return avg;
	}

}
