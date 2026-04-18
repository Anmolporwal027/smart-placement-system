package com.spring.config;

import java.util.Properties;
import javax.sql.DataSource;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class HibernateConfig {

    @Bean
    public DataSource dataSource() {
        HikariDataSource ds = new HikariDataSource();
        ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
        
        // These will be read from Render's Environment Variables
        String dbUrl = System.getenv("DB_URL");
        String dbUser = System.getenv("DB_USER");
        String dbPass = System.getenv("DB_PASS");

        // If environment variables are not found (local), use your local DB
        ds.setJdbcUrl(dbUrl != null ? dbUrl : "jdbc:mysql://localhost:3306/placement_db?useSSL=false");
        ds.setUsername(dbUser != null ? dbUser : "root");
        ds.setPassword(dbPass != null ? dbPass : "root");
        
        return ds;
    }

    @Bean
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean sf = new LocalSessionFactoryBean();
        sf.setDataSource(dataSource());
        sf.setPackagesToScan("com.spring.entity");
        Properties p = new Properties();
        p.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
        p.put("hibernate.show_sql", "true");
        p.put("hibernate.hbm2ddl.auto", "update"); // Crucial: This will create the LONGBLOB column automatically
        sf.setHibernateProperties(p);
        return sf;
    }

    @Bean
    public PlatformTransactionManager transactionManager() {
        HibernateTransactionManager tm = new HibernateTransactionManager();
        tm.setSessionFactory(sessionFactory().getObject());
        return tm;
    }
}