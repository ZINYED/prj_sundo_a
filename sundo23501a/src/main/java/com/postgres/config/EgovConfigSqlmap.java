package com.postgres.config;

import javax.sql.DataSource;
import org.egovframe.rte.psl.orm.ibatis.SqlMapClientFactoryBean;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@SuppressWarnings("deprecation")
@Configuration
public class EgovConfigSqlmap {

	//		db xml 위치 지정
	@Bean
	public SqlMapClientFactoryBean sqlMapClient(@Qualifier("dataSource") DataSource dataSource) {
		PathMatchingResourcePatternResolver pmrpr = new PathMatchingResourcePatternResolver();
		SqlMapClientFactoryBean sqlMapClientFactoryBean = new SqlMapClientFactoryBean();
		sqlMapClientFactoryBean.setDataSource(dataSource);
		sqlMapClientFactoryBean.setConfigLocation(pmrpr.getResource("classpath:/egovframework/sqlmap/example/sql-mapper-config.xml"));
		return sqlMapClientFactoryBean;
	}

}
