package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class userDAO implements IuserDAO{
	
	private String url ="jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "jsp";
	private String pwd = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public userDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			con = DriverManager.getConnection(url , user , pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	@Override
	public boolean chkRegist(userVO vo) {
		String sql = "INSERT INTO userInfo values(?,?,?,?,?,?,?)";
		System.out.println("h1");
		System.out.println("con : " + con);
		System.out.println("sql : " + sql);
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getU_id());
			ps.setString(2, vo.getU_pw());
			ps.setString(3, vo.getU_name());
			ps.setString(4, vo.getU_nick());
			ps.setString(5, vo.getU_gender());
			ps.setString(6, vo.getU_tel());
			ps.setString(7, vo.getU_addr());
			
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		
		return true;
	}


	@Override
	public userVO ckhLogin(String id) {
		String sql = "SELECT * FROM userInfo WHERE u_id=?";
		userVO vo = new userVO();
		
		
		try {
			ps = con.prepareStatement(sql);
			
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				vo.setU_pw(rs.getString("u_pw"));
				vo.setU_nick(rs.getString("u_nick"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}


	@Override
	public boolean chkId(String id) {
		boolean flag = true;
		String sql = "SELECT * FROM userInfo WHERE u_id=?";
		
		try {
			ps = con.prepareStatement(sql);
			
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				flag = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return flag;
	}


	@Override
	public boolean chkTel(String tel) {
		boolean flag = true;
		String sql ="SELECT * FROM userInfo WHERE u_tel=?";
		
		try {
			ps = con.prepareStatement(sql);
			
			ps.setString(1, tel);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				flag=false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return flag;
	}
	
	

}
