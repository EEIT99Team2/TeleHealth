package spring;

//本類別為普通Spring用，此處加入要掃描的套件名稱，多個用,隔開

//此處加入相關的Bean  例如MemberBean.class等，中間用"逗號,"隔開
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import advisoryMoment.model.AdvisoryMomentBean;
import advisoryMoment.model.AdvisoryTypeBean;
import advisoryMoment.model.EmployeesBean;
import model.analysisRecordsBean;
import model.dataanalysisBean;

@Configuration
//本類別為普通Spring用，此處加入要掃描的套件名稱，多個用,隔開
@ComponentScan(basePackages = { "advisoryMoment", "register.model" ,"Healthcolumn.model", "Healthcolumn.modelDao", "model"})
@EnableTransactionManagement
public class SpringJavaConfiguration {
	@Bean
	public DataSource dataSource() {
		try {
			Context ctx = new InitialContext();
			return (DataSource) ctx.lookup("java:comp/env/jdbc/TeleHealthDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Bean
	public SessionFactory sessionFactory() {
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource());
		Properties props = new Properties();
		props.setProperty("hibernate.dialect", "org.hibernate.dialect.SQLServerDialect");
		props.setProperty("hibernate.show_sql", "true");
		builder.addProperties(props);
		//此處加入相關的Bean  例如MemberBean.class等，中間用"逗號,"隔開
		builder.addAnnotatedClasses(AdvisoryMomentBean.class,AdvisoryTypeBean.class,EmployeesBean.class,dataanalysisBean.class,analysisRecordsBean.class);		
		
		return builder.buildSessionFactory();
	}
	
	@Bean
	public HibernateTransactionManager transactionManager() {
		System.out.println("HibernateTransactionManager");
		return new HibernateTransactionManager(sessionFactory());
	}
	
}
