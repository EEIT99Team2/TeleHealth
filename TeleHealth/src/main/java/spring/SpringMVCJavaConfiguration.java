package spring;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.XmlViewResolver;

//本類別為Web Spring用，此處加入要掃描的套件名稱，多個用,隔開
@ComponentScan(basePackages={"advisorymoment.controller","register.controller","util.controller", "healthcolumn.controller","dataanalysis.controller","advisory.controller",})
@EnableWebMvc
public class SpringMVCJavaConfiguration implements WebMvcConfigurer {
	@Autowired
	private ServletContext applicaton;
	
	//i18n多國語係用，請在setBasename內加入properties檔名
	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource rbms = new ResourceBundleMessageSource();
		//rbms.setBasename("i18n.message");
		return rbms;
	}
	
	//本方法為註冊要使用的ViewResolver，專題專案使用XmlViewResolver
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		ServletContextResource resource = 
				new ServletContextResource(applicaton, "/WEB-INF/views.xml");
		XmlViewResolver viewResolver = new XmlViewResolver();
		viewResolver.setLocation(resource);
		viewResolver.setOrder(10);
				
		registry.viewResolver(viewResolver);
	}
	
	//檔案上傳用的設定，請勿隨意更動
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(102400000);
		return resolver;
	}
}
