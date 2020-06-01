package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

	
}
