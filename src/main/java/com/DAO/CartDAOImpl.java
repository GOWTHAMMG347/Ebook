package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDts;
import com.entity.Cart;
import com.mysql.cj.protocol.Resultset;

public class CartDAOImpl implements CartDAO{

	private Connection conn;
	
	public CartDAOImpl(Connection conn)
	{
		this.conn=conn;
	}
	
	public boolean addCart(Cart c) {
		boolean f=false;
		try {
			String sql="insert into Cart(cid,bid,uid,bookName,author,price,total_price) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, c.getCid());
			ps.setInt(2, c.getBid());
			ps.setInt(3, c.getUserId());
			ps.setString(4,c.getBookName());
			ps.setString(5,c.getAuthor());
			ps.setDouble(6,c.getPrice());
			ps.setDouble(7,c.getTotalPrice());
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Cart> getBookByUser(int userid) {
		List<Cart> list=new ArrayList<Cart>();
		Cart b=null;
		double totalPrice=0;
		try {
			String sql="select * from cart where uid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,userid);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new Cart();
				b.setCid(rs.getInt(1));
				b.setBid(rs.getInt(2));
				b.setUserId(rs.getInt(3));
				b.setBookName(rs.getString(4));
				b.setAuthor(rs.getString(5));
				b.setPrice(rs.getDouble(6));
				
				totalPrice=totalPrice+rs.getDouble(7);
				b.setTotalPrice(totalPrice);
				list.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean deleteBook(int bid,int uid) {
		boolean f=false;
		String sql="delete from cart where bid=? and uid=?";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setInt(2, uid);
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


}
