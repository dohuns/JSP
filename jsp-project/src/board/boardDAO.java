package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
//	public boolean boardWrite(String cate, String title, String con, String id, String nick) {
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
	public boardVO showContent(String num) {
		boardVO vo = new boardVO();
		String sql = "SELECT * FROM boardList WHERE b_num=?";
		
		try {
			ps = con.prepareStatement(sql);

			ps.setString(1, num);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				vo.setB_category(rs.getString("b_category"));
				vo.setB_title(rs.getString("b_title"));
				vo.setB_nick(rs.getString("b_nick"));
				vo.setB_date(rs.getString("b_date"));
				vo.setB_readNum(rs.getInt("b_readNum"));
				vo.setB_content(rs.getString("b_content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
}
