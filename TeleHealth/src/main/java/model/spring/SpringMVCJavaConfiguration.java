package model.spring;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.XmlViewResolver;

@Configuration
@ComponentScan(basePackages={"register.controller", "util.controller"})
@EnableWebMvc
public class SpringMVCJavaConfiguration implements WebMvcConfigurer {
//	@Bean
//	public MessageSource messageSource() {
//		ResourceBundleMessageSource rbms = new ResourceBundleMessageSource();
//		rbms.setBasename("i18n.message");
//		return rbms;
//	}
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		registry.addInterceptor(
//				new DemoHandlerInterceptor()).addPathPatterns("/secure/*");
//	}
	
	@Autowired
	private ServletContext applicaton;
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		ServletContextResource resource = 
				new ServletContextResource(applicaton, "/WEB-INF/views.xml");
		XmlViewResolver viewResolver = new XmlViewResolver();
		viewResolver.setLocation(resource);
		viewResolver.setOrder(10);
				
		registry.viewResolver(viewResolver);
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(10485760);
		return resolver;
	}
}
