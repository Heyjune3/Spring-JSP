package util;
/**
 * 요청한 페이지 정보에 따라
 * 이동가능한 페이지 번호를 제공 및 계산하는 class
 * 사용자가 요청한 페이지번호 : page
 * 한번에 보여줄 게시물 개수 : perPageNum
 * 전체 게시물 개수 : totalCount
 */
public class PageMaker {
	
	/**
	 * 페이징 처리에 따른 table에 저장된 게시물의 검색 
	 * 기준을 저장하는 class
	 * page, perPageNum startRow
	 */
	protected Criteria cri;
	
	/**
	 * <b>database</b>에 저장된 전제 row 개수
	 */
	private int totalCount;
	
	/**
	 * 한번에 보여줄 페이지 번호 개수
	 */
	private int displayPageNum;
	
	/**
	 * displayPageNum와 사용자가 요청한 페이지 번호에 따라
	 * 현재 페이지에서 보여줄 이동가능한 게시판 화면의 시작 페이지 번호
	 */
	private int startPage;
	
	/**
	 * displayPageNum와 사용자가 요청한 페이지 번호에 따라
	 * 현재 페이지에서 보여줄 이동가능한 게시판 화면의 시작 마지막 번호
	 */
	private int endPage;
	
	/**
	 * 이동가능한 최대 페이지 번호
	 */
	private int maxPage;
	
	/**
	 * first - 첫페이지 버튼 활성화 여부, 현재 페이지가 시작페이지(1)인지 여부 확인 <br/>
	 * last - 마지막 페이지 버튼 활성화 여부, 현재 페이지가 마지막(maxPage)인지 여부 확인 <br/>
	 * prev - 이전 페이지 버튼 활성화 여부, 이전 페이지 블럭으로 이동 가능 여부 <br/>
	 * next - 다음 페이지 버튼 활성화 여부, 다음 페이지 블럭으로 이동 가능 여부 <br/>
	 */
	private boolean first, last, prev, next;
	
	public PageMaker() {
		this(0);
	}
	
	public PageMaker(int totalCount) {
		this(new Criteria(),totalCount);
	}

	public PageMaker(Criteria cri, int totalCount) {
		this(cri, totalCount, 5);
	}

	public PageMaker(Criteria cri, int totalCount, int displayPageNum) {
		setCri(cri);
		setTotalCount(totalCount);
		setDisplayPageNum(displayPageNum);
	}

	private void calcPaging() {
		endPage = (int)Math.ceil(cri.getPage()/(double)displayPageNum) * displayPageNum;
		startPage = (endPage - displayPageNum) + 1;
		maxPage = (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
		if(endPage > maxPage) endPage = maxPage;
		first = (cri.getPage() != 1) ? true : false;
		last = (cri.getPage() != maxPage) ? true : false;
		prev = (startPage != 1) ? true : false;
		next = (endPage != maxPage) ? true : false;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		if(cri == null) {
			this.cri = new Criteria();
		}else {
			this.cri = cri;
		}
		calcPaging();
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		if(cri == null) {
			setCri(new Criteria());
		}
		this.totalCount = totalCount;
		calcPaging();
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		if(cri == null) {
			setCri(new Criteria());
		}
		this.displayPageNum = displayPageNum;
		calcPaging();
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public boolean isFirst() {
		return first;
	}

	public boolean isLast() {
		return last;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	@Override
	public String toString() {
		return "PageMaker [cri=" + cri + ", totalCount=" + totalCount + ", displayPageNum=" + displayPageNum
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", maxPage=" + maxPage + ", first=" + first
				+ ", last=" + last + ", prev=" + prev + ", next=" + next + "]";
	}
	/**
	 * @param page 이동할 페이지 번호
	 * @return 전달받은 페이지 번호로 페이징 처리에 필요한 파라미터를 이용해서
	 * 			QueryString 생성 반환
	 * */
	public String makeQuery(int page) {
		StringBuilder sb = new StringBuilder("?");
		sb.append("page="+page);
		sb.append("&");
		sb.append("perPageNum="+cri.getPerPageNum());
		/* <a href="?page=5&amp;perPageNum=10">[5]</a> */
		return sb.toString();
	}
}






