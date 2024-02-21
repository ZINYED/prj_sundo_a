package com.postgres.sample.service.jmh;

import java.util.List;

import com.postgres.sample.dto.BoardNotice;
import com.postgres.sample.dto.Code;

public interface JmhService {
	
	public List<Code>			codeList(Code code);					//분류 코드

	//공지사항
	public int 					totalCount(BoardNotice boardNotice);	//총문서수
	public List<BoardNotice> 	boardList(BoardNotice boardNotice);		//목록
	int 						insertBoard(BoardNotice boardNotice);	//등록
	BoardNotice 				selectBoard(BoardNotice boardNotice);	//조회
	int 						updateBoard(BoardNotice boardNotice);	//수정
	int 						deleteBoard(BoardNotice boardNotice);	//삭제
	int 						readCount(BoardNotice boardNotice);		//조회수
	
	
}
