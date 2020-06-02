package board;

import java.util.ArrayList;

public interface IboardDAO {
	
	public boolean boardWrite(boardVO vo);
	
	public ArrayList<boardVO> totalList();
	
	public ArrayList<boardVO> selectList(String category);
	
	public boardVO showContent(int num);
}
