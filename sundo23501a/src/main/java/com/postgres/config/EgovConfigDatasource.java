package com.postgres.config;

import javax.sql.DataSource;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

@Configuration
public class EgovConfigDatasource {

//	@Bean(name="dataSource")
//	public DataSource dataSource() {
//	    EmbeddedDatabaseBuilder builder = new EmbeddedDatabaseBuilder();
//	    return builder.setType(EmbeddedDatabaseType.HSQL).addScript("classpath:/db/sampledb.sql").build();
//	}
	
	
	/* spring.datasource 프리픽스로 시작하는 설정들을 읽어오기 위한 것입니다. */
    @ConfigurationProperties(prefix = "spring.datasource")
    @Bean
    public DataSource dataSource() {
        return DataSourceBuilder.create().build();
    }
}
