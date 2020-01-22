package com.my.paging;

public class boardPaging {
	private int currentPage;   // 현재페이지
	private int totalCount;	 // 전체 게시물 수
	private int totalPage;	 // 전체 페이지 수
	private int blockCount;	 // 한 페이지의  게시물의 수
	private int blockPage;	 // 한 화면에 보여줄 페이지 수
	private int startCount;	 // 한 페이지에서 보여줄 게시글의 시작 번호
	private int endCount;	 // 한 페이지에서 보여줄 게시글의 끝 번호
	private int startPage;	 // 시작 페이지
	private int endPage;	 // 마지막 페이지
	private String viewName;

	private StringBuffer pagingHtml;


	public boardPaging(int currentPage, int totalCount, int blockCount, int blockPage, String viewName) {

		this.blockCount = blockCount;
		this.blockPage = blockPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.viewName = viewName;

		// 전체 페이지 수
		totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if (totalPage == 0) {
			totalPage = 1;
		}

		// 현재 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}

		// 현재 페이지의 처음과 마지막 글의 번호 가져오기.
		startCount = (currentPage - 1) * blockCount;
		endCount = startCount + blockCount - 1;

		// 시작 페이지와 마지막 페이지 값 구하기.
		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;

		// 마지막 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (endPage > totalPage) {
			endPage = totalPage;
		}

		// 이전 block 페이지
		pagingHtml = new StringBuffer();
		if (currentPage > blockPage) {
			pagingHtml.append("<a class='page prv' href="+viewName+"?page=" + (startPage - 1) + ">");
			pagingHtml.append("<p class=\"fa fa-hand-o-left\"></p>");
			pagingHtml.append("</a>");
		}

		//페이지 번호.현재 페이지는 강조하고 링크를 제거.
		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}
			if (i == currentPage) {
				pagingHtml.append("<strong>");
				pagingHtml.append(i);
				pagingHtml.append("</strong>");
			} else {
				pagingHtml.append("<a class='page' href="+viewName+"?page=");
				pagingHtml.append(i);
				pagingHtml.append(">");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
			}
		}

		// 다음 block 페이지
		if (totalPage - startPage >= blockPage) {
			pagingHtml.append("<a class='page next' href="+viewName+"?page=" + (endPage + 1) + ">");
			pagingHtml.append("<p class=\"fa fa-hand-o-right\"></p>");
			pagingHtml.append("</a>");
		}
	}
	
	
	public boardPaging(int currentPage, int totalCount, int blockCount, int blockPage, String viewName
			,String os) {
		
		this.blockCount = blockCount;
		this.blockPage = blockPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.viewName = viewName;
		
		// 전체 페이지 수
		totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if (totalPage == 0) {
			totalPage = 1;
		}
		
		// 현재 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}
		
		// 현재 페이지의 처음과 마지막 글의 번호 가져오기.
		startCount = (currentPage - 1) * blockCount;
		endCount = startCount + blockCount - 1;
		
		// 시작 페이지와 마지막 페이지 값 구하기.
		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;
		
		// 마지막 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		
		// 이전 block 페이지
		pagingHtml = new StringBuffer();
		if (currentPage > blockPage) {
			pagingHtml.append("<a class='page prv' href="+viewName+"?page=" + (startPage - 1));
			pagingHtml.append("&os="+os+">");
			pagingHtml.append("<p class=\"fa fa-hand-o-left\"></p>");
			pagingHtml.append("</a>");
		}
		
		//페이지 번호.현재 페이지는 강조하고 링크를 제거.
		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}
			if (i == currentPage) {
				pagingHtml.append("<strong>");
				pagingHtml.append(i);
				pagingHtml.append("</strong>");
			} else {
				pagingHtml.append("<a class='page' href="+viewName+"?page=");
				pagingHtml.append(i);
				pagingHtml.append("&os="+os+">");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
			}
		}
		
		// 다음 block 페이지
		if (totalPage - startPage >= blockPage) {
			pagingHtml.append("<a class='page next' href="+viewName+"?page=" + (endPage + 1));
			pagingHtml.append("&os="+os+">");
			pagingHtml.append("<p class=\"fa fa-hand-o-right\"></p>");
			pagingHtml.append("</a>");
		}
	}
	
	public boardPaging(int currentPage, int totalCount, int blockCount, int blockPage, String viewName
			,int keyField, String keyword) {
		
		this.blockCount = blockCount;
		this.blockPage = blockPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.viewName = viewName;
		
		// 전체 페이지 수
		totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if (totalPage == 0) {
			totalPage = 1;
		}
		
		// 현재 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}
		
		// 현재 페이지의 처음과 마지막 글의 번호 가져오기.
		startCount = (currentPage - 1) * blockCount;
		endCount = startCount + blockCount - 1;
		
		// 시작 페이지와 마지막 페이지 값 구하기.
		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;
		
		// 마지막 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		
		// 이전 block 페이지
		pagingHtml = new StringBuffer();
		if (currentPage > blockPage) {
			pagingHtml.append("<a class='page prv' href="+viewName+"?page=" + (startPage - 1));
			pagingHtml.append("&keyField="+keyField+"&keyword="+keyword+">");
			pagingHtml.append("<p class=\"fa fa-hand-o-left\"></p>");
			pagingHtml.append("</a>");
		}
		
		//페이지 번호.현재 페이지는 강조하고 링크를 제거.
		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}
			if (i == currentPage) {
				pagingHtml.append("<strong>");
				pagingHtml.append(i);
				pagingHtml.append("</strong>");
			} else {
				pagingHtml.append("<a class='page' href="+viewName+"?page=");
				pagingHtml.append(i);
				pagingHtml.append("&keyField="+keyField+"&keyword="+keyword+">");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
			}
		}
		
		// 다음 block 페이지
		if (totalPage - startPage >= blockPage) {
			pagingHtml.append("<a class='page next' href="+viewName+"?page=" + (endPage + 1));
			pagingHtml.append("&keyField="+keyField+"&keyword="+keyword+">");
			pagingHtml.append("<p class=\"fa fa-hand-o-right\"></p>");
			pagingHtml.append("</a>");
		}
	}

	public int getStartCount() {
		return startCount;
	}

	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}

	public int getEndCount() {
		return endCount;
	}

	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}

	public StringBuffer getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(StringBuffer pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

}
