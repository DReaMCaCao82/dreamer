package com.moegga.app.service.impl;

public class Paging {

	public static String pagingBootStrapStyle(int totalRecordCount, int pageSize, int blockPage, int nowPage,
			String page) {
		//
		String pagingStr = "<nav><ul class=\"pagination\" >";

		// 1.전체 페이지 구하기
		int totalPage = (int) (Math.ceil(((double) totalRecordCount / pageSize)));

		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;

		// 처음 및 이전을 위한 로직
		if (intTemp != 1) {
			pagingStr += "<li>\r\n" + "<a href='" + page + "nowPage=1'>\r\n"
					+ "<span aria-hidden=\"true\">&laquo;</span>\r\n" + "</a>\r\n" + "</li>\r\n" + "<li >\r\n"
					+ "<a href='" + page + "nowPage=" + (intTemp - blockPage) + "' >\r\n"
					+ "<span aria-hidden=\"true\">&lsaquo;</span>\r\n" + "</a>\r\n" + "</li>";

		}

		// 페이지 표시 제어를 위한 변수
		int blockCount = 1;

		// 페이지를 뿌려주는 로직
		// 블락 페이지 수만큼 혹은 마지막 페이지가 될때까지 페이지를 표시한다1
		while (blockCount <= blockPage && intTemp <= totalPage) { // 페이지 오버 를 체크
			// 현재 페이지를 의미함
			if (intTemp == nowPage) {
				pagingStr += "<li><a href='#'><span style='Color:red'>" + intTemp + "</span></a></li>";
			} else
				pagingStr += "<li><a href='" + page + "nowPage=" + intTemp + "'>" + intTemp + "</a></li>";

			intTemp = intTemp + 1;
			blockCount = blockCount + 1;

		}

		// 다음 및 마지막을 위한 로직

		if (intTemp <= totalPage) {
			pagingStr += "<li>\r\n" + "<a href='" + page + "nowPage=" + intTemp + "'>\r\n"
					+ "<span aria-hidden=\"true\">&rsaquo;</span>\r\n" + "</a>\r\n" + "</li>\r\n" + "<li>\r\n"
					+ "<a href='" + page + "nowPage=" + totalPage + "' >\r\n"
					+ "<span aria-hidden=\"true\">&raquo;</span>\r\n" + "</a>\r\n" + "</li>";

		}
		pagingStr += "</ul></nav>";
		return pagingStr;
	}
	public static String pagingAccusation(int totalRecordCount, int pageSize, int blockPage, int nowPage,
			String page) {
		/*
		 <li class="page-item disabled">
            <a class="page-link" href="#" tabindex="-1">Previous</a>
        </li>
        <li class="page-item active"><a class="page-link" href="#">1</a></li>
        <li class="page-item">
            <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
        </li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item">
            <a class="page-link" href="#">Next</a>
        </li>
		 */
		String pagingStr = "";

		// 1.전체 페이지 구하기
		int totalPage = (int) (Math.ceil(((double) totalRecordCount / pageSize)));

		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;

		// 처음 및 이전을 위한 로직
		if (intTemp != 1) {
			pagingStr += "<li class='page-item'>\r\n" 
					+ "<a class='page-link' href='" + page + "nowPage=1'>" + "처음" + "</a>\r\n" 
					+ "</li>\r\n" 
					+ "<li class='page-item' >\r\n"
					+ "<a class='page-link' href='" + page + "nowPage=" + (intTemp - blockPage) + "' >" + "이전" + "</a>\r\n" 
					+ "</li>";

		}

		// 페이지 표시 제어를 위한 변수
		int blockCount = 1;

		// 페이지를 뿌려주는 로직
		// 블락 페이지 수만큼 혹은 마지막 페이지가 될때까지 페이지를 표시한다1
		while (blockCount <= blockPage && intTemp <= totalPage) { // 페이지 오버 를 체크
			// 현재 페이지를 의미함
			if (intTemp == nowPage) {
				pagingStr += "<li class='page-item active'><a class='page-link' href='#'>" + intTemp + "</a></li>";
			} else
				pagingStr += "<li class='page-item'><a class='page-link' href='" + page + "nowPage=" + intTemp + "'>" + intTemp + "</a></li>";

			intTemp = intTemp + 1;
			blockCount = blockCount + 1;

		}

		// 다음 및 마지막을 위한 로직

		if (intTemp <= totalPage) {
			pagingStr += "<li class='page-item'>\r\n" + 
					"<a class='page-link' href='" + page + "nowPage=" + intTemp + "'>"+ "다음"+"</a>\r\n" 
					+ "</li>\r\n" 
					+ "<li class='page-item'>\r\n"
					+ "<a class='page-link' href='" + page + "nowPage=" + totalPage + "' >"+ "끝" + "</a>\r\n"
					+ "</li>";

		}
		return pagingStr;
	}
}
