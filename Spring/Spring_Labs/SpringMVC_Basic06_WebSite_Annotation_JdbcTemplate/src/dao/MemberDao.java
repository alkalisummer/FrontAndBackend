package dao;

import vo.Member;

public interface MemberDao {

    public Member getMember(String uid) throws Exception;
    
    public int insert(Member member) throws Exception;
}