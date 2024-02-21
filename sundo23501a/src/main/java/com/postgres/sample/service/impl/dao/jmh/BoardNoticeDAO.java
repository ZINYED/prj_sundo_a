package com.postgres.sample.service.impl.dao.jmh;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.postgres.sample.dto.BoardNotice;
import com.postgres.sample.dto.Code;

@Mapper("BoardNoticeDAO")
public interface BoardNoticeDAO {
	public List<Code> 			JmhCodeList2(Code code);
	public int 					JmhTotalCount(BoardNotice boardNotice);		//총문서 수
	public int 					JmhSearchCount(BoardNotice boardNotice);	//검색결과 수
	public List<BoardNotice> 	JmhSearchList(BoardNotice boardNotice);		//검색결과 목록
	public List<BoardNotice> 	JmhBoardList(BoardNotice boardNotice);		//목록
	public int 					JmhInsertBoard(BoardNotice boardNotice);	//등록
	public BoardNotice 			JmhSelectBoard(BoardNotice boardNotice);	//조회
	public int 					JmhUpdateBoard(BoardNotice boardNotice);	//수정
	public int 					JmhDeleteBoard(BoardNotice boardNotice);	//삭제
	public int 					JmhReadCount(BoardNotice boardNotice); 		//조회수
}
