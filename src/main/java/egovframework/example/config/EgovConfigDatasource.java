package egovframework.example.config;

import javax.sql.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

@Configuration
public class EgovConfigDatasource {

	/*
	 * @Bean(name="dataSource") public DataSource dataSource() {
	 * EmbeddedDatabaseBuilder builder = new EmbeddedDatabaseBuilder(); return
	 * builder.setType(EmbeddedDatabaseType.HSQL).addScript(
	 * "classpath:/db/sampledb.sql").build(); }
	 */
	
	/*
	 * @Bean(name = "dataSource") public DataSource dataSource() {
	 * DriverManagerDataSource dataSource = new DriverManagerDataSource();
	 * dataSource.setDriverClassName("oracle.jdbc.OracleDriver");
	 * dataSource.setUrl("jdbc:oracle:thin:@//127.0.0.1:1521/xe");
	 * dataSource.setUsername("scott"); dataSource.setPassword("tiger"); return
	 * dataSource; }
	 */
    
    @Bean(name = "dataSource")
    public DataSource dataSource() {
    	DriverManagerDataSource dataSource = new DriverManagerDataSource();
    	dataSource.setDriverClassName("org.postgresql.Driver");
    	dataSource.setUrl("jdbc:postgresql://localhost:5432/postgres");
    	dataSource.setUsername("postgres");
    	dataSource.setPassword("admin");
    	return dataSource;
    }

}
