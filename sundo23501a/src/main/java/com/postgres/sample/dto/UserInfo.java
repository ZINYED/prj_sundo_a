package com.postgres.sample.dto;

import java.util.Date;

//import javax.validation.constraints.Email;
//import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springmodules.validation.bean.conf.loader.annotation.handler.Email;
import org.springmodules.validation.bean.conf.loader.annotation.handler.NotBlank;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserInfo {
	@NotBlank(message = "아이디를 입력해 주세요.")
	@Size(min = 5, max = 20, message = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.")
	@Pattern(regexp = "^(?!.*([a-zA-Z0-9\\\\-_])\\1\\1\\1)[a-zA-Z0-9\\\\-_]{5,20}$", message = "사용할 수 없는 아이디입니다. 다른 아이디를 입력해 주세요.")
	private String 	user_id;

	@NotBlank(message = "비밀번호를 입력해 주세요.")
	@Size(min = 8, max = 20, message = "비밀번호는 8자 이상 20자 이하로 입력해주세요.")
	@Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$", message = "적어도 하나의 숫자와 영문자 그리고 특수문자가 포함되어야 합니다.")
	private String 	user_pw;

	private String 	system_category;

	@NotBlank(message = "이름을 입력해 주세요.")
	@Size(min = 3, max = 10, message = "3자 이상 10자 이하로 입력해주세요.")
	private String 	user_name;

	@NotBlank(message = "전화번호를 입력해 주세요.")
	@Pattern(regexp = "(01[016789])[-]?(\\d{3,4})[-]?(\\d{4})", message = "휴대폰 번호 바르게 입력해 주세요.")
	private String 	user_tel;

	@NotBlank(message = "이메일을 입력해 주세요.")
	@Email(message = "이메일 주소를 바르게 입력해 주세요.")
	private String 	user_email;

	private String	org_code;
	private String 	user_department;
	private String	user_position;

	private String	use_flag;

	private Date	create_datetime;
	private Date	modify_datetime;

	// 조회용
	private String  search;
	private String  keyword;
	private String  pageNum;
	private int     total;

	private int		rn;					//목록 rownum번호
	private int     start;
	private int     end;
	private String 	system_name;
	private String	org_name;
}
