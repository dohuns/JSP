package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
	Connection con;
	PreparedStatement stmt;
	ResultSet rs;

	public BoardDAO() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String userId = "jsp";
		String userPw = "1234";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, userId, userPw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/* 전체 글 목록 게시판 */
	public ArrayList<BoardDTO> list() {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		String sql = "SELECT * FROM boardList";
		try {
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
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
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/* 글 작성 */
	public int writeChk(BoardDTO dto) {
		int result = -1;
		String sql = "INSERT INTO boardList VALUES (?, ?, num_seq.nextval, ?, 0, num_seq.currval, 0, 0, ?, sysdate, ?)";
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getB_id());
			stmt.setString(2, dto.getB_nick());
			stmt.setString(3, dto.getB_title());
			stmt.setString(4, dto.getB_content());
			stmt.setString(5, dto.getB_category());
			result = stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}



































