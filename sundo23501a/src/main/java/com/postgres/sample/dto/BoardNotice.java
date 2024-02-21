package com.postgres.sample.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardNotice {
	private Integer doc_no;
	private String 	subject;
	private String 	user_id;
	private Date 	create_date;
	private Integer bd_count;
	private String 	body;
	private Date 	create_datetime;
	private Date 	modify_datetime;

	private String 	attach_name;		private String 	attach_path;

	//조회용
	private int		rn;					//목록 rownum번호
	private int		start;				//페이지 시작번호
	private int		end;				//페이지 끝번호
	private String	user_name;			//작성자명
	private String  attach_delete_flag; //편집저장시 기존첨부 삭제여부(D)
	private String	search;				//검색대상 필드
	private String	keyword;			//검색어 키워드

}
