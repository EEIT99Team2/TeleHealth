package model.spring;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.XmlViewResolver;

import util.FormTokenInterceptor;

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
	
	
	//FormTokenInterceptor攔截器用於判斷同一表單是否二次傳送
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new FormTokenInterceptor()).addPathPatterns("/*");
	}

	//設定檔案上傳的大小及編碼方式
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(10485760);
		return resolver;
	}
}
