package com.yfvccm.controller;
import com.yfvccm.domain.File;
import com.yfvccm.domain.User;
import com.yfvccm.interceptor.ResourcesInterceptor;
import com.yfvccm.service.FileService;
import entity.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/*
图书信息Controller
 */
@Controller
@RequestMapping("/file")
@PropertySource("classpath:file.properties")
public class FileController {
    //注入BookService对象
    @Autowired
    private FileService fileService;

    @Autowired
    private ResourcesInterceptor res;

    @Value("${storePath}")
    private String storePath;

    /**
     * /查询各部门最新的5个的文件信息
     */
    @RequestMapping("/selectNewFiles")
    public ModelAndView selectNewFiles(HttpSession session) {
        System.out.println("++++++++++++++++++++++"+session.getAttribute("account"));
        int pageNum = 1;
        int pageSize = 5;
        PageResult zuzhirenshiPageResult = fileService.findByDepartment(pageNum, pageSize,"zuzhirenshi");
        PageResult jiaowubuPageResult = fileService.findByDepartment(pageNum, pageSize,"jiaowubu");
        PageResult dangzhengbanPageResult = fileService.findByDepartment(pageNum, pageSize,"dangzhengban");
        PageResult zongwubuPageResult = fileService.findByDepartment(pageNum, pageSize,"zongwubu");
//        PageResult xinxizhongxinPageResult = fileService.findByDepartment(pageNum, pageSize,"xinxizhongxin");
        PageResult caiwubuPageResult = fileService.findByDepartment(pageNum, pageSize,"caiwubu");
        PageResult xueshengchuPageResult = fileService.findByDepartment(pageNum, pageSize,"xueshengchu");
        System.out.println(xueshengchuPageResult.getRows()+"==============================112");
//        PageResult tushuguanPageResult = fileService.findByDepartment(pageNum, pageSize,"tushuguan");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("files_new");
        modelAndView.addObject("caiwubuPageResult", caiwubuPageResult);
        modelAndView.addObject("zuzhirenshiPageResult", zuzhirenshiPageResult);
        modelAndView.addObject("jiaowubuPageResult", jiaowubuPageResult);
        modelAndView.addObject("dangzhengbanPageResult", dangzhengbanPageResult);
        modelAndView.addObject("zongwubuPageResult", zongwubuPageResult);
//        modelAndView.addObject("xinxizhongxinPageResult", xinxizhongxinPageResult);
        modelAndView.addObject("xueshengchuPageResult", xueshengchuPageResult);
//        modelAndView.addObject("tushuguanPageResult", tushuguanPageResult);
        return modelAndView;
    }

   @RequestMapping("/uploadJump")
    public String uploadJump() {
       return "uploadFile";
    }

    @RequestMapping("/findById")
    public ModelAndView findFIleById(@RequestParam String fileid) {
        System.out.println(fileid+"==================");
        File file=fileService.findById(fileid);
        String[] filename=file.getFilename().split("\\.");
        String fileType=filename[filename.length - 1];
        //获取文件的类型
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("file_detail");
        modelAndView.addObject("file", file);
        modelAndView.addObject("fileType", fileType);
        return modelAndView;
    }

    //删除文件，包括数据库中的记录和文件夹下的文件
    @RequestMapping("/deleteById")
    public ModelAndView deleteFIleById(@RequestParam String fileid,HttpServletRequest request) {
        ModelAndView model=new ModelAndView();
        model.setViewName("information");
        User user=(User) request.getSession().getAttribute("USER_SESSION");
        File file = fileService.findById(fileid);
        if(!user.getAccount().equals(file.getAuthor())&&!user.getAccount().equals("ADMIN"))
        {
            System.out.println(user.getAccount()+"=========="+file.getAuthor());
            model.addObject("info","您无权删除此文件1");
            return model;
        }
        fileService.deleteById(fileid);
        String  department=file.getFilepath().substring(file.getFilepath().lastIndexOf("/")+1,file.getFilepath().length());
//        String Path="D:\\backup\\"+department+"\\"+fileid+"."+file.getType();
        String Path=storePath+"\\"+department+"\\"+fileid+"."+file.getType();
        java.io.File file1 = new java.io.File(Path);
        // 路径为文件且不为空则进行删除
        if (file1.isFile() && file1.exists()) {
            file1.delete();
        }
        model.addObject("info","删除成功");
        return model;
    }

