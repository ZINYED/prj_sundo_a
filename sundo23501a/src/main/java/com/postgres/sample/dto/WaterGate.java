package com.postgres.sample.dto;

import lombok.Data;

@Data
public class WaterGate {
//	하천코드(PK)		N/A	VARCHAR(30)
//	하천명			N/A	VARCHAR(100)
//	하천주소			N/A	VARCHAR(1000)
//	하천세부주소		N/A	VARCHAR(500)
//	위도				N/A	INTEGER
//	경도				N/A	INTEGER

	private String 		river_code;
	private String 		river_name;
	private String 		river_addr;
	private String 		river_detail_addr;
	private Double 		latitude;
	private Double 		longitude;


}
