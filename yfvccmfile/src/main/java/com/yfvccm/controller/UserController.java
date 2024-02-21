package com.yfvccm.controller;
import com.yfvccm.domain.User;
import com.yfvccm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.Jedis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * 用户登录和注销Controller
 */
@Controller
@PropertySource("classpath:file.properties")
public class UserController {
    @RequestMapping("/toMainPage")
    public String  toMainPage(){
        return "main";
    }
    @RequestMapping("/toupdatepass")
    public String  toupdatepass(){
        return "updatepassword";
    }

    //注入userService
    @Autowired
    private UserService userService;

    @Autowired
    private Jedis jedis;

    @Value("${errorTimeFinal}")
    private int errorTimeFinal;


    /*
   用户登录，首先检测是否有连续5次输错密码，如有15分分钟后才能再次尝试
    */
    @RequestMapping("/login")
    public String login(User user, HttpServletRequest request){
        HttpSession session= request.getSession();
        String account=request.getParameter("account");
        if(account.equals("")){
            return "redirect:/admin/login.jsp";
        }
        String flag=jedis.get(account);
        if(flag!=null){                                               //测试是否已经连续5次输错密码
            request.setAttribute("msg","密码错误次数过多，15分钟后再试");
            return  "forward:/admin/login.jsp";
        }
        User u=userService.login(user);
        if(u!=null){                             //密码正确
              session.setAttribute("USER_SESSION",u);

            System.out.println("-----------------"+u.getPassword()+"paas");
            System.out.println("-----------------"+u.getAccount());
              session.setAttribute("account",u.getAccount());
              userService.updateErrorTime(account,0);
              return "redirect:/admin/main.jsp";
         }
        User userError=userService.findByAccount(account);
        if(userError==null){
            request.setAttribute("msg","用户名或密码错误");
            return  "forward:/admin/login.jsp";
        }
        int errorTime=userError.getErrortime();
        String accountError=userError.getAccount();
        errorTime=errorTime+1;
        if(errorTime==5){
            jedis.setex(account,errorTimeFinal,"hour");
            userService.updateErrorTime(accountError,0);
            request.setAttribute("msg","密码错误次数过多，15分钟后再试");
            return  "forward:/admin/login.jsp";
        }
        request.setAttribute("msg","用户名或密码错误");
        userService.updateErrorTime(accountError,errorTime);
        return  "forward:/admin/login.jsp";
    }
    /*
    注销登录
     */
    @RequestMapping("/logout")
    public String logout( HttpServletRequest request){
        try {
            HttpSession session = request.getSession();
            //销毁Session
            session.invalidate();
            return  "forward:/admin/main.jsp";
        }catch(Exception e){
            e.printStackTrace();
            request.setAttribute("msg","系统错误");
            return  "forward:/admin/main.jsp";
        }
    }


    /*
    * 修改密码
    * */
    @RequestMapping("/updatepassword")
    @ResponseBody
    public void updatepassword(String oldpassword, String newpassword,HttpServletRequest request,HttpServletResponse response)throws Exception{
        int flag;
        User user= (User) request.getSession().getAttribute("USER_SESSION");
        if(user==null){
            flag=3;//尚未登录
            response.getWriter().print(flag);
            return;
        }
        user.setPassword(oldpassword);
        User u=userService.login(user);
        if(u==null){
            flag=1;//密码错误
        }else{
            flag=2;//密码正确
            userService.updatePassword(user.getId(),newpassword);
        }
        response.getWriter().print(flag);
    }
}
