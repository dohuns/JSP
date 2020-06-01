package board;

public class BoardDTO {
	private String b_id; 				/* 작성자 아이디 */
	private String b_nick; 				/* 작성자 닉네임 */
	private int b_num; 					/* 글 번호 */
	private String b_title; 			/* 글 제목 */
	private int b_readNum; 				/* 조회 수 */
	private int b_masterId; 			/* 메인 번호 */
	private int b_replyNum; 			/* 답글 번호 */
	private int b_replyStep; 			/* 답글 정렬 */
	private String b_content; 			/* 작성 내용 */
	private String b_date; 				/* 작성 일자 */
	private String b_category;			/* 게시판 목록 */

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getB_nick() {
		return b_nick;
	}

	public void setB_nick(String b_nick) {
		this.b_nick = b_nick;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public int getB_readNum() {
		return b_readNum;
	}

	public void setB_readNum(int b_readNum) {
		this.b_readNum = b_readNum;
	}

	public int getB_masterId() {
		return b_masterId;
	}

	public void setB_masterId(int b_masterId) {
		this.b_masterId = b_masterId;
	}

	public int getB_replyNum() {
		return b_replyNum;
	}

	public void setB_replyNum(int b_replyNum) {
		this.b_replyNum = b_replyNum;
	}

	public int getB_replyStep() {
		return b_replyStep;
	}

	public void setB_replyStep(int b_replyStep) {
		this.b_replyStep = b_replyStep;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_date() {
		return b_date;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public String getB_category() {
		return b_category;
	}

	public void setB_category(String b_category) {
		this.b_category = b_category;
	}

}
