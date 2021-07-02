package com.spring.web;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@SpringBootApplication
@MapperScan
public class Santa01Application {

	public static void main(String[] args) {
		SpringApplication.run(Santa01Application.class, args);
	}

	
	 @Bean
	    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {

	        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
	        sessionFactory.setDataSource(dataSource);
	        org.springframework.core.io.Resource[] res= new PathMatchingResourcePatternResolver().getResources("classpath:/mapper/*.xml");
	       sessionFactory.setMapperLocations(res);
	        
	        return sessionFactory.getObject();
	    }

	    @Bean
	    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
	        return new SqlSessionTemplate(sqlSessionFactory);
	    }
}
