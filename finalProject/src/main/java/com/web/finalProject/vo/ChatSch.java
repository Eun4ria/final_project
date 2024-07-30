package com.web.finalProject.vo;

public class ChatSch {
	/*
	주요 속성 : 검색-제목(subject),작성자(owner_id)  
	기본페이지처리 - 전체데이터건수(count), 한번에 보여줄 데이터 건수(pageSize), 
		총페이지수(pageCount), 현재 클릭한 페이지 번호(curPage),
		시작번호(start), 마지막번호(end)
	페이지블럭처리 - 한번에 보여줄 block의 크기(blockSize), block 시작번호(startBlock),
				 block 마지막번호(endBlock)
* */
	private String chatroom_id;
	private String chatroom_name;
	private String owner_id;
	private String chatmem_id;
	private int count;
	private int pageSize;
	private int pageCount;
	private int curPage;
	private int start;
	private int end;
	private int blockSize;
	private int startBlock;
	private int endBlock;
	/**
	 * 
	 */
	public ChatSch() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param chatroom_id
	 * @param chatroom_name
	 * @param owner_id
	 * @param chatmem_id
	 * @param count
	 * @param pageSize
	 * @param pageCount
	 * @param curPage
	 * @param start
	 * @param end
	 * @param blockSize
	 * @param startBlock
	 * @param endBlock
	 */
	public ChatSch(String chatroom_id, String chatroom_name, String owner_id, String chatmem_id, int count,
			int pageSize, int pageCount, int curPage, int start, int end, int blockSize, int startBlock, int endBlock) {
		super();
		this.chatroom_id = chatroom_id;
		this.chatroom_name = chatroom_name;
		this.owner_id = owner_id;
		this.chatmem_id = chatmem_id;
		this.count = count;
		this.pageSize = pageSize;
		this.pageCount = pageCount;
		this.curPage = curPage;
		this.start = start;
		this.end = end;
		this.blockSize = blockSize;
		this.startBlock = startBlock;
		this.endBlock = endBlock;
	}
	public String getChatroom_id() {
		return chatroom_id;
	}
	public void setChatroom_id(String chatroom_id) {
		this.chatroom_id = chatroom_id;
	}
	public String getChatroom_name() {
		return chatroom_name;
	}
	public void setChatroom_name(String chatroom_name) {
		this.chatroom_name = chatroom_name;
	}
	public String getOwner_id() {
		return owner_id;
	}
	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}
	public String getChatmem_id() {
		return chatmem_id;
	}
	public void setChatmem_id(String chatmem_id) {
		this.chatmem_id = chatmem_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getStartBlock() {
		return startBlock;
	}
	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}
	public int getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}
	
}