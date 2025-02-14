package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phoneno=req.getParameter("phoneno");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
//			System.out.println(name+" "+email+" "+phoneno+" "+password+" "+check);
		
			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhoneno(phoneno);
			us.setPassword(password);
			
			HttpSession Session=req.getSession();
			
			if(check!=null) {
				
			
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
			boolean f=dao.userRegister(us);
			if(f=true) {
//				System.out.println("User Register Success");
				Session.setAttribute("succMsg","Registration Successfully");
				resp.sendRedirect("register.jsp");
			}
			else
			{
//				System.out.println("Something went Wrong on server");
				Session.setAttribute("failedMsg","Something Wrong on Server");
				resp.sendRedirect("register.jsp");
			}
		
		} 
			else {
//				System.out.println("Please Check Agree & Terms Condition");
				Session.setAttribute("failedMsg","Please Check Agree & Terms Condition");
				resp.sendRedirect("register.jsp");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
