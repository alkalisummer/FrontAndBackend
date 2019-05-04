package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.json.simple.JSONObject;

import kr.or.bit.dto.Emp;
import kr.or.bit.dto.EmpFace;

// CRUD �옉�뾽
// DB�꽌踰� �넻�떊 > CRUD method �젣怨�
// memo table > select, insert, update, delete �븿�닔 �젣怨�
// select(�떎以�, �떒�씪), insert, update, delete 5媛� �븿�닔媛� 湲곕낯

// CRUD �븿�닔 �깮�꽦 (parameter, return type) 怨좊��
// parameter 媛앹껜 (DTO ���엯)
// return 媛앹껜, 臾몄옄�뿴 return

// public int insertMemo(String id, String email, String content) {}
// public int insertMemo(Memo memo) {}

// �떒�씪 select
// public Memo selectByMemoID(String id) {}

// �떎以� select
// public List<Memo> selectMemo() {}
// List<Memo> list = new ArrayList<>();
public class EmpDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;

	public EmpDao() {
		try {
			Context context = new InitialContext(); // �씠由� 湲곕컲 寃��깋
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle"); // jdbc/oracle �씠由꾩쓽 pool�쓣 李얠쓬
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public List<Emp> selectAll() {
		List<Emp> list = new ArrayList<>();
		String sql = "select * from copyemp";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Emp emp = new Emp();
				emp.setEmpno(rs.getInt("empno"));
				emp.setEname(rs.getString("ename"));
				emp.setJob(rs.getString("job"));
				emp.setMgr(rs.getInt("mgr"));
				emp.setHiredate(rs.getDate("hiredate"));
				emp.setSal(rs.getInt("sal"));
				emp.setComm(rs.getInt("comm"));
				emp.setDeptno(rs.getInt("deptno"));

				list.add(emp);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}

		return list;
	}

	public Emp selectByEmpno(int empno) {
		Emp emp = null;
		String sql = "select * from copyemp where empno = ?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, empno);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				emp = new Emp();
				emp.setEmpno(rs.getInt("empno"));
				emp.setEname(rs.getString("ename"));
				emp.setJob(rs.getString("job"));
				emp.setMgr(rs.getInt("mgr"));
				emp.setHiredate(rs.getDate("hiredate"));
				emp.setSal(rs.getInt("sal"));
				emp.setComm(rs.getInt("comm"));
				emp.setDeptno(rs.getInt("deptno"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}

		return emp;
	}

	public List<Emp> selectByDeptno(int deptno) {
		List<Emp> empList = new ArrayList<Emp>();
		String sql = "select * from copyemp where deptno = ?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Emp emp = new Emp();
				emp.setEmpno(rs.getInt("empno"));
				emp.setEname(rs.getString("ename"));
				emp.setJob(rs.getString("job"));
				emp.setMgr(rs.getInt("mgr"));
				emp.setHiredate(rs.getDate("hiredate"));
				emp.setSal(rs.getInt("sal"));
				emp.setComm(rs.getInt("comm"));
				emp.setDeptno(rs.getInt("deptno"));
				empList.add(emp);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}

		return empList;
	}

	public int updateEmp(Emp emp) {
		int row = 0;
		String sql = "update copyemp set ename = ?, job = ?, mgr = ?, sal = ?, comm = ?, deptno = ? where empno = ?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, emp.getEname());
			pstmt.setString(2, emp.getJob());
			pstmt.setInt(3, emp.getMgr());
			pstmt.setInt(4, emp.getSal());
			pstmt.setInt(5, emp.getComm());
			pstmt.setInt(6, emp.getDeptno());
			pstmt.setInt(7, emp.getEmpno());

			row = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}

	public int insertEmp(Emp emp) {
		int row = 0;
		String sql = "insert into copyemp (empno, ename, job, mgr, hiredate, sal, comm, deptno) values (?, ?, ?, ?, ?, ?, ?, ?)";
		String sql2 = "insert into empface (empno) values (?)";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, emp.getEmpno());
			pstmt.setString(2, emp.getEname());
			pstmt.setString(3, emp.getJob());
			pstmt.setInt(4, emp.getMgr());
			pstmt.setDate(5, emp.getHiredate());
			pstmt.setInt(6, emp.getSal());
			pstmt.setInt(7, emp.getComm());
			pstmt.setInt(8, emp.getDeptno());

			row = pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql2);			
			pstmt.setInt(1, emp.getEmpno());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}

	public int deleteEmp(int empno) {
		int row = 0;
		String sql = "delete from copyemp where empno = ?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, empno);

			row = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}

	public boolean login(String id, String password) {
		boolean login = false;
		String sql = "select * from adminlist where userid = ? and pwd = ?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				login = true;
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}

		return login;
	}

	public EmpFace loadFace(int empno) {
		EmpFace empface = new EmpFace();
		String sql = "select empno, nvl(url, '') as url from empface where empno = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, empno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				empface.setEmpno(rs.getInt("empno"));
				empface.setUrl(rs.getString("url"));
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return empface;

	}

	public int uploadFace(EmpFace empface) {
		// 1. �궗吏꾪뙆�씪 �삱由ш린 
		// 2. �궗吏� url �쓣 �뼸�뒗�떎. 
		// 3. 洹� url�쓣 �뀒�씠釉붿뿉 �뾽�뜲�씠�듃 諛⑹떇�쑝濡� �꽔�뒗�떎.  
		int row = 0;
		String sql = "update empface set url=? where empno = ?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empface.getUrl());
			pstmt.setInt(2, empface.getEmpno());
			

			row = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return row;
	}
	
	
	public JSONObject countByDeptno() {
	  String sql = "select d.dname, count(*) as count from copyemp c join dept d on c.deptno = d.deptno group by d.dname";
		
		JSONObject json = new JSONObject();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				json.put(rs.getString("dname"), rs.getInt("count"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		System.out.println(json);
		return json;
	}
	
	public JSONObject countByJob() {
		String sql = "select job, count(*) as count from copyemp group by job";
		
		JSONObject json = new JSONObject();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
        json.put(rs.getString("job"), rs.getInt("count"));
      }

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		System.out.println(json);
		return json;
	}
	
	public List<String> selectDistinctJob() {
	  List<String> jobList = new ArrayList<String>();
	  String sql = "select distinct job from copyemp order by job asc";

    try {
      conn = ds.getConnection();
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        jobList.add(rs.getString(1));
      }
    } catch (Exception e) {
      System.out.println(e.getMessage());
    } finally {
      try {
        if (rs != null) {
          rs.close();
        }
        if (pstmt != null) {
          pstmt.close();
        }
        if (conn != null) {
          conn.close();
        }
      } catch (Exception e) {
        System.out.println(e.getMessage());
      }
    }

	  return jobList;
	}
	
	public List<Integer> selectDistinctDeptno() {
    List<Integer> deptList = new ArrayList<Integer>();
    String sql = "select distinct deptno from copyemp order by deptno asc";

    try {
      conn = ds.getConnection();
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        deptList.add(rs.getInt(1));
      }
    } catch (Exception e) {
      System.out.println(e.getMessage());
    } finally {
      try {
        if (rs != null) {
          rs.close();
        }
        if (pstmt != null) {
          pstmt.close();
        }
        if (conn != null) {
          conn.close();
        }
      } catch (Exception e) {
        System.out.println(e.getMessage());
      }
    }

    return deptList;
  }
}
