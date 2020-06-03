package Board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
	private String url = "jdbc:oracle:thin:@192.168.196.131:1521:xe";
	private String user = "jsp", pwd = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	public BoardDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<BoardDTO> mainList(int page) {
//		String sql = "select * from boardList order by b_num desc";
		String sql = "select B.* from(select rownum rn, A.* from(select * from boardlist order by b_num desc)A)B where rn between ? and ?";
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setInt(1, page * 5 - 4);
			ps.setInt(2, page * 5);
			rs = ps.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setB_id(rs.getString("b_id"));
				dto.setB_nick(rs.getString("b_nick"));
				dto.setB_num(rs.getInt("b_num"));
				dto.setB_title(rs.getString("b_title"));
				dto.setB_readNum(rs.getInt("b_readNum"));
				dto.setB_masterId(rs.getInt("b_masterId"));
				dto.setB_replyNum(rs.getInt("b_replyNum"));
				dto.setB_replyStep(rs.getInt("b_replyStep"));
				dto.setB_content(rs.getString("b_content"));
				dto.setB_date(rs.getString("b_date"));
				dto.setB_category(rs.getString("b_category"));
				list.add(dto);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<BoardDTO> subList(String category, int page) {
//		String sql = "select * from boardList where b_category=? order by b_num desc";
		String sql = "select B.* from(select rownum rn, A.* from(select * from boardList where b_category=? order by b_num desc)A)B where rn between ? and ?";
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, category);
			ps.setInt(2, page * 5 - 4);
			ps.setInt(3, page * 5);
			rs = ps.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setB_id(rs.getString("b_id"));
				dto.setB_nick(rs.getString("b_nick"));
				dto.setB_num(rs.getInt("b_num"));
				dto.setB_title(rs.getString("b_title"));
				dto.setB_readNum(rs.getInt("b_readNum"));
				dto.setB_masterId(rs.getInt("b_masterId"));
				dto.setB_replyNum(rs.getInt("b_replyNum"));
				dto.setB_replyStep(rs.getInt("b_replyStep"));
				dto.setB_content(rs.getString("b_content"));
				dto.setB_date(rs.getString("b_date"));
				dto.setB_category(rs.getString("b_category"));
				list.add(dto);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public void boardAdd(BoardDTO dto) {
		String sql = "insert into boardlist VALUES(?,?,num_seq.nextval,?,0,num_seq.currval,0,0,?,sysdate,?)";
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getB_id());
			ps.setString(2, dto.getB_nick());
			ps.setString(3, dto.getB_title());
			ps.setString(4, dto.getB_content());
			ps.setString(5, dto.getB_category());
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void modify(BoardDTO dto) {
		String sql = "update boardlist set b_title=?, b_content=? where b_num=?";
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getB_title());
			ps.setString(2, dto.getB_content());
			ps.setInt(3, dto.getB_num());
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void delete(String num) {
		String sql = "delete from boardlist where b_num=" + num;
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public BoardDTO content(String num) {
		String sql = "select * from boardlist where b_num=?";
		BoardDTO dto = new BoardDTO();
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, num);
			rs = ps.executeQuery();
			while (rs.next()) {
				dto.setB_id(rs.getString("b_id"));
				dto.setB_nick(rs.getString("b_nick"));
				dto.setB_num(rs.getInt("b_num"));
				dto.setB_title(rs.getString("b_title"));
				dto.setB_readNum(rs.getInt("b_readNum"));
				dto.setB_masterId(rs.getInt("b_masterId"));
				dto.setB_replyNum(rs.getInt("b_replyNum"));
				dto.setB_replyStep(rs.getInt("b_replyStep"));
				dto.setB_content(rs.getString("b_content"));
				dto.setB_date(rs.getString("b_date"));
				dto.setB_category(rs.getString("b_category"));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}

	public void upRN(String num) {
		String sql = "update boardlist set b_readNum = b_readNum+1 where b_num =" + num;
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int getTotalPageM() {
		String sql = "select * from boardList";
		int totPage = 0;
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				totPage += 1;
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totPage;
	}

	public int getTotalPageS(String category) {
		String sql = "select * from boardList where b_category = ?";
		int totPage = 0;
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, category);
			rs = ps.executeQuery();
			while (rs.next()) {
				totPage += 1;
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totPage;
	}
}
