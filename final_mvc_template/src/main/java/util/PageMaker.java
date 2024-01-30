package util;

/**
 * 요청한 페이지 정보에 따라
 * 이동가능한 페이지 번호를 제공 및 계산하는 class
 */
public class PageMaker {

	/**
	 	페이징 처리에 따른 table에 저장된 게시물의 검색 기준을 저장하는 class
	 */
	protected Criteria cri;			
	/**
	 	<b>database</b>에 저장된 전체 row 개수 저장
	 */
	private int totalCount;			
	/**
	  	한번에 보여줄 페이지 블럭의 번호 개수 저장
	 */
	private int displayPageNum;		
	/**
		displayPageNum와 사용자가 요청한 페이지 번호에 따라
		현재 페이지에서 보여줄 이동가능한 게시판의 화면의 시작 페이지 번호
	*/
	private int startPage;
	/**
		displayPageNum와 사용자가 요청한 페이지 번호에 따라
		현재 페이지에서 보여줄 이동가능한 게시판의 화면의 마지막 페이지 번호
		endPage = (int)Math.ceil(cri.getPage()/(double)displayPageNum) * displayPageNum;
		1page - displayPageNum = 5
		ceil(1 / 5.0) = ceil(0.2) = 1.0
		(int)1.0 = 1 
		(int)1.0 * 5 = 5
	*/
	private int endPage;			
	/**
	 	한번에 보여줄 게시물 개수에 따라 보여줄 수 있는 최대 페이지 번호 개수
	 	이동 가능한 최대 페이지 번호
	 	(int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
	 	totalCount : 121 - perPageNum : 10 
	 	ceil(121/10.0) = ceil(12.1) = 13.0
	 	(int)(13.0) = maxPage = 13page 
	 */
	private int maxPage;
	
	/**
	 * 첫 페이지 버튼 활성화 여부
	 * 현재 페이지가 시작페이지(1)인지 여부 확인
	 */
	private boolean first;			
	
	/**
	 *  마지막 페이지 버튼 활성화 여부 
	 *  현재 페이지가 마지막 페이지(maxPage)인지 여부 확인
	 */
	private boolean last;			
	/**
	 *  이전 페이지 버튼 활성화 여부 - 이전 페이지 블럭으로 이동 가능 여부
	 *  현재 페이지가 첫번째 페이지 번호 블럭인지 여부 확인
	 */
	private boolean prev;			
	/**
	 *  다음 페이지 버튼 활성화 여부 - 다음 페이지 블럭으로 이동 가능 여부
	 *  현재 페이지가 마지막 페이지 번호 블럭인지 여부 확인
	 */
	private boolean next;			
	
	public PageMaker() {
		this(0);
	}
	
	public PageMaker(int totalCount) {
		this(new Criteria(),totalCount);
	}
	
	public PageMaker(Criteria cri , int totalCount) {
		setCri(cri);
		setTotalCount(totalCount);
		setDisplayPageNum(5);
	}
	
	public void calcPaging() {
		
		endPage = (int)Math.ceil(cri.getPage()/(double)displayPageNum) * displayPageNum;
		
		startPage = (endPage - displayPageNum)+1;
		
		maxPage = (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
		
		if(endPage > maxPage)endPage = maxPage;
		
		first = (cri.getPage() != 1) ? true : false;
		
		last = (cri.getPage() != maxPage) ? true : false;

		prev = (startPage  != 1) ? true : false;
		
		next = (endPage != maxPage) ? true : false;
		
	}
	
	public int getMaxPage() {
		return maxPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		if(cri == null){
			setCri(new Criteria());
		}
		this.totalCount = totalCount;
		calcPaging();
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
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

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		if(cri == null){
			setCri(new Criteria());
		}
		this.displayPageNum = displayPageNum;
		calcPaging();
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
		calcPaging();
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", first="
				+ first + ", last=" + last + ", prev=" + prev + ", next=" + next + ", displayPageNum=" + displayPageNum
				+ ", maxPage=" + maxPage + ", cri=" + cri + "]";
	}
	
	
	public String makeQuery(int page) {
		StringBuilder sb = new StringBuilder();
		sb.append("?");
		sb.append("page="+page);
		sb.append("&perPageNum="+cri.getPerPageNum());
		return sb.toString();
	}
	
}













