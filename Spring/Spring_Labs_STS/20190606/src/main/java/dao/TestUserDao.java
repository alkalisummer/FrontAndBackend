package dao;

import dto.Emp;

public interface TestUserDao {
	public int join(Emp emp);
    public int login(String userid);
    
}
