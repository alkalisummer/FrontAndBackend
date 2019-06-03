package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import com.google.gson.Gson;

import vo.EmpDto;



public class EmpDao {
	DataSource ds; //DataSource라는 객체를 커넥션풀을 관리하는 목적으로 사용되는 객체
	Connection conn;
	Context context;
	
	public EmpDao() {
		conn = null;	
		try {
			context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("memodao.java -> 기본생성자 오류 : " +e.getMessage());
		}
	}
	
	//Read One
	public EmpDto getEmpList(String id) {
		EmpDto emp = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			emp = new EmpDto();
			conn = ds.getConnection();
			String sql = "select * from emp where empno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				emp.setEmpno(rs.getInt("empno"));
				emp.setEname(rs.getString("ename"));
				emp.setJob(rs.getString("job"));
				emp.setMgr(rs.getInt("mgr"));
				emp.setHiredate(rs.getString("hiredate").substring(0,10));
				emp.setSal(rs.getInt("sal"));
				emp.setComm(rs.getInt("comm"));
				emp.setDeptno(rs.getInt("deptno"));
			}
		}catch(Exception e) {
			System.out.println("getEmpListById() 오류 발생1" + e.getMessage());
		
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			}catch(Exception e) {
				System.out.println("getEmpListById() 오류 발생2" + e.getMessage());
			}
		}
		return emp;
	}
	
	//Read list
	public List<EmpDto> getEmpList() {
		String sql = "select * from emp where del is null or del=0";
		List<EmpDto> empList = new ArrayList<>();
		try(
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			){
			while(rs.next()) {
				EmpDto emp = new EmpDto();
				emp.setEmpno(rs.getInt("empno"));
				emp.setEname(rs.getString("ename"));
				emp.setJob(rs.getString("job"));
				emp.setMgr(rs.getInt("mgr"));
				emp.setHiredate(rs.getString("hiredate").substring(0,10));
				emp.setSal(rs.getInt("sal"));
				emp.setComm(rs.getInt("comm"));
				emp.setDeptno(rs.getInt("deptno"));
				empList.add(emp);
			}
		}catch(Exception e) {
			System.out.println("getEmpList() 오류발생1" + e.getMessage());
		}
		return empList;
	}

	//Read list (like deptno or empno)
	public List<EmpDto> getEmpListLike(int intValue) {
		
		List<EmpDto> empList = new ArrayList<>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			String sql = "select * from emp where (del is null or del=0) and (EMPNO like '%' || ? || '%' or DEPTNO like '%' || ? || '%')";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,String.valueOf(intValue));
			pstmt.setString(2,String.valueOf(intValue));
			try {
				rs = pstmt.executeQuery();	
			}catch(Exception e) {
				System.out.println("아마도 여기서 오류" + e.getMessage());
			}
			
			while(rs.next()) {
				EmpDto emp = new EmpDto();
				emp.setEmpno(rs.getInt("empno"));
				emp.setEname(rs.getString("ename"));
				emp.setJob(rs.getString("job"));
				emp.setMgr(rs.getInt("mgr"));
				emp.setHiredate(rs.getString("hiredate").substring(0,10));
				emp.setSal(rs.getInt("sal"));
				emp.setComm(rs.getInt("comm"));
				emp.setDeptno(rs.getInt("deptno"));
				empList.add(emp);
			}
		}catch(Exception e) {
			System.out.println("getEmpList() 오류발생1 - " + e.getMessage());
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(rs!=null) {rs.close();}
				if(conn!=null) {conn.close();}
			}catch(SQLException e1) {
				System.out.println("getEmpListLike() 오류발생 : " +e1.getMessage());
			}
		}
		return empList;
	}
	
	
	//CREATE
	public int AddEmpMember(EmpDto empdto)  {
		int resultrow=0;
		PreparedStatement pstmt = null;
		String strDate = empdto.getHiredate();
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		Date longDate;
		java.sql.Date sqlDate = null;
		try {
			longDate = f.parse(strDate);
			sqlDate = new java.sql.Date(longDate.getTime());
		    String sql="insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values(?,?,?,?,?,?,?,?)";
			conn = ds.getConnection();
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setInt(1, empdto.getEmpno());
		    pstmt.setString(2, empdto.getEname());
		    pstmt.setString(3, empdto.getJob());
		    pstmt.setInt(4, empdto.getMgr());
		    pstmt.setDate(5, sqlDate);
		    pstmt.setInt(6, empdto.getSal());
		    pstmt.setInt(7, empdto.getComm());
		    pstmt.setInt(8, empdto.getDeptno());
		    resultrow = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("AddEmpMember() 오류발생 :" + e.getMessage());
		}finally {
			try {
				if(conn!=null) {conn.close();}
				if(pstmt!=null) {pstmt.close();}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return resultrow;
	}
	
	//Update
	public int updateEmp(EmpDto empdto) {
		//update memo set email=? , content=? where id=?
		int resultrow=0;
		PreparedStatement pstmt = null;
		String strDate = empdto.getHiredate();
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		Date longDate;
		java.sql.Date sqlDate = null;
		try {
			longDate = f.parse(strDate);
			sqlDate = new java.sql.Date(longDate.getTime());
		} catch (ParseException e1) {
			System.out.println("updateEmp() 날짜변경 오류 발생! : " +e1.getMessage());
		}
		
		try {
		    String sql="update emp set empno=?, ename=?, job=?, mgr=?, hiredate=?, sal=?, comm=?, deptno=? where empno=?";
			conn = ds.getConnection();
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setInt(1, empdto.getEmpno());
		    pstmt.setString(2, empdto.getEname());
		    pstmt.setString(3, empdto.getJob());
		    pstmt.setInt(4, empdto.getMgr());
		    pstmt.setDate(5, sqlDate);
		    pstmt.setInt(6, empdto.getSal());
		    pstmt.setInt(7, empdto.getComm());
		    pstmt.setInt(8, empdto.getDeptno());
		    pstmt.setInt(9, empdto.getEmpno());
		    resultrow = pstmt.executeUpdate();
		    
		}catch(Exception e) {
			System.out.println("updateEmp() 오류발생 :" + e.getMessage());
			resultrow=-1;
		}finally {
			try {
				if(conn!=null) {conn.close();}
				if(pstmt!=null) {pstmt.close();}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return resultrow;
	}
	
	//Update
	public int updateFakeEmp(String empno) {
		//update memo set email=? , content=? where id=?
		int resultrow=0;
		PreparedStatement pstmt = null;
		
		try {
		    String sql="update emp set del=? where empno=?";
			conn = ds.getConnection();
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setInt(1, 1);
		    pstmt.setString(2, empno);
		    resultrow = pstmt.executeUpdate();
		    
		}catch(Exception e) {
			System.out.println("updateEmp() 오류발생 :" + e.getMessage());
			resultrow=-1;
		}finally {
			try {
				if(conn!=null) {conn.close();}
				if(pstmt!=null) {pstmt.close();}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return resultrow;
	}
	
	public int deleteEmp(int empno) {
		//delete from memo where id=?
		int resultrow=0;
		String sql="delete from emp where empno=?";
		PreparedStatement pstmt = null;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, empno);
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("삭제오류 : " + e.getMessage());
		}finally {
			try {
				if(conn!=null) {conn.close();}
				if(pstmt!=null) {pstmt.close();}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} 
		}
		return resultrow;
	}
	
	//EMP 총 명수 구하기(del=1 제외)
	public int totalEmpMemberCount() {
		int totalcount = 0;
		String sql="select count(*) cnt from emp where del is null or del=0";
		try(
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			) {
			if(rs.next()) {
				totalcount = rs.getInt("cnt");
			}else {
				System.out.println("totalEmpMemberCount() 구하기 실패");
			}
		}catch (Exception e) {
			System.out.println("totalEmpMemberCount() 오류 : " + e.getMessage());
		}
		return totalcount;
	}
	
	//chart 리스트로 표에 뿌리기
	public List<EmpChartDto> hiredateTable() {
		String sql = "SELECT TO_CHAR(HIREDATE,'YYYY') 입사년도 , COUNT(*) 인원수 FROM emp GROUP BY TO_CHAR(HIREDATE,'YYYY') ORDER BY TO_CHAR(HIREDATE,'YYYY')";
		List<EmpChartDto> chartList = new ArrayList<>();
		Gson gson = new Gson();
		String json="";
		try(
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			){
			while(rs.next()) {
				EmpChartDto dto = new EmpChartDto();
				dto.setHiredate(rs.getInt(1));
				dto.setEmployee(rs.getInt(2));
				chartList.add(dto);
			}
			json = gson.toJson(chartList);
			System.out.println(json);
		}catch(Exception e){
			System.out.println("avgSalGroupBy함수 오류: "+e.getMessage() );
		}
		return chartList;
	}
	
	//json 객체 생성 후 보내기(비동기처리-chart1)
	public String hiredateChart() {
		String sql = "SELECT TO_CHAR(HIREDATE,'YYYY'), COUNT(*) FROM emp GROUP BY TO_CHAR(HIREDATE,'YYYY') ORDER BY TO_CHAR(HIREDATE,'YYYY')";
		List<EmpChartDto> chartList = new ArrayList<>();
		Gson gson = new Gson();
		String json="";
		try(
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			){
			while(rs.next()) {
				EmpChartDto dto = new EmpChartDto();
				dto.setHiredate(rs.getInt(1));
				dto.setEmployee(rs.getInt(2));
				chartList.add(dto);
			}
			json = gson.toJson(chartList);
			System.out.println(json);
		}catch(Exception e){
			System.out.println("avgSalGroupBy함수 오류: "+e.getMessage() );
		}
		return json;
	}
		
	//json 객체 생성 후 보내기(비동기처리-chart2)
	public String salChart() {
		String sql = "SELECT sal, ename FROM emp";
		List<EmpChartDto> chartList = new ArrayList<>();
		Gson gson = new Gson();
		String json="";
		try(
			Connection conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			){
			while(rs.next()) {
				EmpChartDto dto = new EmpChartDto();
				dto.setSalary(rs.getInt(1));
				dto.setEname(rs.getString(2));
				chartList.add(dto);
			}
			json = gson.toJson(chartList);
			System.out.println("json : "+json);
		}catch(Exception e){
			System.out.println("avgSalGroupBy함수 오류: "+e.getMessage() );
		}
		return json;
	}
	
	//추가함수 (비동기 통해서 ID 유무)
	public String isCheckByEmpno(String empnoStr) {
		String isEmpno= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select empno from emp where empno=?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empnoStr);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				isEmpno = "true";
			}else {
				isEmpno = "false";
			}
		}catch (Exception e) {
			System.out.println("isEmpno() 오류발생 : " + e.getMessage());
		}finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				if(rs!=null) {rs.close();}
				if(conn!=null) {conn.close();}
			} catch (SQLException e) {
				System.out.println("isEmpno() 오류발생 : " + e.getMessage());
			}
		}
		return isEmpno;
	}

}