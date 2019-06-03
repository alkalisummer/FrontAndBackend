package com.dao;


import java.util.List;

import vo.EmpChartDto;
import vo.EmpDto;




public interface EmpDao {
	
	public EmpDto getEmpList(String id);
	
	public List<EmpDto> getEmpList();
	
	public List<EmpDto> getEmpListLike(int intValue);
	
	public int AddEmpMember(EmpDto empdto);
	
	public int updateEmp(EmpDto empdto);
	
	public int updateFakeEmp(String empno);
	
	public int deleteEmp(int empno);
	
	public int totalEmpMemberCount();
	
	public List<EmpChartDto> hiredateTable();
	
	public String hiredateChart();
	
	public String salChart();
	
	public String isCheckByEmpno(String empnoStr);
	
		
	

}