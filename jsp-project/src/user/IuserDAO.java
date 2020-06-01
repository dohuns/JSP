package user;

public interface IuserDAO {
	
	public boolean chkRegist(userVO vo);
	
	public userVO ckhLogin(String id);
	
	public boolean chkId(String id);
	
	public boolean chkTel(String tel);
}
