package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Board.BoardDTO;

public class UserDAO {
	private String url = "jdbc:oracle:thin:@192.168.196.131:1521:xe";
	private String user = "jsp", pwd = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	public UserDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<UserDTO> list() {
		String sql = "select * from userInfo";
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setU_id(rs.getString("u_id"));
				dto.setU_pw(rs.getString("u_pw"));
				dto.setU_name(rs.getString("u_name"));
				dto.setU_nick(rs.getString("u_nick"));
				dto.setU_gender(rs.getString("u_gender"));
				dto.setU_tel(rs.getString("u_tel"));
				dto.setU_addr(rs.getString("u_addr"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public UserDTO chkUser(String userId) {
		String sql = "select * from userinfo where u_id=?";
		UserDTO dto = new UserDTO();
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			while (rs.next()) {
				dto.setU_id(rs.getString("u_id"));
				dto.setU_pw(rs.getString("u_pw"));
				dto.setU_name(rs.getString("u_name"));
				dto.setU_nick(rs.getString("u_nick"));
				dto.setU_gender(rs.getString("u_gender"));
				dto.setU_tel(rs.getString("u_tel"));
				dto.setU_addr(rs.getString("u_addr"));
			}
		} catch (Exception e) {
		}
		return dto;
	}

	public void userAdd(UserDTO dto) {
		String sql = "insert into userinfo VALUES(?,?,?,?,?,?,?)";
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getU_id());
			ps.setString(2, dto.getU_pw());
			ps.setString(3, dto.getU_name());
			ps.setString(4, dto.getU_nick());
			ps.setString(5, dto.getU_gender());
			ps.setString(6, dto.getU_tel());
			ps.setString(7, dto.getU_addr());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void modify(UserDTO dto) {
		String sql = "update userinfo set u_pw=?, u_nick=?, u_tel=?, u_addr=? where u_id=?";
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getU_pw());
			ps.setString(2, dto.getU_nick());
			ps.setString(3, dto.getU_tel());
			ps.setString(4, dto.getU_addr());
			ps.setString(5, dto.getU_id());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
