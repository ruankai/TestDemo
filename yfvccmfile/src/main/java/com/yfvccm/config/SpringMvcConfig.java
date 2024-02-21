package com.yfvccm.config;


import com.yfvccm.interceptor.ResourcesInterceptor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.*;

import java.util.List;

@Configuration
@PropertySource("classpath:ignoreUrl.properties")
//等同于<context:component-scan base-package="com.yfvccm.controller"/>
@ComponentScan({"com.yfvccm.controller"})
/*@Import({MyWebMvcConfig.class})*/
@EnableWebMvc
@PropertySource("classpath:file.properties")
public class SpringMvcConfig  implements WebMvcConfigurer  {
    @Value("#{'${ignoreUrl}'.split(',')}")
    private List<String> ignoreUrl;

    @Value("${uploadMax}")
    private int uploadMax;
    @Bean
    public ResourcesInterceptor resourcesInterceptor(){
        return new ResourcesInterceptor(ignoreUrl);
    }
    /*
      文件上传参数设置
       */
    @Bean
    public CommonsMultipartResolver multipartResolver(){
        CommonsMultipartResolver com=new CommonsMultipartResolver();
        com.setDefaultEncoding("UTF-8"); //语言设置为utf-8
        com.setMaxUploadSize(uploadMax);//限制上传文件大小设置为 1024*1024*50=50M
        return  com;
    }


    /*
     * 在注册的拦截器类中添加自定义拦截器
     * addPathPatterns()方法设置拦截的路径
     * excludePathPatterns()方法设置不拦截的路径
     */
//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
////        registry.addInterceptor( resourcesInterceptor()).addPathPatterns("/**").excludePathPatterns("/css/**","/js/**","/img/**");
//        registry.addInterceptor( resourcesInterceptor()).addPathPatterns("/**").excludePathPatterns("/css/**","/admin/**","/js/**","/img/**");
//    }

    /*
     *开启对静态资源的访问
     * 类似在Spring MVC的配置文件中设置<mvc:default-servlet-handler/>元素
     */
    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.jsp("/admin/",".jsp");
    }

}




