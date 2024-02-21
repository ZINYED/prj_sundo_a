package com.postgres.sample.service.impl.jmh;

import java.util.Date;
import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.postgres.sample.dto.BoardNotice;
import com.postgres.sample.dto.Code;
import com.postgres.sample.service.impl.dao.jmh.BoardNoticeDAO;
import com.postgres.sample.service.jmh.JmhService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
@Transactional
public class JmhServiceImpl extends EgovAbstractServiceImpl implements JmhService {

	private final BoardNoticeDAO	boardNoticeDAO;
	
	//--------------------------------------------------------------------------------------
	//---------공지사항
	//--------------------------------------------------------------------------------------	
	@Override
	public int totalCount(BoardNotice boardNotice) {
		System.out.println("JmhServicImpl totalCount START...");

		int totalCnt = 0;
		
		if(boardNotice.getKeyword() != null) {
			System.out.println("totalCount ★검색 Search---->"+boardNotice.getSearch());
			if(!boardNotice.getKeyword().equals("")) {
				System.out.println("totalCount ★검색 SearchKeyword---->"+boardNotice.getKeyword());
				//검색 건수 가져오기
				//-------------------------------------------------------------------
				totalCnt = boardNoticeDAO.JmhSearchCount(boardNotice);
				//-------------------------------------------------------------------
				System.out.println("JmhServicImpl totalCount totalCnt->" + totalCnt);
				System.out.println("JmhServicImpl totalCount END...");
				return totalCnt;
			}
		}
		//-------------------------------------------------------------------
		totalCnt = boardNoticeDAO.JmhTotalCount(boardNotice);
		//-------------------------------------------------------------------

		System.out.println("JmhServicImpl totalCount totalCnt->" + totalCnt);
		System.out.println("JmhServicImpl totalCount END...");
		return totalCnt;
	}

	//--------------------------------------------------------------------------------------
	@Override
	public List<BoardNotice> boardList(BoardNotice boardNotice) {
		System.out.println("JmhServiceImpl boardList START...");
		
		List<BoardNotice> boardList = null;
		
		if(boardNotice.getKeyword() != null) {
			System.out.println("boardList ★검색 Search---->"+boardNotice.getSearch());
			if(!boardNotice.getKeyword().equals("")) {
				System.out.println("boardList ★검색 SearchKeyword---->"+boardNotice.getKeyword());
				//----------------------------------------------------
				boardList = boardNoticeDAO.JmhSearchList(boardNotice);
				//----------------------------------------------------
				System.out.println("JmhServiceImpl boardList > searchList END...");
				return boardList;
			}
		}
		System.out.println("boardNotice user_id: "+boardNotice.getUser_id());
		System.out.println("boardNotice start: "+boardNotice.getStart());
		System.out.println("boardNotice end: "+boardNotice.getEnd());
		//---------------------------------------------------
		boardList = boardNoticeDAO.JmhBoardList(boardNotice);
		//---------------------------------------------------
		System.out.println("boardList.size()->"+boardList.size());
		System.out.println("JmhServiceImpl boardList END...");
		return boardList;
	}

	//등록
	@Override
	public int insertBoard(BoardNotice boardNotice) {
		System.out.println("JmhServiceImpl insertBoard START...");
		int resultCount = 0;		
		Date sysdate = new Date();
		boardNotice.setCreate_date(sysdate);		
		//----------------------------------------------
		resultCount = boardNoticeDAO.JmhInsertBoard(boardNotice);
		//----------------------------------------------
		System.out.println("JmhServiceImpl insertBoard resultCount->"+resultCount);
		System.out.println("JmhServiceImpl insertBoard END...");
		return resultCount;
	}

	//조회
	@Override
	public BoardNotice selectBoard(BoardNotice boardNotice) {
		System.out.println("JmhServiceImpl selectBoard START...");
		BoardNotice selectboardNotice = null;		
		//--------------------------------------------------
		selectboardNotice = boardNoticeDAO.JmhSelectBoard(boardNotice);
		//--------------------------------------------------
		System.out.println("JmhServiceImpl selectBoard END...");
		return selectboardNotice;
	}

	//수정
	@Override
	public int updateBoard(BoardNotice boardNotice) {
		System.out.println("JmhServiceImpl updateBoard START...");
		int resultCount = 0;				
		//----------------------------------------------
		resultCount = boardNoticeDAO.JmhUpdateBoard(boardNotice);
		//----------------------------------------------
		System.out.println("JmhServiceImpl updateBoard resultCount->"+resultCount);
		System.out.println("JmhServiceImpl updateBoard END...");
		return resultCount;
	}

	//삭제
	@Override
	public int deleteBoard(BoardNotice boardNotice) {
		System.out.println("JmhServiceImpl deleteBoard START...");
		int resultCount = 0;
		//----------------------------------------------
		resultCount = boardNoticeDAO.JmhDeleteBoard(boardNotice);
		//----------------------------------------------
		if(resultCount > 0) {System.out.println("문서 삭제완료:"+resultCount);}		
		System.out.println("JmhServiceImpl deleteBoard resultCount->"+resultCount);
		System.out.println("JmhServiceImpl deleteBoard END...");
		return resultCount;
	}

	//조회수
	@Override
	public int readCount(BoardNotice boardNotice) {
		System.out.println("JmhServiceImpl readCount START...");
		int resultCount = 0;				
		//--------------------------------------------
		resultCount = boardNoticeDAO.JmhReadCount(boardNotice);
		//--------------------------------------------
		System.out.println("JmhServiceImpl readCount resultCount->"+resultCount);
		System.out.println("JmhServiceImpl readCount END...");
		return resultCount;
	}

	//--------------------------------------------------------------------------------------
	//분류 가져오기
	@Override
	public List<Code> codeList(Code code) {
		List<Code> codeList = null;
		System.out.println("JmhServiceImpl codeList Start...");
		//-------------------------------------------------
		codeList = boardNoticeDAO.JmhCodeList2(code);
		//-------------------------------------------------
		System.out.println("JmhServiceImpl codeList.size()->" +codeList.size());
		
		return codeList;
	}


}
