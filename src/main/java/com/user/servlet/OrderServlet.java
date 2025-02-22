package com.user.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("username");
			String email=req.getParameter("email");
			String phoneno=req.getParameter("phoneno");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pincode=req.getParameter("pincode");
			String payment=req.getParameter("payment");
			
			
			String fulladd=address+","+landmark+","+city+","+state+","+pincode;
			System.out.println(name+""+email+""+phoneno+""+fulladd+""+payment);
			CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
			List<Cart> blist=dao.getBookByUser(0);
			if("noselect".equals(payment))
			{
				resp.sendRedirect("checkout.jsp");
			}
			else
			{
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
