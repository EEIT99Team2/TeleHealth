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

import advisory.model.AdvisoryBean;
import advisorymoment.model.AdvisoryMomentBean;
import advisorymoment.model.AdvisoryTypeBean;
import advisorymoment.model.EmployeesBean;
import healthcolumn.model.HealthColumnBean;
import healthcolumn.model.QuestionBean;
import healthpassport.model.BMIBean;
import healthpassport.model.BloodPressureBean;
import healthpassport.model.BloodSugarBean;
import healthpassport.model.DataAnalysisBean;
import register.model.MemberBean;
import register.model.TestBean;
import takeoffrecords.model.TakeoffBean;

@Configuration
//本類別為普通Spring用，此處加入要掃描的套件名稱，多個用,隔開
@ComponentScan(basePackages = { 
		"advisorymoment.model",
		"register.model" ,
		"healthcolumn.model",  
		"advisory.model",
		"advisory.dao",
		"healthpassport.model",
		"takeoffrecords.model"})
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
		builder.addAnnotatedClasses(AdvisoryMomentBean.class,AdvisoryTypeBean.class,EmployeesBean.class,DataAnalysisBean.class,HealthColumnBean.class,QuestionBean.class,AdvisoryBean.class,BMIBean.class,BloodPressureBean.class,BloodSugarBean.class,MemberBean.class,TestBean.class,TakeoffBean.class);		
		
		return builder.buildSessionFactory();
	}
	
	@Bean
	public HibernateTransactionManager transactionManager() {
		System.out.println("HibernateTransactionManager");
		return new HibernateTransactionManager(sessionFactory());
	}
	
}
