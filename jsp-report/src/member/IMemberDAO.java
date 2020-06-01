package member;

import java.util.ArrayList;

public interface IMemberDAO {


	public boolean chkReg(MemberVO vo);
	
	public String chkLogin(String id);
	
	public ArrayList<MemberVO> list();
	
	public MemberVO memberInfo(String id);
	
	
}
