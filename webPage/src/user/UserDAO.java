package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	Connection con;
	PreparedStatement stmt;
	ResultSet rs;
	
	public UserDAO() {
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
	
	/* 로그인 확인 */
	public int loginChk(String id, String pw) {
		int result = -1;
		String sql = "SELECT * FROM userInfo WHERE u_id = ?";
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("u_pw").equals(pw)) {
					result = 2;								/* 아이디 비밀번호 일치 */
				} else {
					result = 1;								/* 비밀번호 불일치 */
				}
			} else {
				result = 0;									/* 아이디 불일치 */
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	/* 아이디 비교 */
	public int chkId(String id) {
		int result = -1;
		String sql = "SELECT * FROM userInfo WHERE u_id = ?";
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if(rs.next()) {
				result = 1;					/* 아이디 존재 */
			} else {
				result = 0;					/* 아이디 미존재 */
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	/* 회원가입 */
	public int registerChk(UserDTO dto) {
		int result = -1;
		String sql = "INSERT INTO userInfo VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getU_id());
			stmt.setString(2, dto.getU_pw());
			stmt.setString(3, dto.getU_name());
			stmt.setString(4, dto.getU_nick());
			stmt.setString(5, dto.getU_gender());
			stmt.setString(6, dto.getU_tel());
			stmt.setString(7, dto.getU_addr());
			result = stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}






















