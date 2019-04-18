import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import DAO.DepartmentDao;
import DTO.Department;


public class Program {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
        DepartmentDao dao = new DepartmentDao();
		while (true) {
			System.out.println("**********************");
			System.out.println("* 1. 부서 전체 목록");
			System.out.println("* 2. 부서 신규 등록");
			System.out.println("* 3. 부서 변경");
			System.out.println("* 4. 부서 삭제");
			System.out.println("* 5. 부서 검색");
			System.out.println("* 6. 프로그램 종료");
			System.out.println("**********************");
			System.out.print("작업 번호 선택 : ");
			String menu = sc.nextLine();
			
			

			switch (menu) {
			case "1":
				List<Department> deptlist= dao.getDeptAllList(); //요청
				//화면구성
				if(deptlist != null) {
					DeptPrint(deptlist);
				}
				break;
			case "2":
				System.out.println("부서번호를 입력하세요: ");
			    int deptNo = Integer.parseInt(sc.nextLine());
			    System.out.println("부서이름을 입력하세요: ");
			    String deptName = sc.nextLine();
			    
			    Department d = new Department();
			    d.setDeptno(deptNo);
			    d.setDname(deptName);
			    
			    
			    int insertrow = dao.insertDept(d);
				if(insertrow > 0) {
					System.out.println("INSERT ROW : " + insertrow);
				}else {
					System.out.println("INSERT FAIL");
				}
				
			    break;
			case "3":
				 Department d2 = new Department();
				 System.out.println("변경할 부서명: ");
				 String changeDname = sc.nextLine();
				 System.out.println(dao.getDeptListByString2(changeDname));
				 
			     System.out.println("부서코드: ");
				 int deptnum = Integer.parseInt(sc.nextLine());
				 
				 d2.setDeptno(deptnum);
				 
				 System.out.println("부서명: ");
				 String changeDname2 = sc.nextLine();
				  d2.setDname(changeDname2);
				  dao.updateDept(d2,changeDname);
				break;
			case "4":
				  System.out.println("삭제할 부서번호: ");
				  int deptno = Integer.parseInt(sc.nextLine());
				  int deleterow = dao.deleteDept(deptno);
					if(deleterow > 0) {
						System.out.println("DELETE ROW : " + deleterow );
					}else {
						System.out.println("DELETE FAIL");
					}
				break;
			case "5":
				System.out.println("검색할 부서명: ");
			    String dname = sc.nextLine();
			     List<Department>deptlist2  = dao.getDeptListByString(dname);
			     DeptPrint(deptlist2);
				break;
			case "6":
				return;
			default:
				System.out.println("올바른 메뉴 번호를 입력해주세요.");
			}
			
			
		}
	}
	public static void DeptPrint(Department dept) {
		System.out.println(dept.toString());
	}
	
	public static void DeptPrint(List<Department> list) {
		for(Department data : list) {
			System.out.println(data.toString());
		}
	}
}