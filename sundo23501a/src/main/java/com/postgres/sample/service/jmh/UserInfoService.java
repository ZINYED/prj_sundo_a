package com.postgres.sample.service.jmh;

import java.util.List;
import java.util.Map;

import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.UserInfo;

public interface UserInfoService {
	
	public List<Code>			codeList(Code code);					//분류 코드

	public UserInfo				userLoginCheck(UserInfo userInfo);		//로그인체크
	public UserInfo				userLoginSystemCheck(UserInfo userInfo);//로그인체크+권한체크
	public List<Organization>	orgList();								//기간코드/기관명 정보
	public UserInfo				idConfirm(String user_id);				//ID회원정보 가져오기
	public int					insertUserInfo(UserInfo userInfo);		//회원정보 가입하기
	
	int 			   			updatePw(Map<String, String> map);
	UserInfo           			userFindId(UserInfo userInfo);
	int                			updateUser(UserInfo userInfo);

	
	public int 					totalCount(UserInfo userInfo);	//총문서수
	public List<UserInfo> 		boardList(UserInfo userInfo);	//목록
	int 						insertBoard(UserInfo userInfo);	//등록
	UserInfo 					selectBoard(UserInfo userInfo);	//조회
	int 						updateBoard(UserInfo userInfo);	//수정
	int 						deleteBoard(UserInfo userInfo);	//삭제
}
