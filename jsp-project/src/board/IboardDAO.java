package board;

import java.util.ArrayList;

public interface IboardDAO {
	
	public boolean boardWrite(boardVO vo);
	
	public ArrayList<boardVO> totalList();
	
	public ArrayList<boardVO> selectList(String category);
	
	public listVO showContent(int num);
	
	public void writeReply(int num , String nick , String content);
	
	public ArrayList<replyVO> showReply(int num);
	
	public void boardDelete(int num);
	
	public void boardModify(boardVO vo);
	
	public void replyDelete(int masterId);
	
	public void replyModify(int masterId , String content);
}
