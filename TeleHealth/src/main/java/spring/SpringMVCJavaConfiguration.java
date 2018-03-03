package spring;

import javax.servlet.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.context.*;
import org.springframework.context.annotation.*;
import org.springframework.context.support.*;
import org.springframework.web.context.support.*;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.*;

//本類別為Web Spring用，此處加入要掃描的套件名稱，多個用,隔開

@ComponentScan(basePackages={"advisoryMoment.controller","register.controller","util.controller", "Healthcolumn.controller","dataAnalysis.controller"})
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
}
