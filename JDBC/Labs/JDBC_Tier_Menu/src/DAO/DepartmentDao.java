package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DTO.Department;
import UTILS.SingletonHelper;

public class DepartmentDao {
// 1. 전체조회 
	public List<Department> getDeptAllList() {
		// 여러건의 데이터 담는 클래스
		List<Department> deptlist = new ArrayList<Department>();
		// deptlist.add(new Dept())
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;

		try {
			conn = SingletonHelper.getConnection("oracle");
			String sql = "select deptno, dname from department";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Department dept = new Department(); // 하나의 row 담기 위한 객체
				dept.setDeptno(rs.getInt("deptno"));
				dept.setDname(rs.getString("dname"));
				deptlist.add(dept); // 배열에 객체 담는 것
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}

		return deptlist;
	}
	public List<Department> getDeptListByString2(String s) {
		// select deptno , dname , loc from dept where deptno=?

		Department dept = null; //
		List<Department> deptlist = new ArrayList<Department>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		ResultSet rs = null;

		try {
			conn = SingletonHelper.getConnection("oracle");
			
			
			String sql = "select deptno, dname from department where dname = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, s);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dept = new Department(); // 하나의 row 담기 위한 객체
				dept.setDeptno(rs.getInt("deptno"));
				dept.setDname(rs.getString("dname"));
				deptlist.add(dept);
				
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}

		return deptlist;
	}
	
	
	// 2. 조건조회 >> select 결과(where deptno=?) >> return single row
	public List<Department> getDeptListByString(String s) {
		// select deptno , dname , loc from dept where deptno=?

		Department dept = null; //
		List<Department> deptlist = new ArrayList<Department>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		ResultSet rs = null;

		try {
			conn = SingletonHelper.getConnection("oracle");
			
			
			String sql = "select deptno, dname from department where dname like ?";
			pstmt = conn.prepareStatement(sql);
			String str = "%%"+s+"%%";
			pstmt.setString(1, str);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dept = new Department(); // 하나의 row 담기 위한 객체
				dept.setDeptno(rs.getInt("deptno"));
				dept.setDname(rs.getString("dname"));
				deptlist.add(dept);
				
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}

		return deptlist;
	}

	// 3. 데이터 삽입
	// public int insertDept(int deptno , String dname , String loc) ..(x)
	public int insertDept(Department d) {
		//insert into dept(deptno, dname, loc) values(?,?,?)
		 Connection conn = null;
		 PreparedStatement pstmt=null;
		 int rowcount = 0;
		 
		 try {
			 conn = SingletonHelper.getConnection("oracle");
			 
			 String sql="insert into department(deptno,dname) values(?,?)";
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, d.getDeptno());
			 pstmt.setString(2, d.getDname());
			 rowcount = pstmt.executeUpdate(); 
			 
		 }catch (Exception e) {
			 e.printStackTrace();
			 System.out.println(e.getMessage());
		 }finally {
			 SingletonHelper.close(pstmt);
		 }
		 
		 return rowcount;
	}

	// 4. 데이터 수정
	public int updateDept(Department d, String dname) {
		//update dept set dname=? , loc=? where deptno=?
		Connection conn = null;
		 PreparedStatement pstmt=null;
		 PreparedStatement pstmt2 = null;
		 int rowcount = 0;
		 
		 
		 try {
			 conn = SingletonHelper.getConnection("oracle");
			
			 
			 
			 String sql="update department set dname =? , deptno = ? where dname=?";
			 pstmt = conn.prepareStatement(sql);
			 
			 pstmt.setString(1, d.getDname());
			 pstmt.setInt(2,d.getDeptno());
            
			 pstmt.setString(3, dname);
			 
			 rowcount = pstmt.executeUpdate(); 
			 
		 }catch (Exception e) {
			 e.printStackTrace();
			 System.out.println(e.getMessage());
		 }finally {
			 SingletonHelper.close(pstmt);
			 SingletonHelper.close(pstmt2);
			 
		 }
		 
		 return rowcount;
	}

	// 5. 데이터 삭제
	public int deleteDept(int deptno) {
		//delete from dept where deptno=?
		Connection conn = null;
		 PreparedStatement pstmt=null;
		 int rowcount = 0;
		 
		 try {
			 conn = SingletonHelper.getConnection("oracle");
			 String sql="delete from department where deptno=?";
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, deptno);
			 rowcount = pstmt.executeUpdate();
		 }catch (Exception e) {
			 e.printStackTrace();
			 System.out.println(e.getMessage());
		 }finally {
			 SingletonHelper.close(pstmt);
		 }
		 
		 return rowcount;
	
	
	
	
	
	
	
}}
