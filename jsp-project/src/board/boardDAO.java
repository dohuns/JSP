package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class boardDAO implements IboardDAO {
	
	private String url ="jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "jsp";
	private String pwd = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public boardDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			con = DriverManager.getConnection(url , user , pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@Override
	public boolean boardWrite(boardVO vo) {
		String sql = "INSERT INTO boardList values("
				+ "?,?,num_seq.nextval,?,0,num_seq.currval,0,0,?,sysdate,?)";
		
		try {
			ps = this.con.prepareStatement(sql);
			
			ps.setString(1, vo.getB_id());
			ps.setString(2, vo.getB_nick());
			ps.setString(3, vo.getB_title());
			ps.setString(4, vo.getB_content());
			ps.setString(5, vo.getB_category());
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		

		return true;
	}


	@Override
	public ArrayList<boardVO> totalList() {
		ArrayList<boardVO> list = new ArrayList<boardVO>();
		String sql = "SELECT * FROM boardList ORDER BY b_masterId DESC";
		
		try {
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				boardVO vo = new boardVO();
				vo.setB_num(rs.getInt("b_num"));
				vo.setB_title(rs.getString("b_title"));
				vo.setB_nick(rs.getString("b_nick"));
				vo.setB_date(rs.getString("b_date"));
				vo.setB_readNum(rs.getInt("b_readNum"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public ArrayList<boardVO> selectList(String category) {
		ArrayList<boardVO> list = new ArrayList<boardVO>();
		String sql ="SELECT * FROM boardList WHERE b_category=? ORDER BY b_masterId DESC";
		try {
			ps = con.prepareStatement(sql);
			
			ps.setString(1, category);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				boardVO vo = new boardVO();
				vo.setB_num(rs.getInt("b_num"));
				vo.setB_title(rs.getString("b_title"));
				vo.setB_nick(rs.getString("b_nick"));
				vo.setB_date(rs.getString("b_date"));
				vo.setB_readNum(rs.getInt("b_readNum"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public listVO showContent(int num) {
		listVO vList = new listVO();
		hitUp(num);
		vList.setList(showReply(num));
		String sql = "SELECT * FROM boardList WHERE b_num=?";
		
		try {
			ps = con.prepareStatement(sql);

			ps.setInt(1, num);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				boardVO vo = new boardVO();
				vo.setB_category(rs.getString("b_category"));
				vo.setB_title(rs.getString("b_title"));
				vo.setB_nick(rs.getString("b_nick"));
				vo.setB_date(rs.getString("b_date"));
				vo.setB_readNum(rs.getInt("b_readNum"));
				vo.setB_content(rs.getString("b_content"));
				vList.setVo(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vList;
	}
	
	@Override
	public void writeReply(int num, String nick, String content) {
		String sql = "INSERT INTO replyList values(?,?,?,sysdate,reply_seq.nextval,0)";
		
		
		
		
		try {
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, num);
			ps.setString(2, nick);
			ps.setString(3, content);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
		public ArrayList<replyVO> showReply(int num) {
			ArrayList<replyVO> list = new ArrayList<replyVO>();
			String sql = "SELECT * FROM replyList WHERE r_num=? ORDER BY r_masterId DESC";
			
			try {
				ps = con.prepareStatement(sql);
				
				ps.setInt(1, num);
				
				rs = ps.executeQuery();
				
				while(rs.next()) {
					replyVO vo = new replyVO();
					vo.setR_nick(rs.getString("r_nick"));
					vo.setR_content(rs.getString("r_content"));
					vo.setR_date(rs.getTimestamp("r_date"));
					vo.setR_masterId(rs.getInt("r_masterId"));
					vo.setR_replyStep(rs.getInt("r_replyStep"));
					
					list.add(vo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
		@Override
		public void boardDelete(int num) {
			String sql = "DELETE FROM boardList WHERE b_num=?";
			
			try {
				ps = con.prepareStatement(sql);
				
				ps.setInt(1, num);
				
				ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		@Override
		public void boardModify(boardVO vo) {
			String sql = "UPDATE boardList SET b_title=? , b_content=? WHERE b_num=?";
			
			try {
				ps = con.prepareStatement(sql);
				
				ps.setString(1, vo.getB_title());
				ps.setString(2, vo.getB_content());
				ps.setInt(3, vo.getB_num());
				
				ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		

		@Override
		public void replyDelete(int masterId) {
			String sql = "DELETE FROM replyList WHERE r_masterId=?";
			try {
				ps = con.prepareStatement(sql);
				
				ps.setInt(1, masterId);
				
				ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		@Override
		public void replyModify(int masterId, String content) {
			String sql = "UPDATE replyList SET r_content=? WHERE r_masterId=?";
			
			try {
				ps = con.prepareStatement(sql);
				
				ps.setString(1, content);
				ps.setInt(2, masterId);
				
				ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
			
		}

		
	
		
		
////////////////////////////////// private /////////////////////////////////
	// 조회수 증가
	private void hitUp(int num) {
		String sql = "UPDATE boardList SET b_readNum = b_readNum + 1 WHERE b_num=?";
		
		try {
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, num);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}







	
}
