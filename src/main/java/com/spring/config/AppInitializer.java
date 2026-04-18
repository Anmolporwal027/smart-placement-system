package com.spring.config;

import jakarta.servlet.MultipartConfigElement;
import jakarta.servlet.ServletRegistration;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
    
    protected Class<?>[] getRootConfigClasses() { 
        return new Class[] { HibernateConfig.class }; 
    }
    
    protected Class<?>[] getServletConfigClasses() { 
        return new Class[] { AppConfig.class }; 
    }
    
    protected String[] getServletMappings() { 
        return new String[] { "/" }; 
    }


    @Override
    protected void customizeRegistration(ServletRegistration.Dynamic registration) {
        MultipartConfigElement multipartConfigElement = new MultipartConfigElement(
                null, 5 * 1024 * 1024, 10 * 1024 * 1024, 0);
        
        registration.setMultipartConfig(multipartConfigElement);
    }
}