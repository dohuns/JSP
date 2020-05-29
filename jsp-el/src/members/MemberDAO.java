package members;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

public class MemberDAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "jsp";
	private String pwd = "1234";
	private Connection con;
	private PreparedStatement ps; 
	private ResultSet rs;
	
	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<MemberDTO> memberView() { //SELECT * FROM members
			
		String sql = "SELECT * FROM members";
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		
		try {
			con = DriverManager.getConnection(url , user, pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO(
						rs.getString("id"),
						rs.getString("pwd"),
						rs.getString("name"),
						rs.getString("addr"),
						rs.getString("tel")
						);
				memberList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberList;
	}
	
	public MemberDTO chkLogin(String id) {
		
		MemberDTO dto = new MemberDTO();
		String sql = "SELECT * FROM members WHERE id=?";
		
		try {
			con = DriverManager.getConnection(url , user , pwd);
			ps = con.prepareStatement(sql);
			
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setTel(rs.getString("tel"));
			} else  {
				dto = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public boolean addMember(MemberDTO dto) {
		
		boolean flag = true;
		
		try {
			con = DriverManager.getConnection(url , user , pwd);
			String sql = "INSERT INTO members VALUES(?,?,?,?,?)";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getAddr());
			ps.setString(5, dto.getTel());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		return flag;
	}
	
	public boolean modifyMember(MemberDTO dto) {
		boolean flag = true;
		
		try {
			con = DriverManager.getConnection(url , user, pwd);
			String sql = "UPDATE members SET name=? , addr=? , tel=? WHERE id=?";
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getAddr());
			ps.setString(3, dto.getTel());
			ps.setString(4, dto.getId());
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		
		return flag;
	}
	
	public boolean deleteMember(String id) {
		boolean flag = true;
		
		try {
			con = DriverManager.getConnection(url , user , pwd);
			String sql = "DELETE FROM members WHERE id=?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
		}
		
		
		return flag;
	}
}
