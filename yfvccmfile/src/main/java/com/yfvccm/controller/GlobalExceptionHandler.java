package com.yfvccm.controller;

import com.alibaba.druid.sql.visitor.functions.Now;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@ControllerAdvice
public class GlobalExceptionHandler {
    /**
     * 上传文件大小，处理异常。
     * 定义处理异常的方法，当异常发生后，执行这个方法
     * 处理NameException异常
     * @ExceptionHandler: 表示此方法处理相应的异常
     *               属性: value 表示异常的类型
     *               位置: 在方法的上面
     */
    @ExceptionHandler(value = MaxUploadSizeExceededException.class)
    public ModelAndView fileSizeException(Exception e) {
        Date date=new Date();
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(sdf.format(date));
        System.out.println(e.getMessage()+e.getStackTrace()+e.getCause());
        ModelAndView model=new ModelAndView();
        model.setViewName("information");
        model.addObject("info","上传失败！"+"<br>"+"上传的文件不能大于50M");
        return model;
    }
    @ExceptionHandler(value = DataIntegrityViolationException.class)
    public ModelAndView fileTitleException(Exception e) {
        Date date=new Date();
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(sdf.format(date));
        System.out.println(e.getMessage()+e.getStackTrace()+e.getCause());
        ModelAndView model=new ModelAndView();
        model.setViewName("information");
        model.addObject("info","上传失败！"+"<br>"+"文件字符长度不能超过100字符");
        return model;
    }
    @ExceptionHandler(value = Exception.class)
    public ModelAndView globalException(Exception e) {
        Date date=new Date();
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(sdf.format(date));
        System.out.println(e.getMessage()+e.getStackTrace()+e.getCause());
        ModelAndView model=new ModelAndView();
        model.setViewName("information");
        model.addObject("info","系统繁忙，请联系系统管理员");
        return model;
    }
}