    @RequestMapping("/search")
    public ModelAndView search(@RequestParam String queryStr,Integer pageSize,Integer pageNum) {
        String queryArray[]=queryStr.trim().split("\\s+");
        String queryStr0=new String();
        String queryStr1=new String();
        String queryStr2=new String();
        String queryStr3=new String();
        if(queryArray.length>0) queryStr0=queryArray[0];
        if(queryArray.length>1) queryStr1=queryArray[1];
        if(queryArray.length>2) queryStr2=queryArray[2];
        if(queryArray.length>3) queryStr3=queryArray[3];
        //查询最新上架的5个的文件信息
        if(pageNum==null) pageNum = 1;
        if(pageSize==null) pageSize = 10;
        PageResult pageResult = fileService.searchFiles(pageNum, pageSize,queryStr0,queryStr1,queryStr2,queryStr3);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("search");
        modelAndView.addObject("pageResult", pageResult);
        modelAndView.addObject("queryStr", queryStr);
        modelAndView.addObject("sumPage", (int)Math.ceil((double)pageResult.getTotal()/pageSize));
        modelAndView.addObject("pageNum", pageNum);
        modelAndView.addObject("pageSize", pageSize);
        return modelAndView;
    }

    @RequestMapping("/deptmentFiles")
    public ModelAndView deptmentFiles(@RequestParam("department") String department,Integer pageNum,HttpServletRequest request) {
        HttpSession session= request.getSession();
        System.out.println("----------------------"+session.getAttribute("account"));
        String deptChinese=request.getParameter("deptChinese");
        //查询部门最新的10个的文件信息
        if(pageNum==null) pageNum = 1;
        int pageSize = 10;
        PageResult deptmentResult = fileService.findDeiltDepartment(pageNum, pageSize,department);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("department");
        modelAndView.addObject("pageResult", deptmentResult);
        modelAndView.addObject("sumPage", (int)Math.ceil((double)deptmentResult.getTotal()/pageSize));
        modelAndView.addObject("pageNum", pageNum);
        modelAndView.addObject("department", department);
        modelAndView.addObject("deptChinese", deptChinese);
        modelAndView.addObject("gourl","/file/deptmentFiles");
        return modelAndView;
    }



    @RequestMapping("/fileupload")
    public ModelAndView upload(HttpServletRequest request,@RequestParam("mulfile") MultipartFile mulfile,
                               @RequestParam("filename")String filename) throws Exception {
        ModelAndView model=new ModelAndView();
        model.setViewName("information");
        User user=(User) request.getSession().getAttribute("USER_SESSION");
        if(user==null)
        {
            model.addObject("info","尚未登录，请登录");
            return model;
        }
        String  department=user.getAccount();    //获取上传者部门，将文件存储至该部门下的文件夹下，如组织部的人员上传的文件放在/filepath/zuzhi/文件夹下
//        String format = sdf.format(new Date());
//        String realPath =storePath+"\\"+ department+"\\";//文件存放位置
        String realPath=makefile(department);
        String oldName = mulfile.getOriginalFilename();
        String type=oldName.substring(oldName.lastIndexOf(".")+1,oldName.length());//获取文件类型
        if(!filename.trim().isEmpty())
        {
            oldName=filename.trim();//上传者填写的文件名称作为mysql中存储的正式文件名
        }else{
            oldName=oldName.substring(0,oldName.lastIndexOf("."));
        }
        String newID = UUID.randomUUID().toString();//uuid.romdom作为数据库中文件主键ID
        String newName=oldName+newID.substring(0,7)+"."+type;//uuid+文件后缀构成存储在服务器中文件的最终名称
        java.io.File file = new java.io.File(realPath);
        mulfile.transferTo(new java.io.File(file,newName));
        File fileRecord=new File();
        fileRecord.setFileid(newID);//uuid.romdom作为文件id
        fileRecord.setFilename(oldName);
        fileRecord.setAuthor(user.getAccount());
        Date date=new Date();
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        fileRecord.setUploadtime(sdf.format(date));//上传时间
//        String filepath="/filepath/"+department;//文件存放路径，如组织部的人员上传的文件放在/filepath/zuzhi/文件夹下
        String filepath="/filepath"+realPath.substring(realPath.indexOf("/"));
        fileRecord.setFilepath(filepath);
        fileRecord.setType(type);
        fileRecord.setSize(mulfile.getSize());//文件大小
        fileService.insertFile(fileRecord);//文件类型
        model.addObject("info","上传成功");
        return model;
    }

    //创建文件夹
    public String makefile(String department){
        // 获取当前日期
        LocalDate currentDate = LocalDate.now();
        // 获取当前日期的年、月、日
        int year = currentDate.getYear();
        int month = currentDate.getMonthValue();
        int day = currentDate.getDayOfMonth();
        String realPath =storePath+"/"+ department+"/"+year+"/"+month+"/"+day;//文件存放位置
        java.io.File folder = new java.io.File (realPath);
        if (!folder.exists()) { // 如果文件夹不存在则进行创建
            boolean success = folder.mkdirs(); // 递归地创建所有必需的上级目录
        }
        return realPath;
    }

}



