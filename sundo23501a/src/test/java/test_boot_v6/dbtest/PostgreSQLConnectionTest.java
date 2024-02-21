package test_boot_v6.dbtest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.postgres.config.EgovConfig;

public class PostgreSQLConnectionTest {
	// PostgreSQL Connector의 클래스. DB 연결 드라이버 정의
	private static final String DRIVER = "org.postgresql.Driver";
	// DB 경로
	private static final String URL = "jdbc:postgresql://localhost:5432/opentutorials";
	private static final String USER = "postgres";
	private static final String PASSWORD = "tiger";

    @Test
    public void testConnection() throws Exception {
        // DBMS에게 DB 연결 드라이버의 위치를 알려주기 위한 메소드
        Class.forName(DRIVER);
        try {
            Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println(connection);
            System.out.println("연동 성공");
            
            // 여기서부터는 특정 테이블을 조회하는 코드를 추가
            String query = "SELECT * FROM test_board";
            try (Statement statement = connection.createStatement();
                 ResultSet resultSet = statement.executeQuery(query)) {
                while (resultSet.next()) {
                    // 행(row)의 데이터를 가져오는 코드
                    String column1Data = resultSet.getString("name");
                    String column2Data = resultSet.getString("age");

                    System.out.println("Column1: " + column1Data + ", Column2: " + column2Data);
                }
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//name=boardDAO object=org.apache.ibatis.binding.MapperProxy@365cdacf
//name=boardDAOv2 object=org.apache.ibatis.binding.MapperProxy@303c55fa
    @Test
    @DisplayName("모든 빈 출력하기")
    void findAllBean() {
        AnnotationConfigApplicationContext ac = new AnnotationConfigApplicationContext(EgovConfig.class);

        String[] beanDefinitionNames = ac.getBeanDefinitionNames();
        for (String beanDefinitionName : beanDefinitionNames) {
            Object bean = ac.getBean(beanDefinitionName);
            System.out.println("name=" + beanDefinitionName + " object=" +bean);
        }
    }
    
    @Test
    @DisplayName("애플리케이션 빈 출력하기")
    void findApplicationBean() {AnnotationConfigApplicationContext ac = new AnnotationConfigApplicationContext(EgovConfig.class);

        String[] beanDefinitionNames = ac.getBeanDefinitionNames();
        for (String beanDefinitionName : beanDefinitionNames) {
            BeanDefinition beanDefinition = ac.getBeanDefinition(beanDefinitionName);
    //Role ROLE_APPLICATION: 직접 등록한 애플리케이션 빈
    //Role ROLE_INFRASTRUCTURE: 스프링이 내부에서 사용하는 빈
            if (beanDefinition.getRole() == BeanDefinition.ROLE_APPLICATION) {
                Object bean = ac.getBean(beanDefinitionName);
                System.out.println("name=" + beanDefinitionName + " object=" + bean);
            }
        }
    }
    
    
    @Test
    @DisplayName("부모 타입으로 모두 조회하기 - Object")
    void findAllBeanByObjectType() {AnnotationConfigApplicationContext ac = new AnnotationConfigApplicationContext(EgovConfig.class);

        Map<String, Object> beansOfType = ac.getBeansOfType(Object.class);
        for (String key : beansOfType.keySet()) {
            System.out.println("key = " + key + " value=" + beansOfType.get(key));
        }
     }
}
