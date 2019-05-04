/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.LoginDao;
import test.UserInfo;

public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8"); // 设置请求的字符编码格式，与JSP登陆界面的字符编码保持一致

        /** 以下是获得表单提交过来的值 **/
        String name = request.getParameter("name");
        String pwd = request.getParameter("pwd");
        String sex = request.getParameter("sex");
        String age = request.getParameter("age");
        int userAge = 0;
        if (age != null && !age.equals("")) {
            userAge = Integer.parseInt(age);
        }
        String email = request.getParameter("email");

        /** 以下代码将获得的表单值封装到用户信息对象中 **/
        UserInfo user = new UserInfo();
        user.setUserName(name);
        user.setUserPwd(pwd);
        user.setUserSex(sex);
        user.setUserAge(userAge);
        user.setEmail(email);
        boolean flag = LoginDao.getInstance().saveUser(user); // 将用户注册信息保存到数据库
        // [request.getRequestDispatcher]和[response.sendRedirect]两种请求转发的区别：
        // 前者转发时，URL地址不会改变，而后者转发时URL会发生变化。其次，前者的请求响应为同一个，而后者是重新创建新的请求与响应对象。
        if(flag){       // 当注册成功时，转发到success.jsp页面
            request.getSession().setAttribute("userName", user.getUserName());
            request.getRequestDispatcher("success.jsp").forward(request, response);
        }else{      // 否则，转发到errorpage.jsp页面，显示错误信息！
            response.sendRedirect("errorpage.jsp");
        }
    }

}


