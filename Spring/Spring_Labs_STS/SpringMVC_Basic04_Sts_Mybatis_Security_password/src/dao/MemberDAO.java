package dao;

import java.sql.SQLException;
import vo.Member;

public interface MemberDAO {
	//회원정보 얻기
	public Member getMember(String userid) throws ClassNotFoundException, SQLException;

	//회원가입
	public int insert(Member member) throws ClassNotFoundException, SQLException;
	
	public int idCheck(String userid) throws ClassNotFoundException, SQLException;
	
	public int loginCheck(Member member) throws ClassNotFoundException, SQLException;
	
	public int updateMember(Member member) throws ClassNotFoundException, SQLException;
	
	
}
