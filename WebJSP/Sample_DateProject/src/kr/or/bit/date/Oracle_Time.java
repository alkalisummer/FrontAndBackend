package kr.or.bit.date;

public class Oracle_Time {
	public static void main(String[] args) {
        Connection conn =null;
        PreparedStatement pstmt =null;
        ResultSet rs = null;
        
        try{
            conn = Singleton_ConnectionHelper.getConnection("oracle");
            String sql="select tdate,tdate2 from t_table";
            pstmt = conn.prepareStatement(sql); //미리 컴파일
            
            rs = pstmt.executeQuery();
            if(rs.next()){
                do{
                    //System.out.println(rs.getDate(1) +"/"+rs.getTimestamp(2));
                    Tdate tdate = new Tdate();
                    /*
                     public java.sql.Date t_date;
                    public java.sql.Timestamp t_date2;
                    public java.util.Date t_date3;
                    */
                    tdate.t_date = rs.getDate(1);
                    tdate.t_date2 = rs.getTimestamp(2);
                    tdate.t_date3 = rs.getTimestamp(1);
                    System.out.println(tdate.t_date);
                    System.out.println(tdate.t_date2);
                    System.out.println(tdate.t_date3);
                    
                    //원칙
                    //Oracle Date      > Java: Java.sql.Date  (년월일)
                    //Oracle Timestamp > ㅓjava: java.sql.Timestamp(년월일시분초)
                    //날짜 > 문자로 전환해서 (필요한 값만 추출)
                    /*
                     select sysdate , 
                               to_char(tdate2,'YYYY') || '년' as "yyyy" ,
                               to_char(tdate2,'YEAR'),
                               to_char(tdate2,'MM'),
                               to_char(tdate2,'DD'),
                               to_char(tdate2,'DAY'),
                            to_char(tdate2,'HH')
                     from t_table; 
                      
                     */
                    
                }while(rs.next());
            }else{
                System.out.println("데이터 없어요");
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
        }finally{
            Singleton_ConnectionHelper.close(pstmt);
            Singleton_ConnectionHelper.close(rs);
            Singleton_ConnectionHelper.close(conn);
        }
                
 
    }
 
}
