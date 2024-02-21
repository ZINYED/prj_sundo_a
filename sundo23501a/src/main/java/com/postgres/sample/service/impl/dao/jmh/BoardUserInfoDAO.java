package com.postgres.sample.service.impl.dao.jmh;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.postgres.sample.dto.BoardNotice;
import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.UserInfo;

@Mapper("BoardUserInfoDAO")
public interface BoardUserInfoDAO {
	public List<Code> 			JmhCodeList2(Code code);
	public int 					JmhTotalCount(UserInfo userInfo);	//총문서 수
	public int 					JmhSearchCount(UserInfo userInfo);	//검색결과 수
	public List<UserInfo> 		JmhSearchList(UserInfo userInfo);	//검색결과 목록
	public List<UserInfo> 		JmhBoardList(UserInfo userInfo);	//목록
	public int 					JmhInsertBoard(UserInfo userInfo);	//등록
	public UserInfo 			JmhSelectBoard(UserInfo userInfo);	//조회
	public int 					JmhUpdateBoard(UserInfo userInfo);	//수정
	public int 					JmhDeleteBoard(UserInfo userInfo);	//삭제
}
